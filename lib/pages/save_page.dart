import 'package:flutter/material.dart';
import 'package:pe_lab_06/db/operation.dart';
import 'package:pe_lab_06/models/usuario.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = "/save";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
      ),
      body: Container(
        child: _FormSave(),
      ),
    );
  }
}

class _FormSave extends StatelessWidget {
  final FORMKEY = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final fechaController = TextEditingController();
  final estaturaController = TextEditingController();
  final direccionController = TextEditingController();
  final ubicacionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: FORMKEY,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nombreController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Nombre Completo", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: fechaController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Fecha de Nacimiento",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: estaturaController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Estatura", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: direccionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Direccion", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: ubicacionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Se debe ingresar el dato solicitado";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Ubicacion GPS", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                child: Text("Guardar"),
                onPressed: () {
                  if (FORMKEY.currentState!.validate()) {
                    print("Guardar");
                    Operation.insert(Usuario(nombreCompleto: nombreController.text, fechaNacimiento: fechaController.text, estatura: estaturaController.text, direccion: direccionController.text, gps: ubicacionController.text));
                  }
                })
          ],
        ),
      ),
    );
  }
}
