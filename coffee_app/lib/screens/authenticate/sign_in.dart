import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/shared/constants.dart';
import 'package:coffee_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function tooglePage;

  SignIn({Key key, this.tooglePage}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text("Sign In"),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.tooglePage();
                    },
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            body: Center(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? "Please enter your email!" : null,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration:
                              inputDecoration.copyWith(hintText: "Email"),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (value) => value.length < 6
                              ? "Password cannot be less than 6 characters.!"
                              : null,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration:
                              inputDecoration.copyWith(hintText: "Password"),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _authService.signIn(email, password);

                              if (result == null) {
                                setState(() {
                                  error = "Login failed!";
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.red,
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ),
                  )),
            ),
          );
  }
}
