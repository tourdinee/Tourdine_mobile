import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';

import '../../../constants/color.dart';
import '../logic/logic.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.isObscure = false,
      this.confirmText = ""})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final String confirmText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) => validate(val, widget.confirmText),
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
            OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
        fillColor: const Color(0x44ffffff),
        filled: true,
        errorStyle: const TextStyle(color: Color(0xffffffff)),
        prefixIcon: Icon(
          (widget.hintText.contains("Name"))
              ? Icons.person_outline
              : (widget.hintText.contains("Email"))
                  ? Icons.email_outlined
                  : Icons.lock_outline,
          color: const Color(0xffffffff),
        ),
        hintText: widget.hintText,
        hintStyle: textStyle1,
        suffixIcon: (widget.hintText.contains("Password"))
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
