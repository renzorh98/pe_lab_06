
class Visita{
  late String usuarioID;
  late String peso;
  late String temperatura;
  late String presion;
  late String saturacion;

  Visita({required this.usuarioID, required this.peso, required this.presion, required this.saturacion, required this.temperatura});
  Visita.empty();
  Map<String, dynamic> toMap(){
    return{'usuarioID': usuarioID, 'peso':peso, 'temperatura':temperatura, 'presion':presion, 'saturacion':saturacion};
  }

}
