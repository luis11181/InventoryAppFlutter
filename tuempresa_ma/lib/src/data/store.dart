import 'package:cloud_firestore/cloud_firestore.dart';
//dbRef.collection("Table").where("exObject.dataToQuery", "==", "value")
CollectionReference users = FirebaseFirestore.instance.collection('empleados');

Future<void> addUser(String name, String lastName, String company, String email,
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

CollectionReference empresas =
    FirebaseFirestore.instance.collection('empresas');

Future<void> addEmpresa(
    String name, String lastName, String company, String email, String user) {
  return empresas
      // existing document in 'users' collection: "ABC123"
      .doc(company)
      .set(
        {'producto de prueba':{'bodega1': {'cantidad': 1, 'precio': 18},'bodega2': {'cantidad': 1, 'precio': 18}}},
        SetOptions(merge: true), // previous data is not deleted
      )
      .then((value) => print("'full_name' & 'age' merged with existing data!"))
      .catchError((error) => print("Failed to merge data: $error"));
}
