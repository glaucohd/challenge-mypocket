import 'package:flutter/material.dart';


Widget buildTextFormField(
    bool inputTextEnabled, TextEditingController controller, String labelText,
    {int mmaxLengtha = 0}) {
  return TextFormField(
    

    maxLength: mmaxLengtha,
    enabled: inputTextEnabled,
    controller: controller,
    style: TextStyle(
        color: inputTextEnabled ? Colors.black : Colors.grey.shade400),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400)),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Verifique o campo $labelText';
      }
      return null;
    },
  );
}
