import 'package:flutter/material.dart';

import '../../../helpers/loading/loading_screen.dart';

Future<void> navigateTo(Widget screen, BuildContext context,
    [bool toGoBack = false]) async {
  if (toGoBack) {
    LoadingScreen().show(context: context, text: "navigating");
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => LoadingScreen().hide(),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
    return;
  }
  LoadingScreen().show(context: context, text: "navigating");
  await Future.delayed(
    const Duration(milliseconds: 300),
    () => LoadingScreen().hide(),
  );
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
    (route) => false,
  );
}
