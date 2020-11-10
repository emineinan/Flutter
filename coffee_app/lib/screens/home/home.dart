import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/screens/home/order_list.dart';
import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Home"),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text("Sign Out"),
              textColor: Colors.white,
            )
          ],
        ),
        body: OrderList(),
      ),
    );
  }
}
