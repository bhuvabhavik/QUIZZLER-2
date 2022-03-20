import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
List<String> questionaire = [
  'Taj Mahal is located in haryana',
  'Ottawa is the capital of Canada',
  'Niagara fall is located in Brampton',
  'America is the neighbour to UK',
  'Berlin is the capital of Germany',
  'South Korea is located in South Africa',
  'Warsaw is the capital of Poland',
  'Rome is situated in Paris'
];
List<bool> answers = [false, true, false, false, true, false, true, false];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int questionNo = 0;
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
                questionaire[questionNo],
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
              correctAnswer = answers[questionNo];
              if (correctAnswer == true) {
                trueScoreBuilder();
              } else {
                falseScoreBuilder();
              }
            });

            if (questionNo < questionaire.length - 1) {
              questionNo++;
            }
          },
        ),
        MaterialButton(
          child: const Text(
            "FALSE",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              correctAnswer = answers[questionNo];
              if (correctAnswer == false) {
                trueScoreBuilder();
              } else {
                falseScoreBuilder();
              }
              if (questionNo < questionaire.length - 1) {
                questionNo++;
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
}
