class Usuario{
  final String nombreCompleto;
  final String fechaNacimiento;
  final String estatura;
  final String direccion;
  final String gps;


  Usuario({required this.nombreCompleto, required this.fechaNacimiento, required this.estatura,
      required this.direccion, required this.gps});


  Map<String, dynamic> toMap(){
    return{'nombreCompleto': nombreCompleto, 'fechaNacimiento':fechaNacimiento, 'estatura':estatura, 'gps':gps};
  }


}