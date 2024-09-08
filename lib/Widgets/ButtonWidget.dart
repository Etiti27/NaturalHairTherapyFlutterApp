import 'package:flutter/material.dart';

import '../Constants.dart';

class FilledButtonWID extends StatelessWidget {
  FilledButtonWID({required this.text, required this.onpressed});
  Text text;
  VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: kPrimaryColor,
      ),
      onPressed: onpressed,
      child: text,
    );
  }
}
