import 'package:destini_new/story_brain.dart';
import 'package:flutter/material.dart';

StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  bool visibleChoice2 = true;
  void checkHide(){
    int n = storyBrain.getNumber();
    if(n==3||n==4||n==5){
      visibleChoice2 = false;
    }else{
      visibleChoice2 = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(storyBrain.getNumber());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 15),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
            ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Expanded(
                flex: 12,
                child: Center(
                  //TODO 10
                  child: Text(storyBrain.getStory()),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Color.fromRGBO(177, 71, 57,1),
                  child: TextButton(
                      onPressed: (){
                            setState(() {
                              storyBrain.nextStory(1);
                              checkHide();
                            });
                      },
                      child: Text(
                        storyBrain.getChoice1(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20,),
              Visibility(
                visible: visibleChoice2,
                child: Expanded(
                  flex: 2,
                  child: Container(
                    color: Color.fromRGBO(61, 134, 179,1),
                    child: TextButton(
                        onPressed: (){
                            setState(() {
                              storyBrain.nextStory(2);
                              checkHide();
                            });
                        },
                        child: Text(
                            storyBrain.getChoice2(),
                            style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


