import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopio/firebase/firebase_service.dart';
import 'package:shopio/model/product.dart';

import '../../../database/db_helper.dart';
import '../../../model/category.dart';

class Body extends StatefulWidget {
  Product? product;

  Body(this.product);


  @override
  State<Body> createState() => _BodyState(product);
}

class _BodyState extends State<Body> {

   Product? product;
  _BodyState(this.product);



   List<Category> categoryList = [];

   ImagePicker imagePicker = ImagePicker();

  File? imageFile;

  int categoryId = -1;

  final DbHelper _dbHelper = DbHelper();


  FirebaseService _service= FirebaseService();

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController(text: '0.0');
  final _discountController = TextEditingController(text: '0');

  Future<void> pickimagefromcamera() async {
    var tempfile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (tempfile != null) {

      var file = File(tempfile.path);
      print("path (gallery) ${file.path}");
      print("basename ${basename(tempfile.path)}");
      setState(() {
        imageFile = file;
      });
    }
  }
   Future<String?> saveimage(File imageFile) async {
    return await _service.uploadproductimage(imageFile);
   }
  void addProduct(Product product,BuildContext context) {
     _service.addProduct(product).then((value) {
       if(value)
         {
           Navigator.pop(context);
         }
     },);
  }

  @override
  void initState() {
    super.initState();
    getCategoryList();
   ;

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
                  pickimagefromcamera();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.30),
                  // backgroundImage: imageFile != null
                  //     ? FileImage(imageFile!)
                  //     : AssetImage(
                  //   "assets/images/userlogo.png",) as ImageProvider,
                  child: imageFile != null
                      ? CircleAvatar(
                    radius: 60,
                    foregroundImage: FileImage(imageFile!) ,
                  )
                      : Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.black45,
                  ),
                  radius: 60,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              buildTitleFormField(),
              SizedBox(
                height: 16,
              ),
              buildDescriptionFormField(),
              SizedBox(
                height: 24,
              ),
              buildCategoryFormField(),
              SizedBox(
                height: 24,
              ),
              buildPriceFormField(),
              SizedBox(
                height: 24,
              ),
              buildAddProductButtonWidget(context),
              SizedBox(
                height: 24,
              ),
              /*  ElevatedButton(onPressed: () {
                File tempFile = File('/data/user/0/com.example.shoppio_app_flutter/files/1688204156419.jpg');
                setState(() {
                  imageFile = tempFile;
                });
              }, child: Text('GET FILE FROM INTERNAL STORAGE'))*/
            ],
          ),
        ),
      ),
    );
  }

  buildPriceFormField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter amount';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {},
            decoration: InputDecoration(
              labelText: "Price",
              hintText: 'Enter Price',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFormField(
            controller: _discountController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter discount';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {},
            decoration: InputDecoration(
              labelText: "Discount",
              hintText: 'Enter Discount',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        )
      ],
    );
  }

  buildTitleFormField() {
    return TextFormField(
      controller: _titleController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Product",
        hintText: 'Product Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildDescriptionFormField() {
    return TextFormField(
      controller: _descController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: 'Product Description',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildCategoryFormField() {
    return DropdownButtonFormField(
      value: product == null ? null : categoryId,
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null) {
          return 'Select category';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {},
      decoration: InputDecoration(
          labelText: "Category",
          hintText: 'Select Category',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: categoryList.map((category) {
        return DropdownMenuItem(
          value: category.id,
          child: Text(
            '${category.title}',
          ),
        );
      }).toList(),
      onChanged: (value) {
        categoryId = value!;
      },
    );
  }

  buildAddProductButtonWidget(BuildContext context) {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () async {

        String title = _titleController.text.toString().trim();
        String description = _descController.text.toString().trim();
        double price = _priceController.text.toString().trim().isEmpty ? 0.0 : double.parse(_priceController.text.toString().trim());
        int discount = _discountController.text.toString().trim().isEmpty ? 0 : int.parse(_discountController.text.toString().trim());

        var path = await saveimage(imageFile!);
        print('product imagepath: $path');
        if(product==null)
          {
            Product product1=Product(title: title, description: description, mrp: price, discount: discount, categoryid: categoryId, imagepath: path!);

            addProduct(product1,context);

          }
        else{
          _service.updateproduct(title, description,categoryId, discount, price,product!.id); //,path!);
          Navigator.pop(context);
        }
        // print('''
        //   title : $title
        //   description : $description
        //   price : $price
        //   discount : $discount
        //   categoryId : $categoryId
        // ''');

      },
      child: Text(
        product == null ? 'Add Product' : 'Update Product',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> getCategoryList() async {
    var list = await _dbHelper.getcategoylist();
    setState(() {
      categoryList = list;

      if(product!=null){
        _titleController.text=product!.title;
        _descController.text=product!.description;
        _priceController.text='${product!.mrp}';
        _discountController.text="${product!.discount}";
        categoryId =product!.categoryid;
      }

    });
  }

}

