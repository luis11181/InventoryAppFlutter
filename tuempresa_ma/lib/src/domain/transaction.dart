class Transaccion {
  Transaccion({required this.empleado, required this.cliente, required this.cantidad, required this.fecha, required this.producto});

    final String empleado ;
    final String cliente ;
    final num cantidad ;
    final String fecha ;
    final String producto ;
  
  factory Transaccion.fromJson(Map<String, dynamic> json) => Transaccion(
    empleado: json["empleado"],
    cliente: json["cliente"],
    cantidad: json["cantidad"],
    fecha: json["fecha"],
    producto: json["producto"],
  );

}

