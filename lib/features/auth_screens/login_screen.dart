import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/forget_password.dart';
import 'package:tourdine/features/auth_screens/otp_screen.dart';
import 'package:tourdine/features/auth_screens/signup_screen.dart';
import 'package:tourdine/features/welcome_screen/welcome_screen.dart';

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

  String message = "";

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
      navigateTo(const OtpScreen(), context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Color(0xaa000000), BlendMode.darken),
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  SkipButton(
                    callback: () => navigateTo(const WelcomeScreen(), context),
                  ),
                  const Expanded(
                    flex: 4,
                    child: SizedBox(),
                  ),
                  Text(
                    "Login",
                    style: headTextStyle,
                  ),
                  const SizedBox(height: 40),
                  SignInFormInputContainer(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            navigateTo(const ForgetPasswordScreen(), context),
                        child: Text(
                          "Forget Password?",
                          style: textStyle2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  AuthButton(
                    text: "Login",
                    callback: loginInCredential,
                  ),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => navigateTo(const SignUpScreen(), context),
                        child: Text(
                          "Create New Account",
                          style: textStyle2style,
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
          )
        ])),
      ),
    );
  }
}
