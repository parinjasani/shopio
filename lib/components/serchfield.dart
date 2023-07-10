import 'package:flutter/material.dart';
class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search product",
          suffixIcon: Icon(Icons.search_rounded),
          contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20)
        ),
      ),
    );
  }
}
