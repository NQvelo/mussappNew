import 'package:flutter/material.dart';

Widget myButton(
  String title,
  Color backgroundcolor,
  Color? fontColor,
  Color borderColor,
  VoidCallback onPressed,
  double width,
  double height,
) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
    width: width,
    height: height,
    child: TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(45))),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundcolor)),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: fontColor, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
