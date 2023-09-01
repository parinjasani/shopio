import 'package:flutter/material.dart';
import 'package:shopio/screen/productlist/components/body.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product"),),
      body:Body(),
    );
  }
}
