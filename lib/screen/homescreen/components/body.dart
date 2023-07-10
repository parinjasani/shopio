import 'package:flutter/material.dart';
import 'package:shopio/screen/homescreen/components/header.dart';
class Body extends StatelessWidget {

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LayoutHeader()
          ],
        ),
      ),
    );
  }
}
