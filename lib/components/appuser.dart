class AppUser{

  String? id;
  String? fname;
  String? lname;
  String? email;
  String? contact;
  String? gender;
  String? userType;
  String? dob;
  String? address;
  String? password;


  AppUser({this.fname, this.lname, this.email, this.contact,
    this.gender, this.userType, this.dob, this.address, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'firstname': this.fname,
      'lastname': this.lname,
      'email': this.email,
      'contact': this.contact,
      'gender': this.gender,
      'userType': this.userType,
      'dob': this.dob,
      'address': this.address,
      'password': this.password,
    };
  }

}

