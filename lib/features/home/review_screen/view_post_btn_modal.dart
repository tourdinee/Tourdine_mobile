import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/features/home/home_bottom_nav_bar.dart';

class ViewPostModalBtn extends StatelessWidget {
  const ViewPostModalBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Posted",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeBottomNavBar()));
                },
                child: Text(
                  "View Post",
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
