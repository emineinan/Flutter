import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(child: TutorialOnePage()),
      ),
    );
  }
}

class TutorialOnePage extends StatelessWidget {
  const TutorialOnePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello Flutter World",
          style: TextStyle(
            color: Colors.red,
            fontStyle: FontStyle.italic,
            fontSize: 30,
          )),
    );
  }
}
