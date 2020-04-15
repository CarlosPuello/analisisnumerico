import 'package:analisis_numerico/Backend/incremental.dart';
import 'package:analisis_numerico/Commons/funciones.dart';
import 'package:flutter/material.dart';


class IncrementalFront extends StatefulWidget {

  IncrementalFront({Key key}) : super(key: key);
  @override
  _IncrementalFrontState createState() => _IncrementalFrontState();
}

class _IncrementalFrontState extends State<IncrementalFront> {

  //Punto Inicial, Delta, Iteraciones
  double xo = 0, delta = 0;
  int iteraciones = 0;
  bool evaluate = false;
  String response = "";
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incremental Method'),
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
      IncrementalAlgorithm evaluator = new IncrementalAlgorithm();
      String mensaje = evaluator.evaluateAlgorithm(x0: xo, delta: delta, iteraciones: iteraciones);
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
              DataTable(
              horizontalMargin: 0,
              columns: <DataColumn>[
                DataColumn(
                  label: Text("#"),
                  numeric: true,
                ),
                DataColumn(
                  label: Text("x"),
                  numeric: true,

                ),
                DataColumn(
                  label: Text("f(x)"),
                  numeric: true,
                )
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
                    )
                  ]
              )).toList()
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
    final List<String> entries = <String>['Xo', 'Delta', 'Iteraciones'];
    return Center(
        child:GridView.count(
          childAspectRatio: 2.3,
          padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(4, (index) {
            if(index<3){
              return TextField(
                onChanged: (text){
                  setState(() {
                    if(index==0){
                      xo = double.parse(text);
                    }else if(index == 1){
                      delta = double.parse(text);
                    }else if(index == 2){
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
