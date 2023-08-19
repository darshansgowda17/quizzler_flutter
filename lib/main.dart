import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int questionNumber = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].question!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: GestureDetector(
                onTap: () {
                  bool ans = quizBrain.questionBank[questionNumber].answer!;
                  setState(() {
                    if (ans == true){
                      scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                    } else {
                      scoreKeeper.add(Icon(Icons.cancel,color: Colors.red,),);
                    };
                    questionNumber += 1;
                  },);
    },
            child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    "True",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                bool ans = quizBrain.questionBank[questionNumber].answer!;
                setState(() {
                  if (ans == false){
                    scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                  } else {
                    scoreKeeper.add(Icon(Icons.cancel,color: Colors.red,),);
                  };
                  questionNumber += 1;
                });
              },
              child: Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("False",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                      ),),
                  ),
               ),
             ),
          ),
        ),
        Row(
          children: scoreKeeper,

        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
