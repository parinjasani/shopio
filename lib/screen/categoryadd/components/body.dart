import 'package:flutter/material.dart';
class Body extends StatelessWidget {
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

                },
                child: CircleAvatar(
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
      keyboardType: TextInputType.multiline,
      maxLines:2,
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
      onPressed: () async {
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
