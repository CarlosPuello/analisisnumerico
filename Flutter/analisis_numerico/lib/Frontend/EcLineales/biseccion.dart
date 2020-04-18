import 'dart:math';

import 'package:analisis_numerico/Backend/EcLineales/biseccion.dart';
import 'package:analisis_numerico/Backend/EcLineales/incremental.dart';
import 'package:analisis_numerico/Commons/funciones.dart';
import 'package:flutter/material.dart';


class BiseccionFront extends StatefulWidget {

  BiseccionFront({Key key}) : super(key: key);
  @override
  _BiseccionFrontState createState() => _BiseccionFrontState();
}

class _BiseccionFrontState extends State<BiseccionFront> {

  //Punto Inicial, Delta, Iteraciones
  double xo = 0, x1 = 0, tolerancia = 0;
  int iteraciones = 0;
  bool evaluate = false;
  String response = "";
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bisection Method'),
      ),
      body: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                functionLatex(),
                inputFields(),
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                Tabla()
              ],
            ),
          )
      ),
    );
  }

  Widget Tabla(){
    if(evaluate){
      evaluate = false;
      BisectionAlgorithm evaluator = new BisectionAlgorithm();
      String mensaje = evaluator.evaluateAlgorithm(x0: xo, x1: x1, iteraciones: iteraciones, tolerancia: tolerancia);
      print(mensaje);
      setState(() {
        response = mensaje;
      });
      //showAlert(title:"Incremental Algorithm", msg:"The operation ended with: \n $mensaje", context: context);
      Map tabla = evaluator.getTabla;
      if(tabla != null){
        return Column(
          children: <Widget>[
            Padding(padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),),
            Text(mensaje, style: TextStyle(fontSize: 15),),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (
                    DataTable(
                        columnSpacing: 10,
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text("#"),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text("X0"),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text("X1"),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text("Xm"),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text("f(m)"),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text("Error"),
                            numeric: true,
                          ),
                        ],
                        rows: tabla.keys.map((it) => DataRow(
                            cells: [
                              DataCell(
                                  Text("$it")
                              ),
                              DataCell(
                                  Text("${tabla[it][0]}")
                              ),
                              DataCell(
                                  Text("${tabla[it][1]}")
                              ),
                              DataCell(
                                  Text("${tabla[it][2]}")
                              ),
                              DataCell(
                                  Text("${tabla[it][3]}")
                              ),
                              DataCell(
                                  Text("${tabla[it][4]}")
                              ),

                            ]
                        )).toList()
                    )
                  ),
                ),
              ),
          ],
        );
      }
    }else{
      evaluate = false;
      return Container();
    }
    evaluate = false;
  }

  Widget inputFields(){
    final List<String> entries = <String>['Xo', 'X1', "Cifras",'Iteraciones'];
    return Center(
        child:GridView.count(
          childAspectRatio: 2.3,
          padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 5,
          children: List.generate(5, (index) {
            if(index<4){
              return TextField(
                onChanged: (text){
                  setState(() {
                    if(index==0){
                      xo = double.parse(text);
                    }else if(index == 1){
                      x1 = double.parse(text);
                    }else if(index == 2){
                      tolerancia = 1*(pow(10, -int.parse(text)));
                      print(tolerancia);
                    }else if(index == 3){
                      iteraciones = int.parse(text);
                    }
                  });
                },
                decoration: InputDecoration(
                    hintText: entries[index]
                ),
              );
            }else{
              return GestureDetector(
                  onTap: (){
                    setState(() {
                      evaluate = true;
                    });
                  },
                  child:Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0),
                        ),
                      ),
                      child:
                      Center(
                          child:Container(
                            child: Text(
                              "Evaluar",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                      )
                  )
              );
            }
          }),
        )
    );
  }

}
