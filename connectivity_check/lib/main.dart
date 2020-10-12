import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  var colorsVal = Colors.white;

  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsVal,
      body: Container(
        alignment: Alignment.center,
        child: Text(
          result != null ? result : 'Unknown',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ),
    );
  }

  void checkStatus() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        changeValues("Connected!", Colors.green);
      } else {
        changeValues("No Internet!", Colors.red);
      }
    });
  }

  void changeValues(String resultVal, Color colorVal) {
    setState(() {
      result = resultVal;
      colorsVal = colorVal;
    });
  }
}
