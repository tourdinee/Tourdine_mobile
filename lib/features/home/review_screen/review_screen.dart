import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/features/home/review_screen/show_error_modal.dart';
import 'package:tourdine/features/home/review_screen/view_post_btn_modal.dart';

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

  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Review"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                const SizedBox(height: 10),
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
                const SizedBox(
                  height: 35,
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
                const SizedBox(
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
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
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
                    color: const Color.fromRGBO(192, 193, 193, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 35),
                TextField(
                  controller: reviewDetailsController,
                  onChanged: (value) => {
                    if (reviewDetailsController.text.isEmpty)
                      {
                        setState(
                          () {
                            isTyping = false;
                          },
                        )
                      }
                    else
                      {
                        setState(
                          () {
                            isTyping = true;
                          },
                        )
                      }
                  },
                  maxLines: 10,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    hintText: "Write your experience",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (reviewDetailsController.text.isEmpty) {
                        showCupertinoModalPopup(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => ShowErrorModal());
                      } else {
                        showCupertinoModalPopup(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => ViewPostModalBtn());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isTyping == true ? Colors.red : Colors.grey),
                    child: const Text("Post"),
                  ),
                ),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
