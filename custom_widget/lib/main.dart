import 'package:custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reusable Widgets"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: CustomText(
            text: "Hello",
            colors: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          )),
    );
  }
}
