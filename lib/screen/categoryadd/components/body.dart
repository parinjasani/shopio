import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopio/database/db_helper.dart';
import 'package:shopio/model/category.dart';

class Body extends StatefulWidget {

  Category? category;

  Body(this.category);

  @override
  State<Body> createState() => _BodyState(category);
}

class _BodyState extends State<Body> {

  DbHelper dbHelper = DbHelper();

  Category? category;


  _BodyState(this.category);

  final categorycontroller = TextEditingController();

  final categorydescriptioncontroller = TextEditingController();

  ImagePicker imagpicker = ImagePicker();

  File? imageFile;

  Future<void> addCategory(Category category, BuildContext context) async {
    int? id = await dbHelper.insert(category);
    if (id != -1) {
      print("Category added successfully");
      category.id = id;
      Navigator.pop(context, category);
    }
    else {
      print("getting error");
    }
  }

  Future<void> updateCategory(Category category, BuildContext context) async {
    int? id = await dbHelper.update(category);
    if (id != -1) {
      print("Category updated successfully");
      category.id = id;
      Navigator.pop(context, category);
    }
    else {
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

  Future<String?> saveimage(File imageFile) async {
    Directory root = await getApplicationSupportDirectory();

    String filename = '${DateTime
        .now()
        .millisecondsSinceEpoch}.svg';

    print(root);
    print(filename);
    var path = await join(root.path, filename);

    File file = await imageFile.copy(path);

    return file.path;
  }


  @override
  void initState() {
    // TODO: implement initState
    if (category != null) {
      categorycontroller.text = category!.title!;
      categorydescriptioncontroller.text = category!.description!;
    }
    super.initState();
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
              onTap: () async {
        pickimagefromgalary();
        // Directory tempdir= await  getTemporaryDirectory();
        // print("tempdirectory : ${tempdir.path}");
        //
        // Directory docdir= await  getApplicationDocumentsDirectory();
        // print("docdirectory : ${docdir.path}");
        //
        // Directory supportdir= await  getApplicationSupportDirectory();
        // print("supportdirectory : ${supportdir.path}");
        },
          child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.30),
              // backgroundImage: imageFile != null
              //     ? FileImage(imageFile!)
              //     : AssetImage(
              //   "assets/images/userlogo.png",) as ImageProvider,
              child: imageFile!=null ? SvgPicture.file(
                imageFile!,
                height: 50,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcIn),
              ) : Icon(Icons.add,size: 50,color: Colors.black45,),
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
      buildaddcategorybutton(context),
      ],
    ),)
    ,
    )
    ,
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

  buildaddcategorybutton(BuildContext context) {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () async {
        String title = categorycontroller.text.toString().trim();
        String desc = categorydescriptioncontroller.text.toString().trim();


        if (imageFile != null) {
          var path = await saveimage(imageFile!);

          if (path != null) {
            if (category != null) {
              //uppdate
              Category cat = Category.withId(
                  title: title,
                  description: desc,
                  id: category!.id,
                  date: category!.date);
              updateCategory(cat, context);
            }
            else {
              // add
              Category category = Category(
                  title: title, description: desc, imagepath: path);
              addCategory(category, context);
            }
          }
        }
        // print("$title $desc");


      },
      child: Text(
        category == null ?
        'Add Category' : 'update category',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }


}
