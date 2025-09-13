import 'package:quiz_std/logic/true_false/question.dart';

class TrueFalseQuestionBrain {
  int question_number = 0;
  List<Question> _questionBank = [
    Question(
      questionText: 'In Flutter, everything is a widget.',
      questionAnswer: true,
    ),
    Question(
      questionText:
          'The "StatelessWidget" can hold state that changes during runtime.',
      questionAnswer: false,
    ),
    Question(
      questionText:
          'The "hot reload" feature allows developers to see code changes instantly without losing the app state.',
      questionAnswer: true,
    ),
    Question(
      questionText:
          'In Flutter, the main function must always return a Widget.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Flutter uses the Dart programming language.',
      questionAnswer: true,
    ),
  ];
  bool isFinish() {
    return question_number == _questionBank.length - 1;
  }

  void nextQuestion() {
    ++question_number;
  }

  String getQuestionText() {
    return _questionBank[question_number].questionText;
  }

  bool getQuestionAnswer() {
    return false;
  }

  bool checkAnswer(userAnswer) {
    return _questionBank[question_number].questionAnswer == userAnswer;
  }

  void reset() {
    question_number = 0;
  }
}
