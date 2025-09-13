import 'package:quiz_std/logic/multichoise/multiple_question.dart';

class MultipleQuestionBrain {
  int question_number = 0;
  // مؤشر رقم السؤال الحالي (0 يعني أول سؤال)

  List<MultipleQuestion> _multipleQuestionBank = [
 
    MultipleQuestion(
      ["Java", "Dart", "C++", "Kotlin"],
      questionText: 'Which language is used in Flutter?',
      answerOptionNumber: 1, 
    ),

    MultipleQuestion(
      ["Apple", "Facebook", "Google", "Microsoft"],
      questionText: 'Who developed the Flutter framework?',
      answerOptionNumber: 2, // 2 → "Google"
    ),

    MultipleQuestion(
      ["Scaffold", "Container", "Column", "Row"],
      questionText: 'Which widget is used for layouts in Flutter?',
      answerOptionNumber: 3, // 3 → "Row" (ملاحظة: كل من Row وColumn ويدجت Layout)
    ),

    MultipleQuestion(
      ["flutter create", "flutter start", "flutter new", "flutter init"],
      questionText: 'Which command is used to create a new Flutter project?',
      answerOptionNumber: 0, // 0 → "flutter create"
    ),

    MultipleQuestion(
      ["Java", "Dart", "Swift", "C#"],
      questionText: 'What is the default programming language for Flutter apps?',
      answerOptionNumber: 1, // 1 → "Dart"
    ),

    MultipleQuestion(
      ["Stack", "Expanded", "SingleChildScrollView", "Row"],
      questionText:
          'Which widget allows scrolling when content overflows the screen?',
      answerOptionNumber: 2, // 2 → "SingleChildScrollView"
    ),

    MultipleQuestion(
      ["main()", "runApp()", "init()", "startApp()"],
      questionText: 'Which function is the entry point of a Flutter app?',
      answerOptionNumber: 0, // 0 → "main()"
    ),
  ];
// list of multiple choise questions

  bool isFinish() {
    // ترجع true إذا كنا عند آخر سؤال (المؤشر يساوي طول القائمة-1)
    return question_number == _multipleQuestionBank.length - 1;
  }

  void nextQuestion() {
    // الانتقال للسؤال التالي بزيادة المؤشر واحدًا
    ++question_number;;
  }

  String getQuestionText() {
    // إرجاع نص السؤال الحالي
    return _multipleQuestionBank[question_number].questionText;
  }

  bool checkAnswer(int userAnswer) {
    // مقارنة إجابة المستخدم (index) بالإجابة الصحيحة (index)
    return _multipleQuestionBank[question_number].answerOptionNumber == userAnswer;
  }

  List<String> getQuestionOptions() {
    // إرجاع قائمة الخيارات للسؤال الحالي
    return _multipleQuestionBank[question_number].options;
  }

  void reset() {
    // إعادة المؤشر إلى أول سؤال (لبدء الاختبار من جديد)
    question_number = 0;
  }
}