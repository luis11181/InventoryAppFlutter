abstract class AddProductPageState {}

class WaitingAddProductPageState extends AddProductPageState {
  WaitingAddProductPageState({
    this.nombre = '',
    this.cod_barras = '',
    this.caracteristicas = '',
    this.precio = 0,
    this.unidad = '',
  });

  String nombre;
  String cod_barras;
  String caracteristicas;
  int precio;
  String unidad;
}

class InputProductInfoState extends AddProductPageState {
  InputProductInfoState({
    this.nombre = '',
    this.cod_barras = '',
    this.caracteristicas = '',
    this.precio = 0,
    this.unidad = '',
  });

  String nombre;
  String cod_barras;
  String caracteristicas;
  int precio;
  String unidad;
}
