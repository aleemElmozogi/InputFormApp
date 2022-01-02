import 'package:flutter/material.dart';
import 'package:form/brain/questionData.dart';
import 'package:provider/provider.dart';

import '../../components/containersList.dart';

class FormComponents extends StatelessWidget {
  final bool isChecked = false;
  assignQuestions() {
    // TODO: implement assignQuestions
    throw UnimplementedError();
  }

  const FormComponents({Key? key, required String title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QuestionData(),
      child: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: const ContainersList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
