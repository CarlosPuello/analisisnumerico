import 'dart:convert';

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

Widget showSolution({List lista,List indices}){
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
        hintText: indices.length != 0 ? "${indices[i]}" : "X${i+1}",
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

Widget showVector({List lista}){
  List<Widget> gcolumnas = new List(lista.length);
  for(int i = 0; i<lista.length;i++) {
    gcolumnas[i] = new TextField(
      textAlign: TextAlign.center,
      enabled: false,
      decoration: InputDecoration(
        hintText: "${lista[i]}",
      ),
    );
  }
  return Column(
    children: <Widget>[
      Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            children: [
              TableRow(
                children: gcolumnas
              )
            ],
            defaultColumnWidth: FlexColumnWidth(1),
            border: TableBorder.all(),
          )
      ),
    ],
  );
}

List Identidad(n){
  List filas = new List(n);
  for(int i = 0 ; i < n ; i++){
    List columna = new List(n);
    for(int j = 0 ; j < n ; j++){
      columna[j] = i==j ? 1 : 0;
    }
    filas[i] = columna;
  }
  return filas;
}

List clone(List lista){
  return json.decode(json.encode(lista));
}

List quitarB(List lista,int n){
  print("#############  $n  ##############");
  List matrices = new List();
  List matrizA = new List();
  List matrizB = new List();
  List columnaB = new List();
  for(int i = 0 ; i < n ; i++){
    List columnaA = new List(n);
    for(int j = 0 ; j <= n ; j++){
      if(i < n && j < n){
        columnaA[j] = lista[i][j];
      }else{
        columnaB.add(lista[i][j]);
      }
    }
    matrizA.add(columnaA);
  }
  matrizB.add(columnaB);
  matrices.add(matrizA);
  matrices.add(matrizB);
  return matrices;
}

List Concatenar(List lista1, List lista2){
  print("Concatenar ${lista1} ${lista2}");
  List matriz = new List(lista1.length);
  for(int i = 0 ; i < lista1.length; i++){
    List columna = new List(lista1.length + 1);
    for(int j = 0 ; j < lista1.length ; j++){
      columna[j] = lista1[i][j];
    }
    columna[columna.length-1] = lista2[0][i];
    matriz[i] = columna;
  }
  return matriz;
}