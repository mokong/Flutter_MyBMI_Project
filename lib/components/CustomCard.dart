import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({this.cardChild, this.backColor, this.onTap});

  final Widget cardChild;
  final Color backColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: onTap,
    );
  }
}
