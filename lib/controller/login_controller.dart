import 'package:flutter/material.dart';
import 'package:pocket_app/resource/values.dart';

class LoginController {

  Future<void> showMyDialog(context, messageContent) async {
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