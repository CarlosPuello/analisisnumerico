import 'package:analisis_numerico/Backend/Ecuaciones/ElimGaussSimp.dart';
import 'package:analisis_numerico/Commons/SustRegresiva.dart';
import 'package:analisis_numerico/Commons/showMatrix.dart';
import 'package:flutter/material.dart';


class ElimGaussSimpFront extends StatefulWidget {
  ElimGaussSimpFront({
    Key key,
    this.matriz
  }) : super(key: key);
  final List matriz;
  @override
  _ElimGaussSimpFrontState createState() => _ElimGaussSimpFrontState();
}

class _ElimGaussSimpFrontState extends State<ElimGaussSimpFront> {
  List get getMatrix => widget.matriz;
  List newMatrix = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Gauss Elimination'),
      ),
      body: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                showMatrix(matriz: getMatrix),
                evaluateMatrix()
              ],
            ),
          )
      ),
    );
  }

  Widget evaluateMatrix(){
    ElimGaussSimple evaluator = new ElimGaussSimple();
    bool response = evaluator.evaluateAlgorithm(matriz: getMatrix,n: (getMatrix[0].length)-1);
    if(response){
      List solucion = SustRegresiva.resolverEcuaciones(matriz: evaluator.getResultado);
      return Column(
        children: <Widget>[
          Text(evaluator.getMensaje, style: TextStyle(fontSize: 15),),
          showMatrix(matriz: evaluator.getResultado),
          showVector(lista: solucion)
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text(evaluator.getMensaje, style: TextStyle(fontSize: 15),),
          showMatrix(matriz: evaluator.getResultado),
        ],
      );
    }


  }


}
