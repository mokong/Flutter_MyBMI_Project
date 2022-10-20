import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CustomCalculateButton extends StatelessWidget {
  const CustomCalculateButton({
    @required this.title,
    @required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kCalculateHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kCalculateBackColor,
        ),
      ),
    );
  }
}
