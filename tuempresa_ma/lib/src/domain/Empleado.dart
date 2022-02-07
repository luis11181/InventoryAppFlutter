class Empleado {
  Empleado({
    required this.nombre,
    required this.apellido,
    required this.usuario,
    required this.correo,
  });

  final String nombre;
  final String apellido;
  final String usuario;
  final String correo;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
      nombre: json["name"],
      apellido: json["lastName"],
      correo: json["email"],
      usuario: json["user"]);
}
