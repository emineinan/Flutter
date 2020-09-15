import 'package:flutter/material.dart';
import 'package:sqflite_sample/screens/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
