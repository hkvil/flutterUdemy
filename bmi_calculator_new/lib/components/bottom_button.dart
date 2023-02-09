import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButtonBar extends StatelessWidget {
  BottomButtonBar({required this.onPres,required this.text});

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
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text('$text',style: kBottomBar,),
        ),
      ),
    );
  }
}