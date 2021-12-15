import 'package:cloud_firestore/cloud_firestore.dart';

//* query to get the company name from the email of a specific user
Future<String> getCompanyName(String email) async {
  // Call the user's CollectionReference to add a new user
  String companyName;

  companyName = await FirebaseFirestore.instance
      .collection('empleados')
      .where('email', isEqualTo: email)
      .get()
      .then((snapshot) {
    print(snapshot);
    snapshot.docs.forEach((doc) {
      print(doc.data());
    });
    return snapshot.docs[0].data()['empresa'];
  }).catchError((e) {
    print(e);
    return 'error';
  });

  return companyName;
}
