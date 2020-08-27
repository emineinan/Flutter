import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Exam Result"),
          onPressed: () {
            int score = 60;
            String message = "";
            if (score >= 50) {
              message = "You passed the exam";
            } else {
              message = "You failed the exam";
            }

            var alert = AlertDialog(
              title: Text("Exam Result"),
              content: Text(message),
            );

            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
      ),
    );
  }
}
