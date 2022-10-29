import 'package:flutter/material.dart';

class RateBox extends StatelessWidget {
  const RateBox({
    Key? key,
    required this.style,
  }) : super(key: key);
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(1, 1),
              blurRadius: 1,
            ),
          ]),
      padding: const EdgeInsets.all(5),
      child: Text(
        "⭐ 4.5",
        style: (style != null) ? style : null,
      ),
    );
  }
}
