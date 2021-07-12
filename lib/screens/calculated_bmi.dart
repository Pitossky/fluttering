import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_container.dart';
import '../components/bottom_button.dart';

class CalculatedBMI extends StatelessWidget {
  CalculatedBMI(
      {required this.bmiResult,
      required this.bmiResultText,
      required this.bmiResultInterpretation});

  final String bmiResult;
  final String bmiResultText;
  final String bmiResultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: kActiveContainerColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResultText.toUpperCase(),
                    style: kResultBodyTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      bmiResultInterpretation,
                      textAlign: TextAlign.center,
                      style: kInterpretationTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              whenPressed: () {
                Navigator.pop(context);
              },
              buttonText: 'RE-CALCULATE BMI'),
        ],
      ),
    );
  }
}
