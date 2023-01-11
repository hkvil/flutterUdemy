import 'package:flutter/material.dart';
import 'question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBrain questionBrain = QuestionBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(1),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool pickedAnswer){
    bool correctAnswer = questionBrain.getAnswer();

    if(correctAnswer==pickedAnswer){
      scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    }else{
      scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }

      questionBrain.nextQuestion();
  }

  void isFinished(bool pickedAnswer){
    setState(() {
      if(questionBrain.getQuestionNumber() == scoreKeeper.length-1){
        Alert(context: context, title: "End of Questions", desc: "Press Buttons to Restart",
            buttons:[DialogButton(child: Text('Restart'),onPressed: () => Navigator.pop(context),
        )]).show();
        reset();
      }else{
        checkAnswer(pickedAnswer);
      }
    });
  }
  void reset(){
    questionBrain.resetQuestionNumber();
    scoreKeeper.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Expanded(
            flex: 10,
            child: Center(
              child: Text(
                questionBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.green,
              child: TextButton(//true
                  onPressed: (){
                    isFinished(true);
                  },
                  child: Text(
                    'TRUE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.red,
              child: TextButton(//false
                  onPressed: (){
                    isFinished(false);
                  },
                  child  : Text(
                    'FALSE',
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.red
                    ),
                  )),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

