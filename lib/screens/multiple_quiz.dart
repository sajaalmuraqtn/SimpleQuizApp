import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_std/logic/multichoise/multiple_question_brain.dart';
import 'package:quiz_std/screens/true_false_quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MultipleQuiz extends StatefulWidget {
  const MultipleQuiz({super.key});

  @override
  State<MultipleQuiz> createState() => _MultipleQuizState();
}

class _MultipleQuizState extends State<MultipleQuiz> {
  MultipleQuestionBrain mquizBrain = MultipleQuestionBrain();
  // Multiple QuestionBrain من كلاس (object)بعمل كائن  عشان أستخدم الأسئلة والإجابات المخزنة فيه

  List<Icon> scorekeeper = [];
  // Iconقائمة من نوع  لتخزين أيقونات (صح ✔ أو خطأ ✖) حسب إجابة المستخدم

  bool isFinish = false;
  // متغير منطقي بستخدمه لمعرفة هل انتهى الكويز ولا لأ

  int? _options; //   الخيار الحالي اللي المستخدم حدده

  void addUserScore(int userAnswer) {
    if (mquizBrain.isFinish()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Done",
        desc: "Well Done",
      ).show();
      Future.delayed(Duration(seconds: 5), () {
        //  لحتى ينتظر خمس ثواني قبل ما ينفذ الكود اللي جواه

        setState(() {
          mquizBrain.reset();
          scorekeeper.clear();
          _options = null;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TrueFalseApp()),
        );
        //رح ينتقل لصفحة الاسئلة الصح والخطأ
      });
    } else {
      setState(() {
        // التحقق إذا الجواب صح أو غلط
        mquizBrain.checkAnswer(userAnswer)
            ? scorekeeper.add(Icon(Icons.check, color: Colors.green))
            // إذا الإجابة صح → أضف أيقونة صح (لونها أخضر)
            : scorekeeper.add(Icon(Icons.close, color: Colors.red));
        // إذا الإجابة غلط → أضف أيقونة خطأ (لونها أحمر)

        mquizBrain.nextQuestion();
        _options = null; // 🟢 تصفير الاختيارات للسؤال الجديد
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🟢 نص السؤال
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  mquizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // 🟢 عرض الخيارات بالراديو
            Expanded(
              flex: 6,

              // Expanded: widget بتاخد حيز داخل Column أو Row
              // flex: 6 يعني هاد الجزء رح ياخد نسبة 6 من المساحة الكاملة مقارنة بباقي Expanded
              child: ListView.builder(
                // ListView.builder: لبناء قائمة عناصر (Widgets) بشكل ديناميكي حسب عدد الخيارات
                itemCount: mquizBrain.getQuestionOptions().length,

                // itemCount: عدد العناصر بالقائمة = عدد الخيارات المتوفرة للسؤال الحالي
                itemBuilder: (context, index) {
                  // itemBuilder: دالة تبني عنصر واحد بالقائمة حسب الـ index

                  return Padding(
                    padding: const EdgeInsets.all(8.0),

                     child: RadioListTile<int>(
                      // RadioListTile: Widget جاهز يجمع بين 
                      //"Radio button" ونص بجنبه
                      title: Center(
                        child: Text(
                          mquizBrain.getQuestionOptions()[index],
                          // نعرض نص الخيار الحالي من القائمة
                          
                          style: TextStyle(color: Colors.white),
                         ),
                      ),

                      value: index,   // value: القيمة الممثلة لهذا الخيار (index)
                   
                      groupValue: _options,//كأني بصفرو null الي حطينالو قيمة افتراضية _options
                      // groupValue: الخيار الحالي اللي المستخدم اختاره
                      // إذا كان يساوي value → ينشاف الراديو كـ"محدد"
                   
                      onChanged: (int? value) {
                        setState(() { // ونحدث الواجهة (setState) لحتى يظهر التغيير

                          _options = value!;
                          // _options لما المستخدم يضغط خيار جديد → نخزن القيمة بـ 
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // 🟢 زر التالي
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_options != null) {
                      addUserScore(_options!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "select option first ",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Next Question",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ),
              ),
            ),

            // 🟢 عرض العلامات (صح / غلط)
            Row(children: scorekeeper),
          ],
        ),
      ),
    );
  }
}
