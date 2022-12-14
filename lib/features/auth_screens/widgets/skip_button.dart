import 'package:flutter/material.dart';
import 'package:tourdine/constants/color.dart';

import '../../../constants/text_style.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Skip",
          style: textStyle2,
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: callback,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: mainColor, width: 2.5),
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_forward_outlined,
              size: 16,
              color: mainColor,
            ),
          ),
        )
      ],
    );
  }
}
