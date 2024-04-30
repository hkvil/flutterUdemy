import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.color,this.cardChild,this.onPres});
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPres;
  //Color(0xFF1C1C2D) default
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPres,
      child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: cardChild),
    );
  }
}