import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right= 1;

  void changeDice(){
    setState(() {
      left  = Random().nextInt(6)+1;
      right = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed:(){
                    changeDice();
                },
                child: Image.asset('images/dice$left.png')),
          ),
          Expanded(
            child: TextButton(
                onPressed:(){
                 changeDice();
                },
                child: Image.asset('images/dice$right.png')),
          )
        ],
      ),
    );
  }
}

