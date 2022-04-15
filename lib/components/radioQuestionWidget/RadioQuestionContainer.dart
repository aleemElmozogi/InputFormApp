import 'package:flutter/material.dart';
import 'package:form/brain/questionData.dart';

class RadioQuestionContainer extends StatefulWidget {
  const RadioQuestionContainer({
    Key? key,
    // required this.question,
    required this.questionBrain,
    required this.questionText,
    required this.answerOptions,
  }) : super(key: key);

  // final Question question;
  final String questionText;
  final List answerOptions;
  final QuestionData questionBrain;

  @override
  State<RadioQuestionContainer> createState() => _RadioQuestionContainerState();
}

class _RadioQuestionContainerState extends State<RadioQuestionContainer> {
  int _value = 0;
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
                  widget.questionText,
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
                  itemBuilder: (context, index) {
                    final checkBoxQuestionTitle = widget.answerOptions[index];

                    return ListTile(
                      leading: Radio(
                          value: index,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                            widget.questionBrain.answerSetter(
                                question: widget.questionText,
                                answer: widget.answerOptions[_value]);
                          }),
                      title: Text(checkBoxQuestionTitle),
                    );
                  },
                  itemCount: widget.answerOptions.length,
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
