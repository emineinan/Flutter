import 'package:coffee_app/models/order.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  OrderTile({this.order});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[order.strength],
          ),
          title: Text(order.sugar),
          subtitle: Text("Strength: ${order.strength}"),
        ),
      ),
    );
  }
}
