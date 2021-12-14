import 'package:firebase_auth/firebase_auth.dart';

//* FirebaseAuth auth = FirebaseAuth.instance;

registerUser (name, lastName, username, email, enterpriseName, password) async { 
    try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: lastName
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}   