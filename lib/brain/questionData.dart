import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'question.dart';

class QuestionData extends ChangeNotifier {
  late String _formTitle = '';
  late String _formDefinition = '';

  late final List<Map> _answersList = [{}];
  late final List<Question> _questionsBank = <Question>[];

  String get formTitleGetter {
    // assignQuestions();
    assignFormTitle();
    return _formTitle;
  }

  String get formDefinitionGetter {
    assignFormDefinition();
    return _formDefinition;
  }

  List<Question> get questionsGetter {
    // assignQuestions();
    return _questionsBank;
  }

  int get questionCount => _questionsBank.length;

  Future<void> assignFormTitle() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('FormTitle')
        .doc('vzpiSRhz5QHkaQhnrIxr')
        .get();
    _formTitle = variable['formTitle'].toString();
  }

  Future<void> assignFormDefinition() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('FormDefinition')
        .doc('vTfWsnbnL4GUk3eDE9eG')
        .get();
    _formDefinition = variable['formDefinition'].toString();
  }

  Future<void> assignQuestions() async {
    _questionsBank.clear();
    final Stream<QuerySnapshot> questions =
        FirebaseFirestore.instance.collection('Questions').snapshots();
    await questions.forEach((element) {
      for (var q in element.docs) {
        late Question _question = Question(
            questionType: '', questionText: '', answerOptions: [], answer: '');

        _question.questionText = q['questionText'];
        _question.questionType = q['questionType'];

        if (q['questionType'] == 'checkbox') {
          for (var a in q['answerOptions']) {
            _question.answerOptions.add({
              'answerOptionsText': a['answerOptionsText'],
              'answer': a['answer']
            });
          }
        }
        if (kDebugMode) {
          print(_question.questionType);
        }
        _questionsBank.add(Question(
            questionType: _question.questionType,
            questionText: _question.questionText,
            answerOptions: _question.answerOptions,
            answer: _question.answer));
        notifyListeners();
      }
    });
  }

  void answerSetter({question, answer}) {
    _answersList.add({question: answer});
    // // int questionIndex = 0;
    // for (var q in _questionsBank) {
    //   if (q.questionType == 'input') {
    //     if (q.questionText == question) {
    //       q.answer = answer;
    //     }
    //   }
    // }
  }

  void checkBoxAnswerSetter(bool value, String questionText) {
    for (var question in _questionsBank) {
      for (var answer in question.answerOptions) {
        if (answer['answerOptionsText'] == questionText) {
          question.answer = answer['answerOptionsText'];
          for (var answer in question.answerOptions) {
            answer['answer'] = false;
          }
          answer['answer'] = !value;
        }
      }
    }
    notifyListeners();
  }

  void submit() async {
    final CollectionReference answers =
        FirebaseFirestore.instance.collection('Answers');
    await answers.add({for (var q in _questionsBank) q.questionText: q.answer});
  }
}
