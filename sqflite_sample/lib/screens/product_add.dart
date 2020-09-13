import 'package:flutter/material.dart';
import 'package:sqflite_sample/data/dbHelper.dart';
import 'package:sqflite_sample/models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var dbHelper = DbHelper();
  var textName = TextEditingController();
  var textDescription = TextEditingController();
  var textUnitPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding New Products"),
      ),
      body: buildBody(),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildDescriptionField(),
          buildUnitPriceField(),
          buildSaveButton(),
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

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        name: textName.text,
        description: textDescription.text,
        unitPrice: double.tryParse(textUnitPrice.text)));
    Navigator.pop(context, true);
  }

  buildSaveButton() {
    return FlatButton(
      child: Text("ADD"),
      onPressed: () {
        addProduct();
      },
    );
  }
}
