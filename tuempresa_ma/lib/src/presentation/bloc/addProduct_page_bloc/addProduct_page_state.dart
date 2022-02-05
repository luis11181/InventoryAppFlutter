import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddProductPageState extends Equatable {
  AddProductPageState({
    this.cantidad = 0,
    required this.nombre,
    /*
    required this. cod_barras,
    required this.caracteristicas,
    required this.precio_compra,
    required this.precio_venta,
    required this.bod_cant,

     */
  });

  int cantidad;
  String nombre;
  /*
  String cod_barras;
  String caracteristicas;
  int precio_compra;
  int precio_venta;
  Map bod_cant;

   */

  @override
  List<Object?> get props => [cantidad];
}
