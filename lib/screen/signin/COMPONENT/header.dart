import 'package:flutter/material.dart';
class LayoutHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/shop-logo.png"),
        Text("welcome Back"),
        Text("Log-in using username and password")
      ],
    );
  }
}