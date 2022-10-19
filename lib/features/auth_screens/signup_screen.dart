import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';

import '../home_screen/home_screen.dart';
import 'logic/logic.dart';
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
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Color(0xaa000000), BlendMode.darken),
            image: AssetImage("assets/images/signup_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Sign Up",
                          style: headTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Stack(
                      children: const [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0x44ffffff),
                          child: Icon(
                            Icons.person_outline,
                            size: 75,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0x55ff0000),
                            child: Icon(Icons.arrow_upward),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Profile Picture",
                      style: textStyle1,
                    ),
                    const SizedBox(height: 45),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: usernameController,
                      hintText: "Name",
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
                      hintText: "Password",
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: signUpCredential,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x55ff0000),
                        ),
                        child: const Text("Create Account"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: textStyle2,
                        ),
                        GestureDetector(
                          onTap: () => navigateTo(const LoginScreen(), context),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xffff0000),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
