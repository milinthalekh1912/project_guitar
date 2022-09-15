import 'package:flutter/material.dart';

import 'package:form/form/constans/color.dart';

class SolidButton extends StatelessWidget {
  SolidButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.bgColor = kPrimaryColor,
      this.textColor = Colors.white,
      this.height = 50,
      this.fontSize = 18,
      this.width = double.infinity})
      : super(key: key);

  String title;
  Color bgColor;
  Color textColor;
  void Function() onPressed;
  double height;
  double width;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
