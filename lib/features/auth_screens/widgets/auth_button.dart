import 'package:flutter/material.dart';

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
      height: 40,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0x55ff0000),
        ),
        child: const Text("Create Account"),
      ),
    );
  }
}
