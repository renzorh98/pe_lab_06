import 'package:flutter/material.dart';
import 'package:pe_lab_06/pages/list_page.dart';
import 'package:pe_lab_06/pages/save_page.dart';
import 'package:pe_lab_06/pages/visita_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ListPage.ROUTE,
      routes: {
        ListPage.ROUTE: (_) => ListPage(),
        SavePage.ROUTE: (_) => SavePage(),
        VisitaPage.ROUTE: (_) => VisitaPage(),

      },
    );

  }

}