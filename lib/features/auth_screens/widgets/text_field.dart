import 'package:flutter/material.dart';

import '../logic/validator.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isObscure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) => validate(val, widget.hintText),
      obscureText: widget.isObscure ? isVisible : false,
      enableSuggestions: false,
      keyboardType: (widget.hintText == "Email")
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: (widget.hintText == "Password")
            ? GestureDetector(
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
