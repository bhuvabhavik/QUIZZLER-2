import 'question.dart';

int _questionNo = 0;

class WorldGkQuestion {
  final List<Question> _questionBank = [
    Question(
        questionText: 'Taj Mahal is located in haryana', questionAns: false),
    Question(
        questionText: 'Ottawa is the capital of CANADA', questionAns: true),
    Question(
        questionText: 'Niagara fall is located in Los Angelos',
        questionAns: false),
    Question(questionText: 'Rome is situated in Paris', questionAns: false),
    Question(
        questionText: 'Warsaw is the capital of POLAND', questionAns: true),
    Question(
        questionText: 'South Korea is located in South Africa',
        questionAns: false),
    Question(
        questionText: 'Berlin is the capital of GERMANY', questionAns: true),
    Question(
        questionText: 'America is the neighbour to UK', questionAns: false),
    Question(
        questionText: 'Canada is the biggest country areawise',
        questionAns: false),
    Question(questionText: 'River Rile flows in Uganda', questionAns: true),
  ];

  int nextQuestion() {
    if (_questionNo < _questionBank.length - 1) {
      _questionNo++;
      return 0;
    } else {
      return -1;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNo].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNo].questionAns;
  }

  int questionLength() {
    return _questionBank.length;
  }

  bool isFinished() {
    if (_questionNo >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNo = 0;
  }
}
