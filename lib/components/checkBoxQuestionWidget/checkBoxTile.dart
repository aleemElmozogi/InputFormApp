import 'package:flutter/material.dart';

class CheckBoxTile extends StatelessWidget {
  final bool isChecked;
  final String questionTitle;
  final Function checkBoxCallBack;

  const CheckBoxTile({
    required this.isChecked,
    required this.questionTitle,
    required this.checkBoxCallBack,
  });
  // question.answerOptions[index]['answer']
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isChecked,
        onChanged: (newValue) {
          checkBoxCallBack(newValue);
          // setState(() {
          //   widget.checkBoxCallBack(newValue);
          // });
        },
      ),
      title: Text(questionTitle),
    );
  }
}
