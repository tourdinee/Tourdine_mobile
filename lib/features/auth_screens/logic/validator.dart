import 'package:flutter/material.dart';

String? validate(String? value, String hintText) {
  if (hintText == "Email") {
    RegExp expression = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return expression.hasMatch(value!) ? null : "enter a valid email";
  }

  if (hintText == "Password") {
    return value!.length >= 6 ? null : "enter a valid password";
  }

  if (hintText == "Display Name") {
    return value!.length >= 2 ? null : "enter a valid display name";
  }

  return null;
}

void navigateTo(Widget screen, BuildContext context, [bool toGoBack = false]) {
  if (toGoBack) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
    return;
  }
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
    (route) => false,
  );
}
