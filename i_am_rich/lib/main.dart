import 'package:flutter/material.dart';
//https://cdn.discordapp.com/attachments/1059835378347036743/1059835459171258419/images.jpeg
//THIS CODE IS FROM NEW DOCUMENTATION
void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Text("I Am Rich"),
        backgroundColor:Colors.blueGrey ,
        ),
      backgroundColor: Colors.blueGrey[900],
      body: Center(child: Image.asset('images/diamond.png')),
    ),
        debugShowCheckedModeBanner: false,
  )
  );
}

