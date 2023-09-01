import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/components/custom_suffix_icon.dart';
import 'package:shopio/firebase/firebase_service.dart';
import 'package:shopio/preferences/pref_utils.dart';
import 'package:shopio/theme.dart';
import 'package:shopio/utils/utils.dart';

import '../../../components/user.dart';
class SigninForm extends StatefulWidget {
  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
   final _emailcontroller=TextEditingController();
   final _passwordcontroller=TextEditingController();
   String? erroremail,errorpassword;

   FirebaseService _service=FirebaseService();



   Future<void> loginwithfirebase(BuildContext context, String email, String password) async {

     var credential=await _service.login(email,password);

     if(credential is UserCredential)
       {
         // suceesfully enter
         if(credential.user != null)
           {
             //user exist
             print("${credential.user!.uid}");
             //navigate to homescreen
             Navigator.pushNamedAndRemoveUntil(context, AppRoute.homescreen, (route) => false);
           }
       }
     else if(credential is String)
     {
       //exception return failed
       print("exception occur");
     }
     else{
       print("object is null");
     }


   }

   @override
  void dispose() {
    // TODO: implement dispose
     _emailcontroller.dispose();
     _passwordcontroller.dispose();
    super.dispose();
  }
   @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildemailtextfield(),
          SizedBox(height: 24,),
          buildpasswordtextfield(),
          SizedBox(
            height: 24,
          ),
          buildforgotpass(),
          SizedBox(
            height: 24,
          ),
          buildsigninbutton(context),
        ],
      ),
    );
  }

  buildemailtextfield() {
    return TextFormField(
      controller: _emailcontroller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Email address",
        errorText: erroremail,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffix(svgIcon: 'assets/icon/Mail.svg',),
      ),
    );
  }

  buildpasswordtextfield() {
    return TextFormField(
      controller: _passwordcontroller,
      keyboardType: TextInputType.text,
      obscureText:true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Password",

        errorText: errorpassword,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffix(svgIcon: "assets/icon/Lock.svg"),
      ),
    );
  }

  buildforgotpass() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
        },
        child: Text(
          "Forgot password?",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  buildsigninbutton(BuildContext context) {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {
        String email=_emailcontroller.text.toString().trim();
        String password=_passwordcontroller.text.toString().trim();
        //User user=User(email:email);
        if(email.isEmpty||!Utils.isValidEmail(email))
          {
            setState(() {
              erroremail="Enter valid email";
            });
          }
          if(!Utils.isValidPassword(password))
          {
            setState(() {
              errorpassword="Enter valid password";
            });
          }
        else{

          //navigate to the home screen
          //   PrefUtils.updateloginstatus(true).then((value) {
          //     if(value)
          //       {
          //         Navigator.pushNamedAndRemoveUntil(context,AppRoute.homescreen, (route) => false,arguments: user);
          //       }
          //   },);
            loginwithfirebase(context,email,password);
        }
      },
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

}
