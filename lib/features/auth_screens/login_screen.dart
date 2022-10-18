import 'package:flutter/material.dart';
import 'package:tourdine/features/auth_screens/forget_password.dart';
import 'package:tourdine/features/auth_screens/signup_screen.dart';
import 'package:tourdine/features/home_screen/home_screen.dart';

import 'logic/validator.dart';
import 'widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void loginInCredential() {
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
        title: const Text("Login Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  isObscure: true,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateTo(const ForgetPasswordScreen(), context, true);
                      },
                      child: const Text(
                        "forget password",
                        style: TextStyle(color: Color(0xff0000ff)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: loginInCredential,
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => navigateTo(const SignUpScreen(), context),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xff0000ff)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
