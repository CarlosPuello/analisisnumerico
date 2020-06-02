import 'package:analisis_numerico/Backend/Ecuaciones/ElimGaussPivoteo.dart';
import 'package:analisis_numerico/Backend/Ecuaciones/ElimGaussSimp.dart';
import 'package:analisis_numerico/Commons/SustRegresiva.dart';
import 'package:analisis_numerico/Commons/showMatrix.dart';
import 'package:flutter/material.dart';


class gaussPivParcialFront extends StatefulWidget {
  gaussPivParcialFront({
    Key key,
    this.matriz
  }) : super(key: key);
  final List matriz;
  @override
  _gaussPivParcialFrontState createState() => _gaussPivParcialFrontState();
}

class _gaussPivParcialFrontState extends State<gaussPivParcialFront> {
  List get getMatrix => widget.matriz;
  List newMatrix = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partial Pivoting'),
      ),
      body:  Container(
            child: ListView(
              shrinkWrap: true,
              key: Key("Mayor"),
              children: <Widget>[
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                Text("Matriz Original: ", textAlign: TextAlign.center,),
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                showMatrix(matriz: getMatrix),
                evaluateMatrix()
              ],
            ),
          )

    );
  }

  Widget evaluateMatrix(){
    gaussPivoteoParcial evaluator = new gaussPivoteoParcial();
    bool response = evaluator.resolverSistema(matriz: getMatrix,n: (getMatrix[0].length)-1);
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
          showVector(lista: solucion)
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
