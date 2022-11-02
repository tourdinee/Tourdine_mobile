import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/features/home/profile_screen/setting_screen.dart';

import '../../../constants/color.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Language selectedLanguage = Language.english;

  void setLanguage(value) {
    setState(() {
      selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text("Change Language"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          const SettingSubTitle(text: "Select Language"),
          const SizedBox(height: 12),
          Form(
            child: Column(
              children: [
                LanguageSelectedBox(
                  language: Language.english,
                  callback: setLanguage,
                  selectedLanguage: selectedLanguage,
                ),
                LanguageSelectedBox(
                  language: Language.french,
                  callback: setLanguage,
                  selectedLanguage: selectedLanguage,
                ),
                LanguageSelectedBox(
                  language: Language.yoruba,
                  callback: setLanguage,
                  selectedLanguage: selectedLanguage,
                ),
                LanguageSelectedBox(
                  language: Language.hausa,
                  callback: setLanguage,
                  selectedLanguage: selectedLanguage,
                ),
                LanguageSelectedBox(
                  language: Language.igbo,
                  callback: setLanguage,
                  selectedLanguage: selectedLanguage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LanguageSelectedBox extends StatelessWidget {
  const LanguageSelectedBox({
    Key? key,
    required this.callback,
    required this.language,
    required this.selectedLanguage,
  }) : super(key: key);

  final Function callback;
  final Language language;
  final Language selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffaaaaaa)),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language.name[0].toUpperCase() + language.name.substring(1),
            style: GoogleFonts.montserrat(fontSize: 12),
          ),
          Radio(
            activeColor: mainColor,
            fillColor: MaterialStateProperty.all(mainColor),
            value: language,
            groupValue: selectedLanguage,
            onChanged: (value) => callback(value),
          ),
        ],
      ),
    );
  }
}

enum Language {
  english,
  yoruba,
  french,
  hausa,
  igbo,
}
