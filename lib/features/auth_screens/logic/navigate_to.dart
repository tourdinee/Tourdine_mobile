import 'package:flutter/material.dart';

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
