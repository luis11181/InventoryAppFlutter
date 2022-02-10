import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/bodega.dart';

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

  if (info != null) {
    Map<String, dynamic>? result = info.data();

    return result;
  } else {
    return null;
  }
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getAllbodegas(String company) async {
  final info = await empresas
      .doc(company)
      .collection("bodegas")
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info != null) {
    final xx = info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getBodegas(
    String company, String code) async {
  Map producto = await getProductInfo(company, code);

  if (producto != null && producto['nombre']?.toString() != null) {
    String nombre = producto['nombre'];

    final info = await empresas
        .doc(company)
        .collection("bodegas")
        .where("code.nombre", isEqualTo: nombre)
        .get()
        .catchError((error) => print("Failed to bring products: $error"));

    if (info != null) {
      final List<Map<String, dynamic>> xx =
          info.docs.map((doc) => doc.data()).toList();
      //var xxx =info.docs.data();
      return xx;
    } else {
      return [];
    }
  } else {
    return [];
  }

  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getProducts(
    String company, String name) async {
  final info = await empresas
      .doc(company)
      .collection("productos")
      .where("nombre", isEqualTo: name)
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info != null) {
    final List<Map<String, dynamic>> xx =
        info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getAllProducts(String company) async {
  final info = await empresas
      .doc(company)
      .collection("productos")
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info != null) {
    final List<Map<String, dynamic>> xx =
        info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getAllTransactions(String company) async {
  final info = await empresas
      .doc(company)
      .collection("transacciones")
      .limit(15)
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info != null) {
    final List<Map<String, dynamic>> xx =
        info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getTransactions(
    String company, String producto) async {
  final info = await empresas
      .doc(company)
      .collection("transacciones")
      .where("producto", isEqualTo: producto)
      .limit(15)
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info != null) {
    final List<Map<String, dynamic>> xx =
        info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
  // .collection("productos")
  //.orderBy('name', descending: true)
  //.startAt(test)
  //.endAt(test+'\uf8ff')
}

//* query to get the info of products
Future<List<Map<String, dynamic>>> getAllEmpleados(String company) async {
  final info = await empresas
      .doc(company)
      .collection("empleados")
      .limit(15)
      .get()
      .catchError((error) => print("Failed to bring products: $error"));

  if (info != null) {
    final List<Map<String, dynamic>> xx =
        info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
}

Future<List<Map<String, dynamic>>> getEmpleados(
    String company, String name) async {
  final info = await empresas
      .doc(company)
      .collection("empleados")
      .where("name", isEqualTo: name)
      .limit(15)
      .get()
      .catchError((error) => print("Failed to bring empleados: $error"));

  if (info != null) {
    final List<Map<String, dynamic>> xx =
        info.docs.map((doc) => doc.data()).toList();
    //var xxx =info.docs.data();
    return xx;
  } else {
    return [];
  }
}
