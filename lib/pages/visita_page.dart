import 'package:flutter/material.dart';
import 'package:pe_lab_06/models/visita.dart';
import 'package:pe_lab_06/db/visitas_ope.dart';

class VisitaPage extends StatelessWidget {
  static const String ROUTE = "/addVisita";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Datos Visita"),
      ),
      body: Container(
        child: _FormSave(),
      ),
    );
  }
}

class _FormSave extends StatelessWidget{
  final FORMKEY = GlobalKey<FormState>();

  final usuarioController = TextEditingController();
  final pesoController = TextEditingController();
  final temperaturaController = TextEditingController();
  final presionController = TextEditingController();
  final saturacionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: FORMKEY,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Nombre Usuario", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: pesoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Peso",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: temperaturaController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Temperatura", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: presionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Presión", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: saturacionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Saturación", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                child: Text("Guardar"),
                onPressed: () {
                  if (FORMKEY.currentState!.validate()) {
                    print("Guardar");
                    OperationVisita.insert(Visita(usuarioID: usuarioController.text, peso: pesoController.text, temperatura: temperaturaController.text, presion: presionController.text, saturacion: saturacionController.text));
                  }
                })
          ],
        ),
      ),
    );
  }

  
}
//CREATE TABLE visitas (id INTEGER AUTO INCREMENT PRIMARY KEY, usuario TEXT, peso TEXT, temperatura TEXT, presion TEXT, saturacion TEXT)\n