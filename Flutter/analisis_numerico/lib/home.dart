import 'package:analisis_numerico/Frontend/Diferenciales.dart';
import 'file:///C:/Users/andre/Documents/Proyectos/analisisnumerico/Flutter/analisis_numerico/lib/Frontend/Ecuaciones/Ecuaciones.dart';
import 'package:analisis_numerico/Frontend/Interpolacion.dart';
import 'package:analisis_numerico/Frontend/EcLineales/ecuacionesLineales.dart';
import 'package:analisis_numerico/Frontend/EcLineales/incremental.dart';
import 'package:flutter/material.dart';


class AnalisisHome extends StatefulWidget {

  AnalisisHome({Key key}) : super(key: key);
  @override
  _AnalisisHomeState createState() => _AnalisisHomeState();
}

class _AnalisisHomeState extends State<AnalisisHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Análisis Numérico'),
      ),
      body: Center(
        child: sectionList()
      ),
    );
  }

  Widget sectionList(){
    final List<String> entries = <String>['Non-Linear Equations', 'Equations','Interpolation','Differentiation & Integration'];
    final List<Widget> pages = <Widget>[EcuacionesLineales(), Ecuaciones(), Interpolacion(), Diferenciales()];
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
