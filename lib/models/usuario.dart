class Usuario{
  late String nombreCompleto;
  late String fechaNacimiento;
  late String estatura;
  late String direccion;
  late String gps;


  Usuario({ required this.nombreCompleto, required this.fechaNacimiento, required this.estatura,
      required this.direccion, required this.gps});

  Usuario.empty();

  Map<String, dynamic> toMap(){
    return{'nombreCompleto': nombreCompleto, 'fechaNacimiento':fechaNacimiento, 'estatura':estatura, 'direccion':direccion, 'gps':gps};
  }


}