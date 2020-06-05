import 'dart:convert';

import 'package:analisis_numerico/Commons/MatrixAndList.dart';
import 'package:analisis_numerico/Backend/Ecuaciones/Factorizaciones.dart';
import 'package:flutter/material.dart';

class FactorizacionesFront extends StatefulWidget {
  FactorizacionesFront({
    Key key,
    this.matriz, this.opcion, this.titulo
  }) : super(key: key);
  final List matriz;
  final int opcion;
  final String titulo;
  @override
  _FactorizacionesFrontState createState() => _FactorizacionesFrontState();
}

class _FactorizacionesFrontState extends State<FactorizacionesFront> {
  List matriz;
  @override
  void initState() {
    matriz = json.decode(json.encode(widget.matriz));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
        ),
        body:  Container(
          child: ListView(
            shrinkWrap: true,
            key: Key("Mayor"),
            children: <Widget>[
              Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
              Text("Matriz Original: ", textAlign: TextAlign.center,),
              Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
              showMatrix(matriz: matriz),
              elegirFact()
            ],
          ),
        )

    );
  }

  Widget elegirFact(){
    if(widget.opcion==0){
      return factCholesky();
    }else if(widget.opcion == 1){
      return factCrout();
    }else if(widget.opcion == 2){
      return factDoolittle();
    }
    return Container();

  }
  Widget factDoolittle(){
    Factorizaciones factorizador = new Factorizaciones();
    bool response = factorizador.factDoolittle(matriz: matriz, n: (matriz[0].length)-1);
    if(response){
      return Column(
        children: <Widget>[
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz L: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.L),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz U: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.U),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz X: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.X),
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text("Ocurrió un error desconocido", style: TextStyle(fontSize: 15),),
        ],
      );
    }
  }
  Widget factCholesky(){
    Factorizaciones factorizador = new Factorizaciones();
    bool response = factorizador.factCholesky(matriz: matriz, n: (matriz[0].length)-1);
    if(response){
      return Column(
        children: <Widget>[
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz L: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.L),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz U: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.U),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz X: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.X),
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text("Ocurrió un error desconocido", style: TextStyle(fontSize: 15),),
        ],
      );
    }
  }
  Widget factCrout(){
    Factorizaciones factorizador = new Factorizaciones();
    bool response = factorizador.factCrout(matriz: matriz, n: (matriz[0].length)-1);
    if(response){
      return Column(
        children: <Widget>[
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz L: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.L),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz U: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.U),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Text("Matriz X: ", style: TextStyle(fontSize: 15),),
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          showMatrix(matriz: factorizador.X),
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text("Ocurrió un error desconocido", style: TextStyle(fontSize: 15),),
        ],
      );
    }
  }

}
