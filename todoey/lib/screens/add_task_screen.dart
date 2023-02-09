import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen(this.callback);
  String? text;
  final callback;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFF757575),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
              ),
              TextField(
                decoration: kTextFieldDecoration,
                autofocus: true,
                onChanged: (value){
                  text = value;
                },

              ),
            SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    callback(text);
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        ),
      ),
    );
  }
}
