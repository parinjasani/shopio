import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/constant.dart';

class LayoutFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have account?",style: normalText,),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, AppRoute.signupscreen);
        }, child: Text("Sign up"))
      ],
    );
  }
}

