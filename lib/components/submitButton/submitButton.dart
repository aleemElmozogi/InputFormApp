import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../brain/questionData.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.questionData,
    // required this.myController,
  }) : super(key: key);
  final QuestionData questionData;
  // final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        questionData.submit();

        await Alert(
          context: context,
          type: AlertType.success,
          title: "تم الإرسال",
          desc: "تم إرسال البيانات المدخلة إلى قاعدة البيانات\n شكرا على وقتك",
          buttons: [
            DialogButton(
              child: const Text(
                "حسنا",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => {
                Navigator.pop(context),
                Navigator.of(context).pushReplacementNamed('HomeScreen')
              },
              width: 120,
            )
          ],
        ).show();
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
