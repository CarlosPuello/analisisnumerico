
import 'dart:convert';

import 'package:analisis_numerico/Frontend/Ecuaciones/ElimGaussSimpFront.dart';
import 'package:analisis_numerico/Frontend/Ecuaciones/ElimGaussPivoteoFront.dart';
import 'package:flutter/material.dart';


class Ecuaciones extends StatefulWidget {

  Ecuaciones({Key key}) : super(key: key);
  @override
  _EcuacionesHomeState createState() => _EcuacionesHomeState();
}

class _EcuacionesHomeState extends State<Ecuaciones> {
  List matriz = new List(0);
  bool edit = false, generar = false, evaluar = false, agregar = false;
  int variables = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equations'),
      ),
      body: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                inputFields(),
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),),
                crearMatriz(),
                Padding(padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),),
                menu()
              ],
            ),
          )
      ),
    );
  }

  Widget menu(){
    if(generar){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Seleccione el metodo para solucionar el sistema", style: TextStyle(fontSize: 15),),
            Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
            createButtons("Eliminacion Guassiana Simple", ElimGaussSimpFront(matriz: matriz)),
            createButtons("Pivoteo Parcial", gaussPivoteoFront(matriz:matriz,opcion: true, titulo: "Partial Pivoting",)),
            createButtons("Pivoteo Total", gaussPivoteoFront(matriz:matriz,opcion: false, titulo: "Total Pivoting",)),
            createButtons("Cholesky", Container()),
            createButtons("Crout", Container()),
            createButtons("Dootlite", Container()),
            createButtons("Gauss Seidel", Container()),
            createButtons("Jacobi", Container()),
          ],
        ),
      );
    }else{
      return Container();
    }
  }

  Widget createButtons(String nombre, Widget Pagina){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 5
        )
      ),
      child: GestureDetector(
          onTap: (){
            evaluar = true;
            print("$nombre clicked");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pagina),
            );},
          child: new Container(
            padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
            child: Text(
              nombre,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
      ),
    );
  }

  Widget crearMatriz(){
    if(generar){
      List<TableRow> mgrafica = new List(variables);
      List matriznum = new List(variables);
      for(int i = 0; i<variables;i++){
        List mcolumnas = new List(variables+1);
        List<Widget> gcolumnas = new List(variables+1);
        for(int j = 0; j<variables+1;j++){
          if(agregar&&edit){
            mcolumnas[j] = 0;
            try{
              mcolumnas[j] = matriz[i][j];
            }catch(e) {}
          }else{
            mcolumnas[j] = 0;
          }
          gcolumnas[j] = new TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: '0',
            ),
            onChanged: (text){
              setState(() {
                edit = true;
                matriz[i][j] = double.parse(text);
              });
            },
          );
        }
        matriznum[i] = mcolumnas;
        mgrafica[i] = new TableRow(
            children: gcolumnas
        );
      }
      if(!edit || agregar){
        setState(() {
          matriz = matriznum;
        });
        agregar = false;
      }
      print(matriz);
      return Column(
        children: <Widget>[
          Padding(padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),),
          Text("Ingrese el sistema de ecuaciones aumentado A|b", style: TextStyle(fontSize: 15),),
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
    }else{
      return Container();
    }

  }
  Widget inputFields(){
    return Column(
      children: <Widget>[
        (!generar) ? Text("Ingrese las dimension de la matriz", style: TextStyle(fontSize: 20)) : Container(),
        Center(
        child:GridView.count(
          childAspectRatio: 5,
          padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text){
                setState(() {
                  variables = int.parse(text);
                  agregar = true;
                });
              },
              decoration: InputDecoration(
                hintText: 'Numero de Variables'
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                generar = true;
              });},
              child:Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0),
                  ),
                ),
                child:Center(
                  child:Container(
                    child: Text(
                      "Generar",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                )
              )
            ),
          ]
          ),
        )]
    );

  }


}
