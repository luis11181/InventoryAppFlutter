import 'package:cloud_firestore/cloud_firestore.dart';

//* query to get the company name from the email of a specific user
Future<dynamic> getCompanyName(String email) async {
  // Call the user's CollectionReference to add a new user
  var companyName;

  companyName = await FirebaseFirestore.instance
      .collection('empleados')
      .where('email', isEqualTo: email)
      .get()
      .then((snapshot) async {
        if (snapshot.docs[0].data()["company"] != null) {
           return await snapshot.docs[0].data()["company"];
        } else {
          return null;
        }  

  }).catchError((e) {
    print(e);
    return null;
  });

  return companyName;
}
