import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Center(
                      child: Text(
                    "Date Time Features",
                    textAlign: TextAlign.center,
                  )),
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Day"),
                  onPressed: () {
                    var day = DateFormat("EEE").format(date);
                    Fluttertoast.showToast(
                        msg: "$day",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white);
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text("Date"),
                  onPressed: () {
                    var onlyDate = DateFormat.yMMMd('tr_TR').format(date);
                    //var onlyDate=DateFormat("d MMM, yyyy").format(date);
                    Fluttertoast.showToast(
                        msg: "$onlyDate",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white);
                  },
                ),
                RaisedButton(
                  color: Colors.purple,
                  child: Text("Hour"),
                  onPressed: () {
                    var hour = DateFormat("h:mm a").format(date);
                    Fluttertoast.showToast(
                        msg: "$hour",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
