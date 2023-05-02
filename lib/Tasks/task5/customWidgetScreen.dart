import '../task5/customWidget.dart';
import '../task5/customWidgetNoParameter.dart';
import 'package:flutter/material.dart';

class CustomWidgetScreen extends StatelessWidget {
  const CustomWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CustomTextWidget(
          text: 'Custom Text with Parameters', 
          textColor: Colors.white, 
          textSize: 25
        ),
        CustomButton(),
      ],
    );
  }
}