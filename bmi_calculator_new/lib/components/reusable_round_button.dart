import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.icon, this.onPres});

  final IconData? icon;
  final VoidCallback? onPres;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPres,
      fillColor: kFillColor,
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: kIconColor,
        size: 40,
      ),
    );
  }
}