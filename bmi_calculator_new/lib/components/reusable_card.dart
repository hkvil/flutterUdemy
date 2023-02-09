import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color,this.cardChild,this.onPres});
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPres;
  //Color(0xFF1C1C2D) default
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPres,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          )),
    );
  }
}