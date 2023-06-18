import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';

import '../../../constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), () {
      //NAvigate to onboradiing
      Navigator.pushReplacementNamed(context,AppRoute.onboradingscreen);
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: Backgroungradiant,
          ),
        ),
        Center(child: Image.asset("assets/images/shop-logo.png",height:600,width: 300,),)
      ],
    );
  }
}
