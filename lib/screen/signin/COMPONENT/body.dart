import 'package:flutter/material.dart';
import 'package:shopio/screen/signin/COMPONENT/header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutHeader(),
      ],
    );
  }
}
