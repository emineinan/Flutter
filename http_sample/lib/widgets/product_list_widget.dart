import 'package:http_sample/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http_sample/widgets/product_list_row_widget.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = new List<Product>();

  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        SizedBox(
          height: 500.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }
}
