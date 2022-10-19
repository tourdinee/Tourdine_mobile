import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/forget_password.dart';
import 'package:tourdine/features/auth_screens/signup_screen.dart';
import 'package:tourdine/features/home_screen/home_screen.dart';

import 'logic/logic.dart';
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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Color(0xaa000000), BlendMode.darken),
            image: AssetImage("images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Skip",
                        style: textStyle2,
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffff0000), width: 2.5),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_forward_outlined,
                            size: 16,
                            color: Color(0xffff0000),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Expanded(
                    flex: 4,
                    child: SizedBox(),
                  ),
                  const Text(
                    "Login",
                    style: headTextStyle,
                  ),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateTo(
                              const ForgetPasswordScreen(), context, true);
                        },
                        child: const Text(
                          "Forget Password",
                          style: textStyle2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: loginInCredential,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0x55ff0000),
                      ),
                      child: const Text(
                        "Login",
                        style: textStyle1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => navigateTo(const SignUpScreen(), context),
                        child: const Text(
                          "Create New Account",
                          style: textStyle2,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
