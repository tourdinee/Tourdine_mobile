import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/otp_screen.dart';

import 'logic/logic.dart';
import 'login_screen.dart';
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

  void signUpCredential() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        ),
        (route) => false,
      );
    }
  }

  void setProfilePicture() async {
    final res = await pickImage();
    print("picture: $res");
    if (res.isNotEmpty) {
      picture = res;
      setState(() {});
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
                    const Expanded(flex: 1, child: SizedBox()),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
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
                    const Expanded(flex: 1, child: SizedBox()),
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
