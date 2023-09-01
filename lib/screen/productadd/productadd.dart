import 'package:flutter/material.dart';
import 'package:shopio/screen/productadd/components/body.dart';

class ProductAdd extends StatelessWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add product"),),
      body: Body(),
    );
  }
}
