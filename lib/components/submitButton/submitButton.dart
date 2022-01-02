import 'package:flutter/material.dart';
import '../../brain/questionData.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key, required this.questionData,
  }) : super(key: key);
  final QuestionData questionData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
         questionData.submit();
      },
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.green),
        elevation: MaterialStateProperty.all(3.0),
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Text(
          'ارسال',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
