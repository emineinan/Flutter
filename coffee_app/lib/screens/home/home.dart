import 'package:coffee_app/models/order.dart';
import 'package:coffee_app/screens/home/order_list.dart';
import 'package:coffee_app/screens/home/settings_form.dart';
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

  void showSettingsPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.red,
            padding: EdgeInsets.all(20.0),
            child: SettingForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Home"),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                showSettingsPanel();
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: Text("Settings"),
              textColor: Colors.white,
            ),
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
            ),
          ],
        ),
        body: OrderList(),
      ),
    );
  }
}
