import 'package:flutter/material.dart';

import '../../../Routes/approutes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.pushNamed(context, AppRoute.productadd);
    },
    child: Icon(Icons.add, color: Colors.white,),
    )
    );
  }
}
