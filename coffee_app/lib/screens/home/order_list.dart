import 'package:cloud_firestore/cloud_firestore.dart';
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
    final orders = Provider.of<QuerySnapshot>(context);
    print(orders.documents);
    for (var item in orders.documents) {
      print(item.data);
    }
    return Container();
  }
}
