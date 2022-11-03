import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/features/home/home_screen/home_screen.dart';

import '../../../constants/text_style.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController reviewDetailsController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reviewDetailsController.dispose();
  }

  List<String> resturants = [
    "Please choose a resturant",
    "Fish Farm",
    "Black Bell",
    "Ofada Boy",
    "KFC",
    "Kappadocia",
    "Chai Tang",
    "Le Mango",
    "Chicken republic",
    "kappadocia",
    "The Place",
    "KFC",
    "Dominos"
  ];
  String? selectedItem = "Please choose a resturant";

  bool isThereText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Center(
                child: Text(
                  "New Review",
                  style: titleTextStyle,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 1,
                      offset: (Offset.fromDirection(1)),
                    ),
                  ],
                ),
                child: DropdownButtonFormField(
                  value: selectedItem,
                  items: resturants
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: ((value) {
                    setState(() {
                      selectedItem = value as String;
                    });
                  }),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Ratings",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(
                  child: RatingBar.builder(
                    unratedColor: Colors.white,
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ),
              Text(
                "Rate your experience",
                style: GoogleFonts.montserrat(
                  color: Color.fromRGBO(192, 193, 193, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: reviewDetailsController,
                maxLines: 10,
                onChanged: (value) {
                  if (reviewDetailsController.text.isEmpty) {
                    isThereText = false;
                  } else {
                    isThereText = true;
                  }
                },
                decoration: InputDecoration(
                  focusColor: Colors.red,
                  hintText: "Write your experience",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.red, style: BorderStyle.solid, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    if (reviewDetailsController.text.isEmpty) {
                      print("Please add a review");
                    } else {
                      FocusManager.instance.primaryFocus?.unfocus();
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) =>
                              Center(child: ViewPostModalBtn()));
                    }
                  },

                  //  Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => Home()));

                  child: Text("Post"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: reviewDetailsController.text.isEmpty
                          ? Colors.grey
                          : Colors.red),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red),
                  child: Center(
                    child: Text(
                      "x",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                onPressed: () {},
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
