import 'dart:convert';

import 'package:analisis_numerico/Backend/Ecuaciones/ElimGaussPivoteo.dart';
import 'package:analisis_numerico/Commons/SustRegresiva.dart';
import 'package:analisis_numerico/Commons/MatrixAndList.dart';
import 'package:flutter/material.dart';


class gaussPivoteoFront extends StatefulWidget {
  gaussPivoteoFront({
    Key key,
    this.matriz, this.opcion, this.titulo
  }) : super(key: key);
  final List matriz;
  final bool opcion;
  final String titulo;
  @override
  _gaussPivoteoFrontState createState() => _gaussPivoteoFrontState();
}

class _gaussPivoteoFrontState extends State<gaussPivoteoFront> {
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
                widget.opcion ? pivoteoParcial() : pivoteoTotal()
              ],
            ),
          )

    );
  }

  Widget pivoteoParcial(){
    gaussPivoteo evaluator = new gaussPivoteo();
    bool response = evaluator.pivoteoParcial(matriz: matriz,n: (matriz[0].length)-1);
    if(response){
      List solucion = SustRegresiva.resolverEcuaciones(matriz: evaluator.pasos[evaluator.pasos.length-1]);
      return Column(
        children: <Widget>[
          Text(evaluator.getMensaje, style: TextStyle(fontSize: 15),),
          Container(child:
            ListView.builder(
              shrinkWrap: true,
              key: Key("Segundo"),
              physics: ClampingScrollPhysics(),
              itemCount: evaluator.pasos.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: <Widget>[
                    Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                    Text(evaluator.mensajePasos[index]),
                    Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                    showMatrix(matriz: evaluator.pasos[index])
                  ],
                );
              },
            ),
          ),
          showSolution(lista: solucion, indices: new List(0))
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text(evaluator.getMensaje, style: TextStyle(fontSize: 15),),
          showMatrix(matriz: evaluator.pasos[0]),
        ],
      );
    }
  }
  Widget pivoteoTotal(){
    gaussPivoteo evaluator = new gaussPivoteo();
    bool response = evaluator.pivoteoTotal(matriz: matriz,n: (matriz[0].length)-1);
    if(response){
      List solucion = SustRegresiva.resolverEcuaciones(matriz: evaluator.pasos[evaluator.pasos.length-1]);
      return Column(
        children: <Widget>[
          Text(evaluator.getMensaje, style: TextStyle(fontSize: 15),),
          Container(child:
          ListView.builder(
            shrinkWrap: true,
            key: Key("Segundo"),
            physics: ClampingScrollPhysics(),
            itemCount: evaluator.pasos.length,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: <Widget>[
                  Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                  Text(evaluator.mensajePasos[index]),
                  Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                  showMatrix(matriz: evaluator.pasos[index]),
                  showVector(lista: evaluator.variables[index]),
                ],
              );
            },
          ),
          ),
          showSolution(lista: solucion,indices: evaluator.variables[evaluator.variables.length-1])
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text(evaluator.getMensaje, style: TextStyle(fontSize: 15),),
          showMatrix(matriz: evaluator.pasos[0]),
        ],
      );
    }
  }


}
