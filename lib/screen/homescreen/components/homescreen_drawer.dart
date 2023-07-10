import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          builduseraccountHeader(),
        ],
      ),
    );
  }

  builduseraccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(
        "Parin",
        style: TextStyle(color: Colors.white),
      ),
      accountEmail: Text(
        "parinjassani0@gmail.com",
        style: TextStyle(color: Colors.white),
      ),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.blueAccent
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset("assets/images/userlogo.png",height: 60,width: 60,),
      ),
    );
  }
}
