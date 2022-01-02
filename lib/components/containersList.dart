import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:form/brain/questionData.dart';
import 'package:form/components/introductoryWidget/introductoryContainer.dart';
import 'package:form/components/submitButton/submitButton.dart';
import 'package:form/components/textFieldQuestionWidget/textFieldQuestionContainer.dart';
import 'package:provider/provider.dart';

import 'checkBoxQuestionWidget/checkBoxQuestionContainer.dart';

class ContainersList extends StatefulWidget {
  const ContainersList({Key? key}) : super(key: key);
  @override
  State<ContainersList> createState() => _ContainersListState();
}

class _ContainersListState extends State<ContainersList> {
  // @override
  // void initState() {
  //   QuestionData().assignQuestions();
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final QuestionData questionBrain = Provider.of<QuestionData>(context);

    return ListView(
      children: <Widget>[
        IntroductoryContainer(questionBrain: questionBrain),
        const SizedBox(
          height: 20.0,
        ),
        Consumer<QuestionData>(builder: (context, questionData, Widget? child) {
          if (questionData.questionCount == 0) {
            questionBrain.assignQuestions();
            return const Text('data');
          } else {
            return ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final question = questionData.questionsGetter[index];
                // final QuestionData question = QuestionData().questionsGetter[index];

                return (question.questionType) == 'input'
                    ? TextFieldQuestionContainer(
                        questionBrain: questionData,
                        questionText: question.questionText,
                      )
                    : CheckBoxQuestionContainer(
                        questionBrain: questionBrain,
                        questionText: question.questionText,
                        answerOptions: question.answerOptions,
                        question: question,
                      );
              },
              itemCount: questionData.questionCount,
            );
          }
        }),
        // StreamBuilder(
        //   stream: questions,
        //   builder:
        //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return const Text('something went wrong');
        //     } else if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Text('....Loading');
        //     }
        //     final data = snapshot.requireData;
        //     return ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       shrinkWrap: true,
        //       itemCount: data.size,
        //       itemBuilder: (context, index) {
        //         return (data.docs[index]['questionType'] == 'checkbox')
        //             ? CheckBoxQuestionContainer(
        //                 questionBrain: questionBrain,
        //                 questionText: data.docs[index]['questionText'],
        //                 answerOptions: data.docs[index]['answerOptions'])
        //             : TextFieldQuestionContainer(
        //                 questionText: data.docs[index]['questionText'],
        //                 questionBrain: questionBrain);
        //         // '${data.docs[index]['questionText']}'
        //         // TextFieldQuestionContainer(questionText: data.docs[index]['questionText'], questionBrain: questionBrain)
        //       },
        //     );
        //   },
        // ),
        SubmitButton(
          questionData: questionBrain,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
