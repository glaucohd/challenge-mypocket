import 'package:flutter/material.dart';
import 'package:pocket_app/components/build_text_form_field.dart';
import 'package:pocket_app/components/menu_drawer.dart';
import 'package:pocket_app/models/account_user.dart';
import 'package:pocket_app/resource/values.dart';
import 'package:pocket_app/services/service.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Service service = Service();

  TextEditingController addressController = TextEditingController();
  TextEditingController addressComplementController = TextEditingController();
  TextEditingController addressNumberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String accntType;
  bool inputTextEnabled = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AccountUser accountUser =
        ModalRoute.of(context).settings.arguments as AccountUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Values.welcome),
          flexibleSpace: Container(
            decoration: BoxDecoration(
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
          ),
        ),
        drawer: MenuDrawer(),
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
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Olá ',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${accountUser.data.accntName}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ', tudo bem?'),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              Values.registrationUpdate,
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey.shade600),
                            ),
                            SizedBox(height: 20),
                            buildTextFormField(
                              inputTextEnabled,
                              addressController,
                              Values.address,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              addressComplementController,
                              Values.addressComplement,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              addressNumberController,
                              Values.addressNumber,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              neighborhoodController,
                              Values.neighborhood,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              cityController,
                              Values.city,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              stateController,
                              Values.state,
                              mmaxLengtha: 2,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              postalCodeController,
                              Values.postalCode,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 10),
                            buildTextFormField(
                              inputTextEnabled,
                              countryController,
                              Values.country,
                              mmaxLengtha: null,
                            ),
                            SizedBox(height: 20),
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
                                        maxWidth: double.infinity,
                                        minHeight: 50),
                                    child: Text(
                                      Values.save,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState.validate()) {
                                    var udpadteAccount =
                                        await service.updateAccount(
                                      addressController.text,
                                      addressComplementController.text,
                                      addressNumberController.text,
                                      neighborhoodController.text,
                                      cityController.text,
                                      stateController.text,
                                      postalCodeController.text,
                                      countryController.text,
                                    );

                                    if (udpadteAccount == true) {
                                      setState(() {
                                        addressController.text = "";
                                        addressComplementController.text = "";
                                        addressNumberController.text = "";
                                        neighborhoodController.text = "";
                                        cityController.text = "";
                                        stateController.text = "";
                                        countryController.text = "";
                                        postalCodeController.text = "";
                                      });

                                      _showMyDialog(service.alertResult, "ok");
                                    } else {
                                      _showMyDialog(
                                        service.errorUpdateAlert,
                                        Values.tryAgain,
                                      );
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
      ),
    );
  }

  Future<void> _showMyDialog(String bodyContext, String confirmed) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Values.warning),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(bodyContext),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(confirmed),
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
