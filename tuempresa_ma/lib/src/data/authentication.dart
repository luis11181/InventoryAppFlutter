import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<String> signUp(String email, String password, String name,
    String lastname, String enterprise, String username) async {
  //TODO cambiar string por union class, de freeze
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return 'funciono';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      return 'The account already exists for that email.';
    }
    return 'Error';
  } catch (e) {
    print(e);
    return e.toString();
  }
}
