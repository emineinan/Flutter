import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/load_data.dart';

void main() {
  runApp(MyApp());
}

Future<LoadData> apiCall() async {
  final response = await http.get(
      'https://raw.githubusercontent.com/alimcevik/jsonapi/master/api.json');
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json API"),
        ),
        body: MyHomePage(),
      ),
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
      body: FutureBuilder<LoadData>(
          future: apiCall(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text(
                    "Username: ${snapshot.data.username}+\n" +
                        "Email: ${snapshot.data.email}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            } else {
              Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
