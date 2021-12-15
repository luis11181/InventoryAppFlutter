

import 'package:cloud_firestore/cloud_firestore.dart';


//* query to get the company name from the email of a specific user
Future<void> getCompanyName(String email) async {
  // Call the user's CollectionReference to add a new user
        return FirebaseFirestore.instance
          .collection('empleados')
          .where('email' ==  email)
          .get()
          .then((snapshot) {
            snapshot.docs.forEach((doc) {
              return doc.data()['empresa'];
            });
          });
}

