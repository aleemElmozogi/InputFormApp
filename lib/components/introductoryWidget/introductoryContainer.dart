import 'package:form/brain/questionData.dart';
import 'package:flutter/material.dart';

class IntroductoryContainer extends StatelessWidget {
  const IntroductoryContainer({
    Key? key,
    required this.questionBrain,
  }) : super(key: key);

  final QuestionData questionBrain;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Container(
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionBrain.formTitleGetter,
                  style: const TextStyle(
                    fontFamily: 'Microsoft JhengHei UI',
                    fontSize: 30,
                    color: Color(0xD3111111),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  questionBrain.formDefinitionGetter,
                  style: const TextStyle(
                    fontFamily: 'Microsoft JhengHei UI',
                    fontSize: 18,
                    color: Color(0xff707070),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
