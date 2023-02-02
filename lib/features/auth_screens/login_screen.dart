import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourdine/helpers/loading/loading_screen.dart';
import 'package:tourdine/services/auth/auth_exception.dart';
import 'package:tourdine/services/auth/auth_service.dart';
import 'package:tourdine/utils/show_snack_bar.dart';

import '../../constants/text_style.dart';
import '../home/home_bottom_nav_bar.dart';
import 'forget_password.dart';
import 'logic/logic.dart';
import 'signup_screen.dart';
import 'widgets/widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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

  void loginInCredential() async {
    if (formKey.currentState!.validate()) {
      LoadingScreen().show(context: context, text: "text");
      try {
        await AuthService.fromFirebase().login(
            email: emailController.text, password: passwordController.text);
        if (!context.mounted) return;
        LoadingScreen().hide();
        navigateTo(const HomeBottomNavBar(), context, false, true);
      } on InvalidCredentialException {
        LoadingScreen().hide();
        showSnackBar(context: context, text: "Invalid credential");
      } on GenericAuthException {
        LoadingScreen().hide();
        showSnackBar(context: context, text: "Signin Error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: backgroundDecoration("login_bg.png"),
        child: SafeArea(
            child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 3, child: SizedBox()),
                  SkipButton(callback: () async {
                    navigateTo(const HomeBottomNavBar(), context, false, true);
                  }),
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
                        onTap: () {
                          navigateTo(
                              ForgetPasswordScreen(
                                email: emailController.text,
                              ),
                              context,
                              true,
                              true);
                        },
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
