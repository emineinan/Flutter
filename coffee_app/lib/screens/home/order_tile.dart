import 'package:coffee_app/models/order.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[order.strength],
          ),
          title: Text(order.name),
          subtitle: Text("${order.sugar} sugar(s)."),
        ),
      ),
    );
  }
}
