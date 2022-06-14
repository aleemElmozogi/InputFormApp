import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:form/brain/questionData.dart';
import 'package:form/components/introductoryWidget/introductoryContainer.dart';
import 'package:form/components/radioQuestionWidget/RadioQuestionContainer.dart';
import 'package:form/components/submitButton/submitButton.dart';
import 'package:form/components/textFieldQuestionWidget/textFieldQuestionContainer.dart';
import 'package:provider/provider.dart';

class ContainersList extends StatelessWidget {
  const ContainersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionData questionBrain = Provider.of<QuestionData>(context);

    return RepaintBoundary(
      child: ListView(
        children: <Widget>[
          IntroductoryContainer(questionBrain: questionBrain),
          const SizedBox(
            height: 20.0,
          ),
          Consumer<QuestionData>(
              builder: (context, questionData, Widget? child) {
            if (kDebugMode) {
              print('Consumer');
            }
            if (questionData.questionCount == 0) {
              questionBrain.assignQuestions();
              return const Text('جاري التحميل .......');
            } else {
              return ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final question = questionData.questionsGetter[index];
                  return (question.questionType) == "checkbox"
                      ? RepaintBoundary(
                          child: RadioQuestionContainer(
                            questionBrain: questionData,
                            questionText: question.questionText,
                            answerOptions: question.answerOptions,
                          ),
                        )
                      : TextFieldQuestionContainer(
                          questionBrain: questionData,
                          questionText: question.questionText,
                        );
                },
                itemCount: questionData.questionCount,
              );
            }
          }),
          SubmitButton(
            questionData: questionBrain,
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
