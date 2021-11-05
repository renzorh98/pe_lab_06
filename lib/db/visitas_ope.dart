import 'package:pe_lab_06/models/visita.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OperationVisita {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'visitas.bd'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE visitas_tb (id INTEGER AUTO INCREMENT PRIMARY KEY, usuario TEXT, peso TEXT, temperatura TEXT, presion TEXT, saturacion TEXT)");
    }, version: 1);
  }

  static Future<int> insert(Visita visita) async {
    Database database = await _openDB();
    return database.insert("visitas_tb", visita.toMap());
  }

  static Future<List<Visita>> visitas() async {
    print("________");
    Database database = await _openDB();

    final List<Map<String, dynamic>> visitaMap =
        await database.query("visita");

    for (var n in visitaMap) {
      print("________" + n['nombreCompleto']);
    }

    return List.generate(
        visitaMap.length,
        (i) => Visita(
            usuarioID: visitaMap[i]['usuario'],
            peso: visitaMap[i]['peso'],
            temperatura: visitaMap[i]['temperatura'],
            presion: visitaMap[i]['presion'],
            saturacion: visitaMap[i]['saturacion']));
  }
}
