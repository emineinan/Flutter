import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String lectureName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATING GPA"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.pink,
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Lecture Name",
                            hintText: "Please enter a lecture name",
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.length > 0) {
                            return null;
                          } else
                            return "Please a validate lecture name";
                        },
                        onSaved: (newValue) {
                          lectureName = newValue;
                        },
                      )
                    ],
                  )))),
          Expanded(
              child: Container(
            color: Colors.green,
            child: Text("LIST"),
          )),
        ],
      ),
    );
  }
}
