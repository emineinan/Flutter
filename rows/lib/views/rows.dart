import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Hello",
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Row",
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Widget",
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}
