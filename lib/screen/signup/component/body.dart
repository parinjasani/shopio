import 'package:flutter/material.dart';
import 'package:shopio/screen/signup/component/header.dart';
import 'package:shopio/screen/signup/component/signupform.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          AppBar(),
          LayoutHeader(),
          SizedBox(height: 24,),
          SignUpForm(),
        ],
      ),
    );
  }
}
