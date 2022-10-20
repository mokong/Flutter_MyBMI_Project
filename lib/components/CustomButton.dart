import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightAndAgeCard extends StatelessWidget {
  const WeightAndAgeCard({this.valueTitle, this.value, this.btnAction});

  final String valueTitle;
  final int value;
  final Function btnAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          valueTitle,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kLargeLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RoundCustomButton(
              onPressed: () {
                btnAction('-');
              },
              icon: FontAwesomeIcons.plus,
            ),
            RoundCustomButton(
              onPressed: () {
                btnAction('+');
              },
              icon: FontAwesomeIcons.minus,
            ),
            // CumstomButton(
            //   text: "-",
            //   btnAction: () {
            //     this.btnAction('-');
            //   },
            // ),
            // CumstomButton(
            //   text: "+",
            //   btnAction: () {
            //     this.btnAction('+');
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}

class RoundCustomButton extends StatelessWidget {
  const RoundCustomButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      onPressed: onPressed,
      fillColor: kCardSelectBackColor,
      elevation: 5,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
