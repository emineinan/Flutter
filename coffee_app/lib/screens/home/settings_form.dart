import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/services/database.dart';
import 'package:coffee_app/shared/constants.dart';
import 'package:coffee_app/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  //form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.userId).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Update your order settings.",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: inputDecoration.copyWith(hintText: "Name:"),
                    validator: (value) =>
                        value.isEmpty ? "Please enter a name" : null,
                    onChanged: (value) => setState(() => _currentName = value),
                  ),
                  SizedBox(height: 20.0),
                  //dropdown

                  DropdownButtonFormField(
                    decoration: inputDecoration,
                    value: _currentSugars ?? userData.sugar,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugars"),
                      );
                    }).toList(),
                    onChanged: (value) =>
                        setState(() => _currentSugars = value),
                  ),
                  //slider
                  Slider(
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      activeColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      inactiveColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      onChanged: (value) =>
                          setState(() => _currentStrength = value.round())),
                  RaisedButton(
                      color: Colors.blueGrey,
                      child: Text(
                        "UPDATE",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.userId).updateData(
                            _currentSugars ?? userData.sugar,
                            _currentName ?? userData.name,
                            _currentStrength ?? userData.strength,
                          );
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
