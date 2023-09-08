import 'package:flutter/material.dart';
import 'package:shopio/model/product.dart';
import 'package:shopio/screen/productadd/components/body.dart';

class ProductAdd extends StatelessWidget {
  Product? product;


  ProductAdd({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product == null ? "Add product" : "Update product"),),
      body: Body(product),
    );
  }
}
