import 'package:flutter/material.dart';
import 'package:shopio/screen/categoryadd/components/body.dart';
class CategoryAdd extends StatelessWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Category"),
      ),
      body: Body(),
    );
  }
}
