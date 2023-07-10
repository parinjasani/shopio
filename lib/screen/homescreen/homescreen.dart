import 'package:flutter/material.dart';
import 'package:shopio/screen/homescreen/components/body.dart';
import 'package:shopio/screen/homescreen/components/homescreen_drawer.dart';

import '../../components/user.dart';
class HomeScreen extends StatelessWidget {
  // User ? user;
  // HomeScreen(this.user);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
      drawer: HomeScreenDrawer(),
    );
  }

}
