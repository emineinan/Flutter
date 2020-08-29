import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flowers = ["Rose", "Tulips", "Lilies"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: flowers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(flowers[index]);
                  }))
        ],
      ),
    );
  }
}
