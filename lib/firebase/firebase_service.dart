import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:shopio/model/appuser.dart';
import 'package:shopio/model/product.dart';

class FirebaseService {
  static final FirebaseService _instace = FirebaseService.internal();

  factory FirebaseService() {
    return _instace;
  }

  FirebaseService.internal();

  final FirebaseAuth mAuth = FirebaseAuth.instance;

  final DatabaseReference _mRef = FirebaseDatabase.instance.ref(); // path of root
  
  final Reference  _storageRef = FirebaseStorage.instance.ref();

  Future<dynamic> login(String email, String password) async {
    try {
      final credential = await mAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  Future<dynamic> signUp(String email, String password) async {
    try {
      final credential = await mAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    return await mAuth.signOut();
  }

  /*********************************************************FireBase service****************************************************************/

  Future<void> createuser(AppUser user) async {
    await _mRef.child("user-node").child("${user.id!}").set(user.toMap());
  }

  /*add product value to product */
  Future<bool> addProduct(Product product) async {
    var id = _mRef.push().key;
    if (id != null) {
      product.id = id;
      await _mRef
          .child("product-node")
          .child("${product.id!}")
          .set(product.toMap());
      return true;
    }
    return false;
  }

  /*get productlist from firebse*/
  Stream<List<Product>> getproductlist() {
    return _mRef.child("product-node").onValue.map((event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      if (map == null) {
        return [];
      }
      // return map.entries.map((e) {
      //   Map<String,dynamic> value = e.value;
      //   return Product.fromMap(value);
      // }).toList(); // ama key ane value banne male

      return map.values.map((e) {
        Map<dynamic, dynamic> value = e;
        return Product.fromMap(value);
      }).toList();
    });
  }

  /*delete product*/

  Future<bool> deleteproduct(String pid) async {

    try{
      await _mRef.child('product-node').child(pid).remove();
      return true;
    }catch (e){
      return false;
    }

  }


  /*update product*/

Future<void> updateproduct(String title,String desc,int catid,int dis,double price,String? pid)  // ,String url)
async {
   await _mRef.child('product-node').child(pid!).update(
     {
       'title' : title ,
       'description':desc,
       'categoryid' : catid,
       'discount' : dis,
       'mrp' : price,
        //'imagepath' : url
      }
   );
}
/*********************************************************FireBase storage****************************************************************/

//uploaad image
Future<String?> uploadproductimage(File imageFile) async {

  String? url;
  try {
    // Upload raw data.
    String tempfile = basename(imageFile.path);
    var ex= extension(tempfile);
    String mfilename= '${DateTime.now().millisecondsSinceEpoch}$ex';
    await _storageRef.child('product').child(mfilename).putFile(imageFile);//to store files in storage
    url = await _storageRef.child('product').child(mfilename).getDownloadURL();// to get dowanloadurl frmm stored image
    //await _mRef.child('product').child(PID).update{
     // 'imagepath' : url
    // }
  } catch (e) {
    // ...
  }
  return url;
}
}
