import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(30.0),
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: Text(
            "Hello Container",
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
