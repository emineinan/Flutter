import 'package:coffee_app/screens/authenticate/register.dart';
import 'package:coffee_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isLogin = true;
  void toogleBetweenPages() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return SignIn(tooglePage: toogleBetweenPages);
    } else {
      return Register(tooglePage: toogleBetweenPages);
    }
  }
}
