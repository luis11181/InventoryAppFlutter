import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuempresa_ma/src/data/initFirebase.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

//dbRef.collection("Table").where("exObject.dataToQuery", "==", "value")
CollectionReference empresas = FirebaseFirestore.instance.collection('empresasf');

Future<void> addUser(String name, String lastName, String company, String email,
    String user) async {
  // Call the user's CollectionReference to add a new user
  return empresas.doc(company)
  .collection("empleados").doc(email)
      .set(
        {
        'name': name, //
        'lastName': lastName, // John
        'email': email, //
        'user': user, //
      },
        SetOptions(merge: true), // previous data is not deleted
      )
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

//dbRef.collection("Table").where("exObject.dataToQuery", "==", "value")
CollectionReference users = FirebaseFirestore.instance.collection('empleados');

Future<void> addUser2(String name, String lastName, String company, String email,
    String user) async {
  // Call the user's CollectionReference to add a new user
  return users
      .add({
        'name': name, //
        'lastName': lastName, // John
        'company': company, // Stokes
        'email': email, //
        'user': user, //
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> iniciarProductos(
    String name, String lastName, String company, String email, String user) {
  return empresas
      // existing document in 'users' collection: "ABC123"
      .doc(company)
      .collection("productos").doc("12SDF")
      .set(
        {
        'cantidad': 0, //
        'desccripcion': "no hay", // John
        'nombre': 'producto-prueba', // //
        'productBarcode': "12SDF",
      },
        SetOptions(merge: true), // previous data is not deleted
      )
      .then((value) => print("'full_name' & 'age' merged with existing data!"))
      .catchError((error) => print("Failed to merge data: $error"));
}


