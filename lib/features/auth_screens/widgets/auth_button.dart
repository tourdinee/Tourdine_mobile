import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.callback,
    required this.text,
  }) : super(key: key);

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0x55ff0000),
            padding: const EdgeInsets.all(16)),
        child: Text(text, style: authButtonTextStyle),
      ),
    );
  }
}
