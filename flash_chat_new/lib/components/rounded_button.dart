import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.color,required this.onPres,required this.text});

  final color;
  final onPres;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPres,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$text',
          ),
        ),
      ),
    );
  }
}
