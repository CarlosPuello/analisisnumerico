import 'package:analisis_numerico/Commons/funciones.dart';
import 'package:analisis_numerico/Frontend/EcLineales/FixedPoint.dart';
import 'package:analisis_numerico/Frontend/EcLineales/Newton.dart';
import 'package:analisis_numerico/Frontend/EcLineales/ReglaFalsa.dart';
import 'package:analisis_numerico/Frontend/EcLineales/biseccion.dart';
import 'package:analisis_numerico/Frontend/EcLineales/incremental.dart';
import 'package:flutter/material.dart';


class EcuacionesLineales extends StatefulWidget {

  EcuacionesLineales({Key key}) : super(key: key);
  @override
  _EcuacionesLinealesHomeState createState() => _EcuacionesLinealesHomeState();
}

class _EcuacionesLinealesHomeState extends State<EcuacionesLineales> {

  bool isFx = false, isGx = false, isFfx = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Non-Linear Equations'),
      ),
      body: Center(
          child: ListView(
            children: <Widget>[
              Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
              inputFields(),
              Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
              buttonsList()
            ],
          )
      ),
    );
  }

  Widget buttonsList(){
    return Column(
      children: <Widget>[
        isFx ? createButtons("Incremental", IncrementalFront()) : Container(),
        isFx ? createButtons("Bisection", BiseccionFront()) : Container(),
        isFx ? createButtons("False Rule", ReglaFalsaFront()) : Container(),
        isFx && isGx ? createButtons("Fixed Point", FixedPointFront()) : Container(),
        isFx && isGx && isFfx ? createButtons("Newton", NewtonFront()) : Container(),
      ],
    );
  }
  Widget createButtons(String nombre, Widget Pagina){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
            bottom: BorderSide(color: Colors.black, width: 1.0),
          ),

      ),
      child: GestureDetector(
          onTap: (){
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



  Widget inputFields(){
    final List<String> entries = <String>['Filas', 'Columnas'];
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (text){
            setState(() {
              funciones.funcionf = text;
            });
          },
          onEditingComplete: (){
            setState(() {
              if(funciones.funcionf != ""){
                isFx = true;
              }else{
                isFx = false;
              }
            });
          },
          decoration: InputDecoration(
              hintText: "Ingrese f(x)"
          ),
        ),
        TextField(
          onChanged: (text){
            setState(() {
              funciones.derivada = text;
            });
          },
          onEditingComplete: (){
            setState(() {
              if(funciones.derivada != ""){
                isFfx = true;
              }else{
                isFfx = false;
              }
            });
          },
          decoration: InputDecoration(
              hintText: "Ingrese f'(x)"
          ),
        ),
        TextField(
          onChanged: (text){
            setState(() {
              funciones.funciong = text;
            });
          },
          onEditingComplete: (){
            setState(() {
              if(funciones.funciong != ""){
                isGx = true;
              }else{
                isGx = false;
              }
            });
          },
          decoration: InputDecoration(
              hintText: "Ingrese g(x)"
          ),
        ),
      ],
    );
  }
}
