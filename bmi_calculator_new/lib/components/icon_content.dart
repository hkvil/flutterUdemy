import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.faicon,required this.bottomText});

  final IconData faicon;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          faicon,
          size: 100,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          bottomText,
          style:
          kLabelStyle
        )
      ],
    );
  }
}