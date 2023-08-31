import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';

class HomeScreenDrawer extends StatelessWidget {



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
            title: Text("Manage Product"),
            leading: Icon(Icons.add_box_outlined),
          ),
          Divider(
            height:30,
            indent: 40,
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacementNamed(context, AppRoute.signinscreen));
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
