import 'package:flutter/material.dart';

import '../../../database/db_helper.dart';
import '../../../model/category.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Category> categoryList = [];


  int categoryId = -1;

  final DbHelper _dbHelper = DbHelper();

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController(text: '0.0');
  final _discountController = TextEditingController(text: '0');


  @override
  void initState() {
    super.initState();
    getCategoryList();
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
                onTap: () async {},
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.30),
                  radius: 60,
                  /* backgroundImage: imageFile != null
                      ? FileImage(imageFile!)
                      : AssetImage('assets/images/user.png') as ImageProvider,*/
                  child: Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.black45,
                  ),
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

        print('''
          title : $title
          description : $description
          price : $price
          discount : $discount
          categoryId : $categoryId
        ''');

      },
      child: Text(
        'Add Product',
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
    });
  }
}

