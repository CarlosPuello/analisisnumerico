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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Non-Linear Equations'),
      ),
      body: Center(
          child: buttonsList()
      ),
    );
  }

  Widget buttonsList(){
    final List<String> entries = <String>['Incremental', 'Bisection','Fake Rule','Fixed Point','Newton'];
    final List<Widget> pages = <Widget>[IncrementalFront(), BiseccionFront(), ReglaFalsaFront(), FixedPointFront(), NewtonFront()];
    //final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, int index){
        return GestureDetector(
            onTap: (){
              print("${entries[index]} clicked");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]),
              );
            },
            child: new Container(
              padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Text(
                entries[index],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,),
    );
  }

}
