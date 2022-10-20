import 'package:bmi_calculator/Gender.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/CustomButton.dart';
import 'package:bmi_calculator/components/CustomCard.dart';
import 'package:bmi_calculator/components/IconContent.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/BMIResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender = Gender.male;
  int height = 180;
  int weight = 74;
  int age = 20;

  void ageSelectedAction(String op) {
    setState(() {
      if (op == "+") {
        this.age++;
      } else {
        this.age--;
      }
    });
  }

  void weightSelectedAction(String op) {
    setState(() {
      if (op == "+") {
        this.weight++;
      } else {
        this.weight--;
      }
    });
  }

  void genderSelectedAction(Gender gender) {
    setState(() {
      this.selectGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        iconText: 'Male',
                      ),
                      backColor: selectGender == Gender.male
                          ? kCardSelectBackColor
                          : kCardBackColor,
                      onTap: () {
                        print('print male');
                        genderSelectedAction(Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        iconText: 'Female',
                      ),
                      backColor: selectGender == Gender.femal
                          ? kCardSelectBackColor
                          : kCardBackColor,
                      onTap: () {
                        print('print famale');
                        genderSelectedAction(Gender.femal);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                backColor: kCardBackColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kLargeLabelTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      onChanged: (double newVlaue) {
                        setState(() {
                          height = newVlaue.toInt();
                        });
                      },
                      min: 120,
                      max: 220,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      backColor: kCardBackColor,
                      cardChild: WeightAndAgeCard(
                        valueTitle: 'WEIGHT',
                        value: weight,
                        btnAction: (String op) {
                          weightSelectedAction(op);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      backColor: kCardBackColor,
                      cardChild: WeightAndAgeCard(
                        valueTitle: 'Age',
                        value: age,
                        btnAction: (String op) {
                          ageSelectedAction(op);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomCalculateButton(
              title: "CALCULATE YOUR BMI",
              onPressed: () {
                print("CALCULATE YOUR BMI");
                CalculatorBrian cal =
                    CalculatorBrian(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return BMIResultPage(
                      bmi: cal.calculatorBMI(),
                      bmiResult: cal.getResult(),
                      bmiInterpretation: cal.getInterpretation(),
                      bmiResultColor: cal.getResultColor());
                })));

                // Navigator.pushNamed(context, '/resultPage');
              },
            ),
          ],
        ));
  }
}
