import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'question.dart';

class QuestionData extends ChangeNotifier {
  late String _formTitle = '';
  late String _formDefinition = '';
  late bool isSubmitted = false;

  late List<Question> _questionsBank = <Question>[];

  String get formTitleGetter {
    assignFormTitle();
    return _formTitle;
  }

  String get formDefinitionGetter {
    assignFormDefinition();
    return _formDefinition;
  }

  List<Question> get questionsGetter {
    return _questionsBank;
  }

  int get questionCount => _questionsBank.length;
  bool get isSubmittedGetter => isSubmitted;

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
    print(_questionsBank.length);
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
            _question.answerOptions.add(a['answerOptionsText']);
          }
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
    for (var q in _questionsBank) {
      if (q.questionText == question) {
        q.answer = answer;
      }
    }
  }

  void submit() async {
    // final CollectionReference answers =
    //     FirebaseFirestore.instance.collection('Answers');
    // for (var item in _answers) {
    //   await answers.add(
    //     {"questionText": item["questionText"], "answer": item["answer"]},
    //   );
    // }
    final CollectionReference answers =
        FirebaseFirestore.instance.collection('Answers');
    await answers.add({for (var q in _questionsBank) q.questionText: q.answer});
  }
}
