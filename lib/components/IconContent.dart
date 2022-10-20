import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconData, this.iconText});

  final String iconText;

  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.iconText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
