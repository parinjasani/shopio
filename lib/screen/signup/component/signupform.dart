import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopio/model/appuser.dart';
import 'package:shopio/components/custom_suffix_icon.dart';
import 'package:shopio/firebase/firebase_service.dart';
import 'package:shopio/utils/utils.dart';

import '../../../Routes/approutes.dart';
import '../../../preferences/pref_utils.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _passcontroller = TextEditingController();
  final _dobcontrolller = TextEditingController();
  bool passwordvisible = false;
  bool passwordvisible1=false;
  String gender = "Male";
  final _formKey = GlobalKey<FormState>();
  String? _fname, _lname, _email, _contact, _password;
  String address = " ", usertype = " ", dob = " ";


   FirebaseService _service=FirebaseService();
  Future<void> createaccount(BuildContext context,AppUser user) async {
   var credential= await _service.signUp(user.email!,user.password!);
   if(credential is UserCredential)
     {
       if(credential.user != null)
       {
         user.id=credential.user!.uid;
         print("${credential.user!.uid}");
         _service.createuser(user).then((value) {
           //sucess
           Navigator.pushNamedAndRemoveUntil(context, AppRoute.homescreen,(route) => false);
         }).catchError((error){
           //error
           print("error : ${error.toString()}");
         });
       }
     }
   else if(credential is String){
     print("exception occur");
   }
  }
  genderselection(String select) {
    setState(() {
      gender = select;
    });
  }

  Future _selectDate() async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly
        /*helpText: 'Select date of birth',
      confirmText: 'Done',
      cancelText: 'Cancel',
      fieldLabelText: 'DOB',
      */
        );
    if (pickedDate != null) {
      setState(() {
        dob =
            '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year.toString().padLeft(2, '0')}';
        _dobcontrolller.text = dob;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildNameformfield(),
            SizedBox(
              height: 16,
            ),
            buildemailformfield(),
            SizedBox(
              height: 16,
            ),
            buildcontanctformfield(),
            SizedBox(
              height: 16,
            ),
            buildgenderformfield(),
            SizedBox(
              height: 16,
            ),
            buildusertypeformfield(),
            SizedBox(
              height: 16,
            ),
            builddateofbirthformfield(),
            SizedBox(
              height: 16,
            ),
            buildaddressformfield(),
            SizedBox(
              height: 16,
            ),
            buildpassword(),
            SizedBox(
              height: 16,
            ),
            buildconfirmpassword(),
            SizedBox(
              height: 20,
            ),
            buildsignupbutton(context),
          ],
        ),
      ),
    );
  }

  buildNameformfield() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "First name",
              labelText: "First name",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            onSaved: (newValue) {
              _fname = newValue;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "First name";
              } else {
                return null;
              }
            },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Last name",
              labelText: "Last name",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            onSaved: (newValue) {
              _lname = newValue;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Last name";
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }

  buildemailformfield() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Email Id",
          labelText: "Email id",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffix(svgIcon: "assets/icon/Mail.svg")),
      onSaved: (newValue) {
        _email = newValue;
      },
      validator: (value) {
        if (value == null || value.isEmpty || !Utils.isValidEmail(value)) {
          return "Invalid Email";
        } else {
          return null;
        }
      },
    );
  }

  buildcontanctformfield() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          hintText: "Contact",
          labelText: "Contact",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffix(svgIcon: "assets/icon/Call.svg")),
      onSaved: (newValue) {
        _contact = newValue;
      },
      validator: (value) {
        if (value == null || value.isEmpty || !Utils.isValidContact(value)) {
          return "Invalid contact";
        } else {
          return null;
        }
      },
    );
  }

  buildgenderformfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text("Gender"),
          Expanded(
              child: Row(
            children: [
              Radio(
                value: "Male",
                groupValue: gender,
                onChanged: (value) {
                  genderselection(value.toString());
                },
              ),
              Text("Male"),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Radio(
                value: "Female",
                groupValue: gender,
                onChanged: (value) {
                  genderselection(value.toString());
                },
              ),
              Text("Female"),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Radio(
                value: "Other",
                groupValue: gender,
                onChanged: (value) {
                  genderselection(value.toString());
                },
              ),
              Text("Other"),
            ],
          ))
        ],
      ),
    );
  }

  buildusertypeformfield() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black,
      decoration: InputDecoration(
          hintText: "Select User Type",
          labelText: "User Type",
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Select usertype";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        usertype = newValue.toString();
      },
      items: [
        DropdownMenuItem(
          child: Text("Vendor"),
          value: "Vendor",
        ),
        DropdownMenuItem(
          child: Text("User"),
          value: "User",
        ),
      ],
      onChanged: (value) {},
    );
  }

  builddateofbirthformfield() {
    return TextFormField(
      controller: _dobcontrolller,
      onTap: () {
        _selectDate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Date of Birth",
          labelText: "Date of Birth",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffix(svgIcon: "assets/icon/Dob.svg")),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Select date";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        dob = newValue.toString();
      },
    );
  }

  buildaddressformfield() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Address",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onSaved: (newValue) {
        address = newValue.toString();
      },
    );
  }

  buildpassword() {
    return TextFormField(
      controller: _passcontroller,
      keyboardType: TextInputType.text,
      obscureText: passwordvisible1,
      decoration: InputDecoration(
        hintText: "Enter password",
        labelText: "password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // suffixIcon: CustomSuffix(
        //   svgIcon: "assets/icon/Lock.svg",
        // ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              color: Colors.grey,
              icon:
              Icon(passwordvisible1 ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  passwordvisible1=!passwordvisible1;
                });
              },
            ),
          )
      ),
      onSaved: (newValue) {
        _password = newValue;
      },
      validator: (value) {
        if (value == null || value.isEmpty || !Utils.isValidPassword(value)) {
          return "Invalid password";
        } else {
          return null;
        }
      },
    );
  }

  buildconfirmpassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: passwordvisible,
      decoration: InputDecoration(
        hintText: "Enter password",
        labelText: "confrim password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // suffixIcon: CustomSuffix(svgIcon: "assets/icon/Lock.svg")
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            color: Colors.grey,
            icon: Icon(passwordvisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                passwordvisible = !passwordvisible;
              });
            },
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value != _passcontroller.text.toString()) {
          return "Passwoord mismatch";
        } else {
          return null;
        }
      },
    );
  }

  buildsignupbutton(BuildContext context) {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          print(''' 
          name:-${_fname}+${_lname}
          Email:-${_email}
          Contact:-${_contact}
          gender:-${gender}
          usertype:-${usertype}
          dob:-${dob}
          address:-${address}''');

         var user=AppUser(fname: _fname,lname:_lname,email: _email,contact: _contact,gender: gender,userType: usertype,dob:dob,address: address,password: _password);
          //store this data to databae or server
          // PrefUtils.updateloginstatus(true).then((value) {
          //   if(value)
          //   {
          //     Navigator.pushNamedAndRemoveUntil(context,AppRoute.homescreen, (route) => false);
          //   }
          // },);
          createaccount(context,user);
        }
      },
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

}
