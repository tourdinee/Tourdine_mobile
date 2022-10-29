import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';

import '../logic/logic.dart';

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
      autocorrect: (widget.hintText == "Password") ? false : true,
      cursorColor: const Color(0xffffffff),
      keyboardType: (widget.hintText == "Email")
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: textStyle1,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
        fillColor: const Color(0x44ffffff),
        filled: true,
        errorStyle: const TextStyle(color: Color(0xffffffff)),
        prefixIcon: Icon(
          (widget.hintText == "Name")
              ? Icons.person_outline
              : (widget.hintText == "Email")
                  ? Icons.email_outlined
                  : Icons.lock_outline,
          color: const Color(0xffffffff),
        ),
        hintText: widget.hintText,
        hintStyle: textStyle1,
        suffixIcon: (widget.hintText == "Password")
            ? GestureDetector(
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xffffffff),
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
