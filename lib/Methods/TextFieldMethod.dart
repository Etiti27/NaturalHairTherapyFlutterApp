import 'package:flutter/material.dart';

import '../Constants.dart';

TextField TextFieldMethod({
  required bool autoFocus,
  required String hintText,
  required String label,
  required Icon suffixIcon,
  required ValueChanged<String> onchanges,
  required TextInputType keyboardType,
  required TextEditingController textController,
  bool obsecure = false,
}) {
  return TextField(
    onChanged: onchanges,
    controller: textController,
    obscureText: obsecure,
    autofocus: autoFocus,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      focusColor: kPrimaryColor,
      hintText: hintText,
      label: Text(label),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
          width: 3.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      suffixIcon: suffixIcon,
    ),
  );
}
