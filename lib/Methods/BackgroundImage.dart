import 'package:flutter/material.dart';

BoxDecoration BackgroundImage() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/logo.png"),
      fit: BoxFit.fill,
      opacity: 0.3,
    ),
  );
}
