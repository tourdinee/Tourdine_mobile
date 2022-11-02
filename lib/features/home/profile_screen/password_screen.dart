import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/constants/color.dart';

class PasswordSCreen extends StatelessWidget {
  const PasswordSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const InputBox(hint: "Current Password"),
            const SizedBox(
              height: 10,
            ),
            const InputBox(hint: "New Password"),
            const SizedBox(
              height: 10,
            ),
            const InputBox(hint: "Confirm Password"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: mainColor),
              child: const Text("Update Password"),
            )
          ],
        ),
      )),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(Icons.lock_outline),
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: mainColor),
        ),
      ),
    );
  }
}
