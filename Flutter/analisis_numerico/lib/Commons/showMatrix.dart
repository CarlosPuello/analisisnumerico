import 'package:flutter/material.dart';

Widget showMatrix({List matriz}){
  List<TableRow> mgrafica = new List(matriz.length);
  for(int i = 0; i<matriz.length;i++) {
    List<Widget> gcolumnas = new List(matriz[i].length);
    for (int j = 0; j < matriz[i].length; j++) {
      gcolumnas[j] = new TextField(
        textAlign: TextAlign.center,
        enabled: false,
        decoration: InputDecoration(
          hintText: "${matriz[i][j]}",
        ),
      );
    }
    mgrafica[i] = new TableRow(
      children: gcolumnas
    );
  }
  return Column(
    children: <Widget>[
      Padding(padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),),
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            children: mgrafica,
            defaultColumnWidth: FlexColumnWidth(1),
            border: TableBorder.all(),
          )
      ),
    ],
  );
}

Widget showVector({List lista}){
  List<TableRow> mgrafica = new List(2);
  List<Widget> gcolumnas = new List(lista.length);
  List<Widget> variables = new List(lista.length);
  for(int i = 0; i<lista.length;i++) {
    gcolumnas[i] = new TextField(
      textAlign: TextAlign.center,
      enabled: false,
      decoration: InputDecoration(
        hintText: "${lista[i]}",
      ),
    );
    variables[i] = new TextField(
      textAlign: TextAlign.center,
      enabled: false,
      decoration: InputDecoration(
        hintText: "X${i+1}",
      ),
    );
  }
  mgrafica[0] = new TableRow(
      children: variables
  );
  mgrafica[1] = new TableRow(
      children: gcolumnas
  );
  return Column(
    children: <Widget>[
      Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
      Text("La solucion del sistema de ecuaciones es: "),
      Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            children: mgrafica,
            defaultColumnWidth: FlexColumnWidth(1),
            border: TableBorder.all(),
          )
      ),
    ],
  );
}