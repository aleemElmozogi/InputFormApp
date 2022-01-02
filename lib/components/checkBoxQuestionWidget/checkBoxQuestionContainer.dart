import 'package:flutter/cupertino.dart';
import 'package:form/brain/question.dart';
import 'package:form/brain/questionData.dart';

import 'checkBoxTile.dart';

class CheckBoxQuestionContainer extends StatelessWidget {
  const CheckBoxQuestionContainer({
    Key? key,
    required this.question,
    required this.questionBrain,
    required this.questionText,
    required this.answerOptions,
  }) : super(key: key);

  final Question question;
  final String questionText;
  final List answerOptions;
  // final bool isChecked;
  // final Function checkBoxCallBack;
  final QuestionData questionBrain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            border: Border.all(width: 0.5, color: const Color(0xff9a9898)),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 1),
                blurRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionText,
                  style: const TextStyle(
                    fontFamily: 'Microsoft JhengHei UI',
                    fontSize: 20,
                    color: Color(0xD3111111),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // <-- this will disable scroll
                  shrinkWrap: true,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  itemBuilder: (context, index) {
                    final checkBoxQuestionTitle =
                        question.answerOptions[index]['answerOptionsText'];
                    final isChecked = question.answerOptions[index]['answer'];
                    if (answerOptions == '') {
                      return const Text('....Loading');
                    } else {
                      return CheckBoxTile(
                          questionTitle: checkBoxQuestionTitle,
                          isChecked: isChecked,
                          checkBoxCallBack: (checkBoxNewState) {
                            questionBrain.checkBoxAnswerSetter(
                                isChecked, checkBoxQuestionTitle);
                          });
                    }
                  },
                  itemCount: question.answerOptions.length,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
