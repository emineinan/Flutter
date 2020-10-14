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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: RaisedButton(
          color: Colors.cyan,
          onPressed: () {
            _showDialog();
          },
          child: Text(
            "DELETE",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("DELETE OPERATION"),
            content: Text("Do you want to delete this content?"),
            actions: <Widget>[
              MaterialButton(
                  child: Text("YES"),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              MaterialButton(
                  child: Text("NO"),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}
