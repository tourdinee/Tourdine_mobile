import 'package:flutter/material.dart';

import 'text_field.dart';

class SignInFormInputContainer extends StatelessWidget {
  const SignInFormInputContainer({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            hintText: "Email",
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: passwordController,
            hintText: "Password",
            isObscure: true,
          ),
        ],
      ),
    );
  }
}
