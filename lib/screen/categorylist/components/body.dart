import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopio/database/db_helper.dart';
import 'package:shopio/model/category.dart';

import '../../../Routes/approutes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var categorylist = <Category>[];
  DbHelper _dbhelper = DbHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcategorylist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var category =
              await Navigator.pushNamed(context, AppRoute.categoryadd);

          if (category is Category) {
            setState(() {
              categorylist.add(category);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              var category = await Navigator.pushNamed(
                  context, AppRoute.categoryadd,
                  arguments: categorylist[index]);
              if (category is Category) {
                var index = categorylist
                    .indexWhere((element) => element.id == category.id);

                setState(() {
                  categorylist[index] = category;
                });
              }
            },
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              radius: 40,
              child: SvgPicture.file(
                File('${categorylist[index].imagepath}'),
                height: 24,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcIn),
              ),
            ),
            title: Text(categorylist[index].title!),
            subtitle: Text(categorylist[index].description!),
            trailing: GestureDetector(onTap: () {
              showAlertDailogbox(context,categorylist[index]);
            }, child: Icon(Icons.delete)),
          );
        },
      ),
    );
  }

  Future<void> getcategorylist() async {
    var list = await _dbhelper.getcategoylist();
    setState(() {
      categorylist = list;
    });
  }

  Future<void> deleteitem(Category category) async {
    if(category.id != null )
      {
        await _dbhelper.delete(category.id!);
        setState(() {
          categorylist.removeWhere((element) => element.id==category.id);
        });
      }
  }

  Future<dynamic> showAlertDailogbox(BuildContext context,Category category) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete"),
            content: Text("are you sure to want to delete ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    deleteitem(category);
                    Navigator.pop(context);
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
          );
        });
  }
}
