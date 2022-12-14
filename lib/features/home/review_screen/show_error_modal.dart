import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowErrorModal extends StatelessWidget {
  const ShowErrorModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please leave a review",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    "Close",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
