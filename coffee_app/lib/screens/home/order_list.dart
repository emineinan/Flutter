import 'package:coffee_app/models/order.dart';
import 'package:coffee_app/screens/home/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  OrderList({Key key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Order>>(context) ?? [];
    orders.forEach((order) {
      print(order.name);
      print(order.sugar);
      print(order.strength);
    });
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderTile(
            order: orders[index],
          );
        });
  }
}
