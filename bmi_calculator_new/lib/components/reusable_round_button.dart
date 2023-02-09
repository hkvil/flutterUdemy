import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPres});

  final IconData? icon;
  final VoidCallback? onPres;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: kIconColor,
        size: 40,
      ),
      onPressed: onPres,
      fillColor: kFillColor,
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      shape: CircleBorder(),
    );
  }
}