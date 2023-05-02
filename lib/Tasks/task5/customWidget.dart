import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;

  const CustomTextWidget({required this.text, this.textColor, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize ?? 20, 
            fontWeight:FontWeight.bold, 
            letterSpacing: 5, 
            color: textColor ?? Colors.black),
        ),
      ],
    );
  }
}

