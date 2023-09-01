import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shopio/components/appuser.dart';

class FirebaseService {
  static final FirebaseService _instace = FirebaseService.internal();

  factory FirebaseService() {
    return _instace;
  }

  FirebaseService.internal();

  final FirebaseAuth mAuth = FirebaseAuth.instance;

  final DatabaseReference _mRef =
      FirebaseDatabase.instance.ref(); // path of root

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
}
