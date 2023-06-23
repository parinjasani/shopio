import 'package:flutter/material.dart';
import 'package:shopio/constant.dart';
class LayoutHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(height: 150,width: 150,"assets/images/welcome-back.png"),
          SizedBox(height: 16,),
          Text("welcome Back",style: headingstyle,),
          SizedBox(height: 8,),
          Text("Log-in using username and password",style: normalText,)
        ],
      ),
    );
  }
}