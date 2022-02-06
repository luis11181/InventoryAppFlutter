import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddProductPageState extends Equatable {
  AddProductPageState({
    this.nombre = '',
    this.cod_barras = '',
    this.caracteristicas = '',
    this.precio = 0,
    this.unidad = '',
  });

  String nombre;
  String cod_barras;
  String caracteristicas;
  double precio;
  String unidad;

  @override
  List<Object?> get props => [nombre,cod_barras,caracteristicas,precio,unidad];
}
