import 'package:flutter/material.dart';
import 'package:tourdine/features/auth_screens/widgets/widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: controller, hintText: "pin"),
            const SizedBox(height: 16),
            const Text("Forget Password"),
          ],
        ),
      )),
    );
  }
}
