import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/preferences/pref_utils.dart';

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
    Timer(Duration(seconds: 3), () {
      //NAvigate to onboradiing
      if(PrefUtils.getloginstatus())
        {
          Navigator.pushReplacementNamed(context, AppRoute.homescreen);
        }
      else{
        if(PrefUtils.getonboardingstatus())
          {
            Navigator.pushReplacementNamed(context, AppRoute.signinscreen);
          }
        else
          {
            Navigator.pushReplacementNamed(context,AppRoute.onboradingscreen);
          }
      }

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
