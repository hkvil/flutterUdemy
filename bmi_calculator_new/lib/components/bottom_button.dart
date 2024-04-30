import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({super.key, required this.onPres,required this.text});

  final VoidCallback? onPres;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPres,
      child: Container(
        color: kBottomBarColor,
        width: double.infinity,
        height: kBottomBarHeight,
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Text('$text',style: kBottomBar,),
        ),
      ),
    );
  }
}