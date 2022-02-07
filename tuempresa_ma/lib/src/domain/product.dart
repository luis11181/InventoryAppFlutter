class Product {
  Product({
    required this.cantidad,
    required this.descripcion,
    required this.nombre,
    required this.precio,
    required this.productBarcode,
    required this.unidad,
  });

  final num cantidad;
  final num precio;
  final String descripcion;
  final String nombre;
  final String productBarcode;
  final String unidad;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        cantidad: json["cantidad"],
        precio: json["precio"],
        descripcion: json["descripcion"],
        nombre: json["nombre"],
        productBarcode: json["productBarcode"],
        unidad: json["unidad"]
      );
}
