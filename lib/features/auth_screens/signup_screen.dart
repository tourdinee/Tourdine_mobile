import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/login_screen.dart';
import 'package:tourdine/features/auth_screens/otp_screen.dart';
import 'package:tourdine/helpers/loading/loading_screen.dart';
import 'package:tourdine/services/auth/auth_exception.dart';
import 'package:tourdine/services/auth/auth_service.dart';
import 'package:tourdine/services/cloud/cloud_store.dart';
import 'package:tourdine/utils/show_snack_bar.dart';

import 'logic/logic.dart';
import 'widgets/widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String picture = "";

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUpCredential() async {
    if (formKey.currentState!.validate()) {
      LoadingScreen().show(context: context, text: "text");
      try {
        final user = await AuthService.fromFirebase().createAccount(
          email: emailController.text,
          password: passwordController.text,
        );
        await CloudStore().addUser(
          email: emailController.text,
          name: usernameController.text,
          picture: picture,
          id: user.id,
        );
        LoadingScreen().hide();
        navigateTo(
            OtpScreen(
              name: usernameController.text,
            ),
            context,
            false,
            true);
        // case "email-already-in-use":
        //   throw EmailAlreadyExitException();
        // case "invalid-email":
        //   throw InvalidEmailException();
        // case "weak-password":
        //   throw WeakPasswordException();
        // default:
        //   throw GenericAuthException();
      } on EmailAlreadyExitException {
        log("email-already-in-use");
        showSnackBar(
          context: context,
          text: "An account exist with this email, sign in",
        );
      } on InvalidEmailException {
        log("invalid-email");
        showSnackBar(
          context: context,
          text: "Email is invalid",
        );
      } on WeakPasswordException {
        log("weak-password");
        showSnackBar(
          context: context,
          text: "weak password",
        );
      } on GenericAuthException {
        log("other error");
        showSnackBar(
          context: context,
          text: "sign up error",
        );
      }
      emailController.text = "";
      LoadingScreen().hide();
    }
  }

  void setProfilePicture() async {
    final res = await pickImage();
    if (res.isNotEmpty) {
      picture = res;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: backgroundDecoration("signup_bg.png"),
        child: SafeArea(
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sign Up",
                          style: headTextStyle,
                        ),
                      ],
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                    ProfilePicture(
                      picture: picture,
                      setProfilePic: setProfilePicture,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Profile Picture",
                      style: textStyle1,
                    ),
                    const SizedBox(height: 45),
                    SignUpFormInputContainer(
                      formKey: formKey,
                      emailController: emailController,
                      usernameController: usernameController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    const SizedBox(height: 20),
                    AuthButton(
                      text: "Sign Up",
                      callback: signUpCredential,
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(height: 20),
                    ),
                    RichText(
                      textScaleFactor: .9,
                      text: TextSpan(
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            text: "Login",
                            style: textStyle2red,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => navigateTo(
                                    const LoginScreen(),
                                    context,
                                  ),
                          ),
                        ],
                        style: textStyle2style,
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
