class ProductBodega {
  ProductBodega(
      {required this.cantidad,
      required this.bodega,
      required this.nombre,
      required this.llave});

  final num cantidad;
  final String llave;
  final String nombre;
  final String bodega;

  factory ProductBodega.fromJson(Map<String, dynamic> json, String llave) =>
      ProductBodega(
          cantidad: json["cantidad"],
          nombre: json["nombre"],
          bodega: json["ProductBodega"],
          llave: llave);
}

class Bodega {
  Bodega({required this.productos});

  final List<ProductBodega> productos;
}
