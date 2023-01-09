import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("I AM POOR :("),
        backgroundColor: Colors.brown[600],
    ),
       body: Center(
        child: Image.asset('images/minecraft-dirt-png.png',scale: 2,),
    ),backgroundColor: Colors.blue[200],
  )));
}
