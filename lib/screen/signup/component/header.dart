import 'package:flutter/material.dart';
import 'package:shopio/constant.dart';
class LayoutHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min,
      children: [
        Text("Register Account",style: headingstyle,),
        SizedBox(
          height: 16,
        ),
        const Text(
          "Complete your details or continue\nwith social media",
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}
