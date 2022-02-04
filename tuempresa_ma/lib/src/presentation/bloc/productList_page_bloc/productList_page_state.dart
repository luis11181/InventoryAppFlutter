abstract class ProductListPageState {}

class ProductListWaitingState implements ProductListPageState {}

class ProductListInputState implements ProductListPageState {
  ProductListInputState({
    this.cantidad = 0,
    this.descripcion = '',
    this.nombre = '',
    this.precio = 0,
    this.productBarcode = '',
    this.unidad = ''
    }) : readyToSubmit = false;

  num cantidad;
  num precio;
  String descripcion;
  String nombre;
  String productBarcode;
  String unidad;
  bool readyToSubmit;
}
