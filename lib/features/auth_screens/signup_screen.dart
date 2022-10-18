import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';
import 'logic/validator.dart';
import 'login_screen.dart';
import 'widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void signUpCredential() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  CustomTextField(
                    controller: usernameController,
                    hintText: "Display Name",
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isObscure: true,
                    hintText: "Password",
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: signUpCredential,
                      child: const Text("Create Account"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () => navigateTo(const LoginScreen(), context),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Color(0xff0000ff)),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
