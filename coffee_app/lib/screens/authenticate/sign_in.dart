import 'package:coffee_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(email);
                      print(password);
                    },
                    color: Colors.red,
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
