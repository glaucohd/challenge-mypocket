import 'package:flutter/material.dart';
import 'package:pocket_app/components/build_text_form_field.dart';
import 'package:pocket_app/resource/values.dart';
import 'package:pocket_app/routes/app_routes.dart';
import 'package:pocket_app/services/service.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Service service = Service();
  String accntType;
  bool inputTextEnabled = true;

  TextEditingController docNumberController = TextEditingController();
  TextEditingController activatationKeyController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> listAccntType = [
    'User',
    'Business',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      Values.welcome,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      Values.signInToContinue,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.account_balance_outlined,
                      size: 120,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildTextFormField(
                            inputTextEnabled,
                            docNumberController,
                            Values.docNumber,
                            mmaxLengtha: null,
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(5),
                            child: DropdownButton<String>(
                              focusColor: Colors.white,
                              autofocus: true,
                              value: accntType,
                              style: TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.black,
                              items: inputTextEnabled
                                  ? listAccntType.map<DropdownMenuItem<String>>(
                                      (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList()
                                  : null,
                              hint: Text(
                                Values.accountType,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              underline: SizedBox(),
                              isExpanded: true,
                              onChanged: (String value) {
                                setState(() {
                                  accntType = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          buildTextFormField(
                            inputTextEnabled,
                            activatationKeyController,
                            Values.accessKey,
                            mmaxLengtha: null,
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              Values.lostYourAccessKey,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffa71afd),
                                      Color(0xff726de1),
                                      Color(0xff1afea5),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth: double.infinity, minHeight: 50),
                                  child: inputTextEnabled
                                      ? Text(
                                          Values.access,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )
                                      : CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    inputTextEnabled = false;
                                  });

                                  bool loginConfirmed = await service.signIn(
                                    docNumberController.text,
                                    accntType,
                                    activatationKeyController.text,
                                  );

                                  if (loginConfirmed) {
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                        AppRouters.HOME_VIEW,
                                        arguments: service.user,
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      inputTextEnabled = true;
                                    });

                                    _showMyDialog(context,
                                        service.errorResult.errorMessage);
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context, messageContent) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Values.warning),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(messageContent),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(Values.tryAgain),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
