import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_sample/add_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  String name;
  String surname;
  String age;

  @override
  void initState() {
    super.initState();

    _getData().then((value) {
      if (name == null || surname == null || age == null) {
        print("Data is not found.");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddUser()),
        );
      }

      setState(() {
        name = name;
        surname = surname;
        age = age;
      });
    });
  }

  Future<String> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("UserName");
    surname = prefs.getString("UserSurname");
    age = prefs.getString("UserAge");
    return "Completed";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(name),
            SizedBox(
              height: 10.0,
            ),
            Text(surname),
            SizedBox(
              height: 10.0,
            ),
            Text(age),
          ],
        ),
      ),
    );
  }
}
