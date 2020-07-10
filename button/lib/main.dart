import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(child: TutorialButtonPage()),
      ),
    );
  }
}

class TutorialButtonPage extends StatelessWidget {
  const TutorialButtonPage({Key key}) : super(key: key);

  void onPress() {
    print("This is a floating action button.");
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => this.onPress(),
      child: Icon(Icons.favorite),
    );
  }
}
