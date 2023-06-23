import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopio/components/custom_suffix_icon.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String gender = "Male";
  genderselection(String select)
  {
    setState(() {
      gender=select;
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
            height:20,
          ),
          buildsignupbutton(),
        ],
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
        suffixIcon: CustomSuffix(svgIcon: "assets/icon/Mail.svg")
      ),
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
        suffixIcon: CustomSuffix(svgIcon: "assets/icon/Call.svg")
      ),
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
      onTap: () {
        _selectDate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Date of Birth",
        labelText: "Date of Birth",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffix(svgIcon: "assets/icon/Dob.svg")
      ),
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
    );
  }

  buildpassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter password",
        labelText: "password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffix(svgIcon: "assets/icon/Lock.svg")
      ),
    );
  }

  buildconfirmpassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Enter password",
          labelText: "confrim password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffix(svgIcon: "assets/icon/Lock.svg")
      ),
    );
  }

  buildsignupbutton() {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {},
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}


