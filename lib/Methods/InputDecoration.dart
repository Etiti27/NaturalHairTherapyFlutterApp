import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';

InputDecoration InputDecor(String hintText, String label, Icon suffixIconn) {
  return InputDecoration(
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
      suffixIcon: suffixIconn);
}
