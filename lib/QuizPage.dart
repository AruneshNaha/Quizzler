import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MaterialApp(
      home: QuizPage(),
    ));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  List<Widget> scoreKeeper = [];
  int questionNumber = 0;

  void checkAnswer(bool answerPicked) {
    bool correctanswer = questionBank[questionNumber].answer;

    setState(() {
      questionNumber++;

      if (questionNumber == 10) {
        //reset
        questionNumber = 9;
        Alert(
          context: context,
          type: AlertType.success,
          title: "QUIZ ENDED",
          desc: "Your score is ${score} / 100",
          buttons: [
            DialogButton(
              child: Text(
                "Take quiz again",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              onPressed: () {
                setState(() {
                  questionNumber = 0;
                  score = 0;
                  scoreKeeper.clear();
                  Navigator.pop(context);
                });
              },
              width: 120,
            )
          ],
        ).show();
      }
      if (correctanswer == answerPicked) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        score = score + 10;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
    });
  }
  // Question q = Question(
  //     );

  List<Question> questionBank = [
    Question(
        q: "Flutter can be used to only develop apps and nothing else",
        a: false),
    Question(q: "Flutter is a framework of dart", a: true),
    Question(q: "Udemy is based in California, USA", a: true),
    Question(q: "Kolkata is the capital of India", a: false),
    Question(q: "Mumbai is in Maharastra", a: true),
    Question(q: "Mahatma Gandhi is not the father of nation", a: false),
    Question(q: "Python is not a snake", a: false),
    Question(q: "Python is also a programming language", a: true),
    Question(q: "India is in Asia", a: true),
    Question(q: "Google is not a search engine", a: false)
  ];

  // List<String> questions = [
  //   "Flutter can be used to only develop apps and nothing else",
  //   "Flutter is a framework of dart",
  //   "Udemy is based in California, USA"
  // ];

  // List<bool> answers = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questionBank[questionNumber].question,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      color: Colors.green,
                      onPressed: () {
                        bool answerpicked = true;
                        checkAnswer(answerpicked);
                      },
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        bool answerpicked = false;
                        checkAnswer(answerpicked);
                      },
                      child: Text(
                        "False",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: scoreKeeper,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
