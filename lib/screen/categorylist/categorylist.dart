import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/screen/categorylist/components/body.dart';
class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Body(),
      appBar: AppBar(
        title: Text("Category"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.categoryadd);
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
