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
  var textName = TextEditingController();
  var textDescription = TextEditingController();
  var textUnitPrice = TextEditingController();

  @override
  void initState() {
    textName.text = product.name;
    textDescription.text = product.description;
    textUnitPrice.text = product.unitPrice.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Detail: ${product.name}"),
          backgroundColor: Colors.purple,
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

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildDescriptionField(),
          buildUnitPriceField(),
        ],
      ),
    );
  }

  TextField buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product name"),
      controller: textName,
    );
  }

  TextField buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product description"),
      controller: textDescription,
    );
  }

  TextField buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product unit price"),
      controller: textUnitPrice,
    );
  }

  void selectProcess(Options options) async {
    switch (options) {
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.update(Product.withId(
            id: product.id,
            name: textName.text,
            description: textDescription.text,
            unitPrice: double.tryParse(textUnitPrice.text)));
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}
