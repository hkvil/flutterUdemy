import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes:route,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090C22),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF090C22),
        ),
      ),
    );
  }
}

final route =  {
'/':(context)=>const InputPage(),
};
