import 'package:flutter/material.dart';
import 'package:shopio/model/category.dart';
import 'package:shopio/screen/categoryadd/components/body.dart';
class CategoryAdd extends StatelessWidget {

  Category? category;

  CategoryAdd({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category==null ? "Add Category" : "Edit Category"),
      ),
      body: Body(category),
    );
  }
}
