import 'package:flutter/material.dart';
import 'package:form/brain/questionData.dart';

class TextFieldQuestionContainer extends StatelessWidget {
  const TextFieldQuestionContainer({
    Key? key,
    required this.questionText,
    required this.questionBrain,
  }) : super(key: key);

  final String questionText;
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
                TextField(
                  onChanged: (value) {
                    questionBrain.answerSetter(
                        question: questionText, answer: value);
                  },
                  decoration: const InputDecoration(
                      hintText: 'ادخل اجابتك هنا',
                      hintStyle: TextStyle(color: Color(0x83111111))),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
