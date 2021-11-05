import 'package:pe_lab_06/models/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'visitas.bd'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE usuarios (id INTEGER AUTO INCREMENT PRIMARY KEY, nombreCompleto TEXT, fechaNacimiento TEXT, estatura TEXT, direccion TEXT, gps TEXT)");
    }, version: 1);
  }

  static Future<int> insert(Usuario usuario) async {
    Database database = await _openDB();
    return database.insert("usuarios", usuario.toMap());
  }

  static Future<List<Usuario>> usuarios() async {
    print("________");
    Database database = await _openDB();

    final List<Map<String, dynamic>> usuariosMap =
        await database.query("usuarios");

    for (var n in usuariosMap) {
      print("________" + n['title']);
    }

    return List.generate(
        usuariosMap.length,
        (i) => Usuario(
            nombreCompleto: usuariosMap[i]['nombreCompleto'],
            fechaNacimiento: usuariosMap[i]['fechaNacimiento'],
            estatura: usuariosMap[i]['estatura'],
            direccion: usuariosMap[i]['direccion'],
            gps: usuariosMap[i]['gps']));
  }
}
