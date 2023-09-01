import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/firebase/firebase_service.dart';

class HomeScreenDrawer extends StatelessWidget {

  FirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          builduseraccountHeader(),
          ListTile(
            title: Text("Manage category"),
            leading: Icon(Icons.add_box_outlined),
            //navigate to categorylist screen
            onTap: () {
              Navigator.pushNamed(context, AppRoute.categorylist);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.productlist);
            },
            title: Text("Manage Product"),
            leading: Icon(Icons.add_box_outlined),
          ),
          Divider(
            height: 30,
            indent: 40,
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            onTap: () {
              _service.logout().then((value) => Navigator.restorablePushNamedAndRemoveUntil(context, AppRoute.signinscreen, (route) => false));
            },
          ),
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
        "${FirebaseAuth.instance.currentUser!.email}",
        style: TextStyle(color: Colors.white),
      ),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.blueAccent
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/images/userlogo.png", height: 60, width: 60,),
      ),
    );
  }
}
