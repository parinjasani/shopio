import 'package:flutter/material.dart';
import 'package:shopio/components/custom_suffix_icon.dart';
import 'package:shopio/theme.dart';
class SigninForm extends StatefulWidget {
  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {

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
          buildsigninbutton(),
        ],
      ),
    );
  }

  buildemailtextfield() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Email address",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffix(svgIcon: 'assets/icon/Mail.svg',),
      ),
    );
  }

  buildpasswordtextfield() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Password",
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

  buildsigninbutton() {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {},
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
