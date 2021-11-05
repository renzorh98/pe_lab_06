import 'package:flutter/material.dart';
import 'package:pe_lab_06/db/operation.dart';
import 'package:pe_lab_06/models/usuario.dart';
import 'package:pe_lab_06/pages/save_page.dart';
import 'package:pe_lab_06/pages/visita_page.dart';

class ListPage extends StatelessWidget {

  static const String ROUTE = "/";

  @override
  Widget build(BuildContext context){


    return Scaffold(

      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        Navigator.pushNamed(context, SavePage.ROUTE);
      },),

      appBar: AppBar(title: Text("Listado"),),
      body: Container(child: _MyList(),),
    );
  }
}

class _MyList extends StatefulWidget {
  @override
  State<_MyList> createState() => _MyListState();
}

class _MyListState extends State<_MyList> {
  List<Usuario> usuarios = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    

    return ListView.builder(itemCount: usuarios.length, itemBuilder: (_,i) => _createItem(i));
  }

  _loadData() async{
    List<Usuario>aux = await Operation.usuarios();

    setState(() {
      usuarios = aux;
    });
  }

  _createItem(int i) {
    return ListTile(
      title: Text(usuarios[i].nombreCompleto),
      trailing: MaterialButton(child: Icon(Icons.add_alarm),onPressed: (){
        Navigator.pushNamed(context, VisitaPage.ROUTE);
      },),
    );
  }
}


// class _MyList extends StatefulWidget {
//   @override
//   _MyListState createState() => _MyListState();
// }

// class _MyListState extends State<_MyList> {
//   List<Usuario> usuarios = [];

//   @override
//   void initState() {
//     _loadData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemCount: usuarios.length, itemBuilder: (_,i) => _createItem(i),);
//   }

//   _loadData() async{
//     List<Usuario> aux = await Operation.usuarios();

      // setState(() {
//       usuarios = aux;
//     });
//   }
//   _createItem(int i) {
//     return ListTile(
//       title: Text(usuarios[i].nombreCompleto),
//     );
//   }
// }

