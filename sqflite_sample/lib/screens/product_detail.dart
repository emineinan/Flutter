import 'package:flutter/material.dart';
import 'package:sqflite_sample/data/dbHelper.dart';
import 'package:sqflite_sample/models/product.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);

  @override
  _ProductDetailState createState() => _ProductDetailState(product);
}

enum Options { delete, update }

class _ProductDetailState extends State<ProductDetail> {
  Product product;
  _ProductDetailState(this.product);
  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Detail: ${product.name}"),
          actions: <Widget>[
            PopupMenuButton<Options>(
              onSelected: selectProcess,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
                PopupMenuItem<Options>(
                  value: Options.delete,
                  child: Text("Delete"),
                ),
                PopupMenuItem<Options>(
                  value: Options.update,
                  child: Text("Update"),
                ),
              ],
            )
          ]),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {}

  void selectProcess(Options options) async {
    switch (options) {
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}
