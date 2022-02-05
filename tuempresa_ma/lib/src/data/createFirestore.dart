import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

//! ------------------------- FUNCIONES PARA TRANSFORMAR INFORMACION DE LAS TABLAS
CollectionReference empresas =
    FirebaseFirestore.instance.collection('empresasf');

//! --------crear una nueva trasaccion .   salida o ingreso de inventario
Future<void> transaccion(String company, int cantidad, String code,
    String email, String cliente, String bodega) async {
  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

  var producInfo = await getProductInfo(company, code);

  empresas
      .doc(company)
      .collection("transacciones")
      .add({
        'cantidad': cantidad, //
        'fecha': formattedDate, //
        'cliente': cliente, //
        'empleado': email, //
        'producto': producInfo['nombre'], // //
      })
      .then((value) => print("updated transaction table fro transaction"))
      .catchError((error) => print(
          "Failed to updated tranasctiopn table fro transaction: $error"));

  empresas
      .doc(company)
      .collection("productos")
      .doc(code)
      .update({'cantidad': FieldValue.increment(cantidad)})
      .then((value) => print("updated products table fro transaction"))
      .catchError((error) =>
          print("Failed to updated products table fro transactionr: $error"));

  var infoBodega = await getBodegaInfo(company, code, bodega);

  var noExiste = true;


  if (infoBodega != null) {

  print(infoBodega);
  
  infoBodega.forEach((k,v){ 
    //
      if (k == code) {

        noExiste = false;

        empresas
            .doc(company)
            .collection("bodegas")
            .doc(bodega)
            .update({
              '$code.cantidad': FieldValue.increment(cantidad),
            })
            .then((value) => print("updated bodegas table fro transaction"))
            .catchError((error) => print(
                "Failed to updated bodegas table fro transactionr: $error"));
      }

    }); 

  }

    if (noExiste) {
      empresas
          .doc(company)
          .collection("bodegas")
          .doc(bodega)
          .set({
             code:{
              'cantidad': cantidad, 'nombre': producInfo['nombre']}
            
          }, SetOptions(merge: true))
          .then((value) => print("updated bodegas table fro transaction"))
          .catchError((error) => print(
              "Failed to updated bodegas table fro transactionr: $error"));
    }


  return;
}

//! --------crear un nuevO producto .
Future<void> crearProduct(String company, String code, String name,
    String descripcion, String bodega, int precio, String unidad) async {
  return empresas
      // existing document in 'users' collection: "ABC123"
      .doc(company)
      .collection("productos")
      .doc(code)
      .set(
        {
          'cantidad': 0, //
          'descripcion': descripcion, // John
          'precio': precio, //
          'nombre': name, // //
          'productBarcode': code, //
          'unidad': unidad, //
        },
        SetOptions(merge: true), // previous data is not deleted
      )
      .then((value) => print("'full_name' & 'age' merged with existing data!"))
      .catchError((error) => print("Failed to merge data: $error"));
}
