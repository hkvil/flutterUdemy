import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi,required this.interp,required this.category});

  String bmi;
  String interp;
  String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: ReusableCard(
                color: kActivateCardColor,
                cardChild: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                            fontSize: 20,
                            color: category=='NORMAL'?Colors.green:Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmi,
                        style: kNumberTextStyle.copyWith(fontSize: 100),
                      ),
                      Text(
                        interp,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: BottomButtonBar(
                onPres: () {
                  Navigator.pop(context);
                },
                text: 'RE-CALCULATE'),
          ),
        ],
      ),
    );
  }
}
// BMI = weight/height^2
