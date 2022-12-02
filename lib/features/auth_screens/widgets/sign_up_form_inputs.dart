import 'package:flutter/material.dart';

import 'text_field.dart';

class SignUpFormInputContainer extends StatelessWidget {
  const SignUpFormInputContainer({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

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
            controller: usernameController,
            hintText: "Display Name",
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: passwordController,
            isObscure: true,
            hintText: "Password",
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: confirmPasswordController,
            isObscure: true,
            hintText: "Confiirm Password",
          ),
        ],
      ),
    );
  }
}
