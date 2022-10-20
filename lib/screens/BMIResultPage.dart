import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIResultPage extends StatelessWidget {
  const BMIResultPage(
      {this.bmi, this.bmiResult, this.bmiResultColor, this.bmiInterpretation});

  final String bmi;
  final String bmiResult;
  final Color bmiResultColor;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120.0,
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kBMITitleTextStyle,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                color: kCardSelectBackColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResult,
                      style: kBMIStateTextStyle.copyWith(color: bmiResultColor),
                    ),
                    Text(
                      bmi,
                      style: kBMIResultTextStyle,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Normal BMI range",
                          style: kNormalBMIResultTitleStyle,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "18,5 - 25 kg/m2",
                          style: kNormalBMIResultDescStyle,
                        ),
                      ],
                    ),
                    Text(
                      bmiInterpretation,
                      style: kBMIResultDescStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            CustomCalculateButton(
              title: 'RE-CALCULATE YOUR BMI',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
