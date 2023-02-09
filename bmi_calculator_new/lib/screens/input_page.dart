import 'package:bmi_calculator_new/calculator.dart';
import 'package:bmi_calculator_new/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/reusable_round_button.dart';
import '../components/bottom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;
  //1=male 2=female
  Gender? selectedGender;
  //slider heihgt
  int height = 160;
  //weight and age
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPres: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActivateCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        faicon: FontAwesomeIcons.mars,
                        bottomText: 'MALE',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    onPres: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActivateCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      faicon: FontAwesomeIcons.venus,
                      bottomText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: kActivateCardColor,
            onPres: () {},
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: kActiveSliderColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x30EB1555),
                        inactiveTrackColor: kInactiveSliderColor),
                    child: Slider(
                        min: kMinSliderHeight.toDouble(),
                        max: kMaxSliderHeight.toDouble(),
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        }),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPres: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPres: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    color: kActivateCardColor,
                    onPres: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActivateCardColor,
                    onPres: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPres: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPres: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtonBar(
              onPres: (){
                Calculate res = Calculate(height: height, weight: weight);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultPage(bmi: res.calculateBMI(),interp: res.getInterpretation(),category: res.getResult(),)));
                },
              text: 'CALCULATE')
        ]));
  }
}

