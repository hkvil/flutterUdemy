import 'package:bmi_calculator_new/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What is BMI?",
                style: kAboutHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                bmiParagraph,
                style: kAboutParagraphTextStyle,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "BMI Table for Adult",
                style: kAboutHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                bmiTableParagraph,
                style: kAboutParagraphTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/bmiTable.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "BMI Formula",
                style: kAboutHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                bmiFormulaParagraph,
                style: kAboutParagraphTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/bmiFormula.png')
            ],
          ),
        ),
      ),
    );
  }
}
