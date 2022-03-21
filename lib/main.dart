import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'question.dart';
import 'world_gk_question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

WorldGkQuestion worldGkQuestion = WorldGkQuestion();

void main() {
  runApp(Quizzler());
}

void trueScoreBuilder() {
  scoreBuilder.add(const Icon(
    Icons.check,
    color: Colors.greenAccent,
  ));
}

void falseScoreBuilder() {
  scoreBuilder.add(const Icon(
    Icons.close,
    color: Colors.redAccent,
  ));
}

class Quizzler extends StatelessWidget {
  Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: const Padding(
            padding: EdgeInsets.fromLTRB(12, 16, 12, 32),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

List<Icon> scoreBuilder = [];
late int tracker;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool correctAnswer;

  @override
  Widget build(BuildContext context) {
    // i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                worldGkQuestion.getQuestion(),
                key: const Key("questionaireTxt"),
                style: const TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ), //text
        MaterialButton(
          color: Colors.greenAccent,
          minWidth: double.maxFinite,
          child: const Text("TRUE",
              style: TextStyle(fontSize: 22, color: Colors.white)),
          onPressed: () {
            setState(() {
              correctAnswer = worldGkQuestion.getAnswer();
              if (correctAnswer == true) {
                trueScoreBuilder();
                tracker = worldGkQuestion.nextQuestion();
              } else {
                falseScoreBuilder();
                tracker = worldGkQuestion.nextQuestion();
              }

              if (worldGkQuestion.isFinished() == true) {
                callAlert();
              }
            });
          },
        ),
        MaterialButton(
          child: const Text(
            "FALSE",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              correctAnswer = worldGkQuestion.getAnswer();

              if (correctAnswer == false) {
                trueScoreBuilder();
                tracker = worldGkQuestion.nextQuestion();
              } else {
                falseScoreBuilder();
                tracker = worldGkQuestion.nextQuestion();
              }
              if (worldGkQuestion.isFinished() == true) {
                callAlert();
              }
            });
          },
          color: Colors.redAccent,
          minWidth: double.maxFinite,
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: scoreBuilder,
        )
      ],
    );
  }

  void callAlert() {
    Alert(
            context: context,
            title: "Finished",
            desc: "You\'ve reached the end of the game.")
        .show();
    scoreBuilder = [];
    worldGkQuestion.reset();
  }
}
