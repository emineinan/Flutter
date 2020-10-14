import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color colors;

  CustomText({this.text, this.fontSize, this.fontWeight, this.colors});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colors ?? Colors.purple,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
