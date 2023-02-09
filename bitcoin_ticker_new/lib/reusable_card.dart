import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.coinText,this.coinRate});

  final coinText;
  final coinRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coinText = $coinRate',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
// child: Card(
// color: Colors.lightBlueAccent,
// elevation: 5.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
// child: Text(
// '1 BTC = ${getLocalData(0)}',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.white,
// ),
// ),
// ),
// ),
// )