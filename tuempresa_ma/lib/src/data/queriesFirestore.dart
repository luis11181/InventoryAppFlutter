import 'package:cloud_firestore/cloud_firestore.dart';

//! ------------------------- FUNCIONES PARA OBTENER INFORMACION DEL USUARIO
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

//* query to get the name from the email of a specific user
Future<dynamic> getName(String email) async {
  // Call the user's CollectionReference to add a new user
  var Name;

  Name = await FirebaseFirestore.instance
      .collection('empleados')
      .where('email', isEqualTo: email)
      .get()
      .then((snapshot) async {
    if (snapshot.docs[0].data()["name"] != null) {
      return await snapshot.docs[0].data()["name"];
    } else {
      return null;
    }
  }).catchError((e) {
    print(e);
    return null;
  });

  return Name;
}

CollectionReference empresas =
    FirebaseFirestore.instance.collection('empresasf');

//! --------crear una nueva trasaccion .   salida o ingreso de inventario

//* query to get the info of a product
Future<dynamic> getProductInfo(String company, String barCode) async {
  // Call the user's CollectionReference to add a new user
  var info;

  info = await FirebaseFirestore.instance
      .collection('empresasf')
      .doc(company)
      .collection('productos')
      .doc(barCode)
      .get()
      .catchError((e) {
    print('error al cargar info del producto' + e);
  });

  return info.data();
}

//* query to get the info inside the bodega
Future<dynamic> getBodegaInfo(
    String company, String barCode, String bodega) async {
  // Call the user's CollectionReference to add a new user
  var info;
  var result;

  info = await FirebaseFirestore.instance
      .collection('empresasf')
      .doc(company)
      .collection('bodegas')
      .doc(bodega)
      .get()
      .catchError((e) {
    print(e);
  });

  if (info.exists) {
    Map<String, dynamic>? result = info.data();

  return result;
  } else {
    return null;
  }

}

//* query to get the info of products
Future<dynamic> getProducts(String company, int name) async {
  var info;
  info = await empresas
      .doc(company)
      .collection("productos")
      .where("nombre", isEqualTo: name)
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info.exists) {
    //Map<String, dynamic>? result = info.data();

    return info.data();
  } else {
    return null;
  }
  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}

//* query to get the info of products
Future<dynamic> getAllProducts(String company) async {
  var info;
  info = await empresas
      .doc(company)
      .collection("productos")
      .get()
      .catchError((error) => print("Failed to bring products: $error"));
      
  if (info.exists) {
    return info.data();
  } else {
    return null;
  }
  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}