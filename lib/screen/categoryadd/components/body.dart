import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopio/database/db_helper.dart';
import 'package:shopio/model/category.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  DbHelper dbHelper = DbHelper();

  final categorycontroller = TextEditingController();

  final categorydescriptioncontroller = TextEditingController();

  ImagePicker imagpicker = ImagePicker();

  File? imageFile;

  Future<void> addCategory(Category category) async {
    int? id=await dbHelper.insert(category);
    if(id!=-1)
      {
        print("Category added successfully");
      }
    else{
      print("getting error");
    }
  }

  Future<void> pickimagefromgalary() async {
    var tempfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (tempfile != null) {
      // print(tempfile.path);
      var file = File(tempfile.path);
      setState(() {
        imageFile = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  pickimagefromgalary();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.30),
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!)
                      : AssetImage("assets/images/userlogo.png",) as ImageProvider,
                  radius: 60,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              buildtitleformfield(),
              SizedBox(
                height: 24,
              ),
              buildDescriptionFormField(),
              SizedBox(
                height: 24,
              ),
              buildaddcategorybutton(),
            ],
          ),
        ),
      ),
    );
  }

  buildtitleformfield() {
    return TextFormField(
      controller: categorycontroller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Category Name",
        labelText: "Category",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildDescriptionFormField() {
    return TextFormField(
      controller: categorydescriptioncontroller,
      keyboardType: TextInputType.multiline,
      maxLines: 2,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Category Description",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildaddcategorybutton() {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () {
        String title = categorycontroller.text.toString().trim();
        String desc = categorydescriptioncontroller.text.toString().trim();
       // print("$title $desc");


        Category category=Category(title: title,description: desc);
        addCategory(category);

      },
      child: Text(
        'Add Category',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }


}
