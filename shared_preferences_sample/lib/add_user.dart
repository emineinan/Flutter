import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_sample/main.dart';

class AddUser extends StatefulWidget {
  AddUser({Key key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController textName = new TextEditingController();
  TextEditingController textSurname = new TextEditingController();
  TextEditingController textAge = new TextEditingController();

  Future<String> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("UserName", textName.text);
    await prefs.setString("UserSurname", textSurname.text);
    await prefs.setString("UserAge", textAge.text);
    return "Completed";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: textName,
                decoration: InputDecoration(hintText: "Name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: textName,
                decoration: InputDecoration(hintText: "Surname"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: textName,
                decoration: InputDecoration(hintText: "Age"),
              ),
            ),
            RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  _saveData().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  });
                })
          ],
        ),
      ),
    );
  }
}
