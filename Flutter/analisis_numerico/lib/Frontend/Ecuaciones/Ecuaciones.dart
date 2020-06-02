
import 'package:analisis_numerico/Frontend/Ecuaciones/ElimGaussSimpFront.dart';
import 'package:analisis_numerico/Frontend/Ecuaciones/gaussPivParcialFront.dart';
import 'package:flutter/material.dart';


class Ecuaciones extends StatefulWidget {

  Ecuaciones({Key key}) : super(key: key);
  @override
  _EcuacionesHomeState createState() => _EcuacionesHomeState();
}

class _EcuacionesHomeState extends State<Ecuaciones> {
  List matriz = new List(0);
  bool edit = false, generar = false, evaluar = false, agregar = false;
  int filas = 0, columnas = 0;
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
            createButtons("Pivoteo Parcial", gaussPivParcialFront(matriz:matriz)),
            createButtons("Pivoteo Total", gaussPivParcialFront(matriz:matriz)),
            createButtons("Cholesky", gaussPivParcialFront(matriz:matriz)),
            createButtons("Crout", gaussPivParcialFront(matriz:matriz)),
            createButtons("Dootlite", gaussPivParcialFront(matriz:matriz)),
            createButtons("Gauss Seidel", gaussPivParcialFront(matriz:matriz)),
            createButtons("Jacobi", gaussPivParcialFront(matriz:matriz)),
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
      List<TableRow> mgrafica = new List(filas);
      List matriznum = new List(filas);
      for(int j = 0; j<filas;j++){
        List mcolumnas = new List(columnas);
        List<Widget> gcolumnas = new List(columnas);
        for(int i = 0; i<columnas;i++){
          if(agregar&&edit){
            mcolumnas[i] = 0;
            try{
              mcolumnas[i] = matriz[j][i];
            }catch(e) {}
          }else{
            mcolumnas[i] = 0;
          }
          gcolumnas[i] = new TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: '0',
            ),
            onChanged: (text){
              setState(() {
                edit = true;
                matriz[j][i] = double.parse(text);
              });
            },
          );
        }
        matriznum[j] = mcolumnas;
        mgrafica[j] = new TableRow(
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
    final List<String> entries = <String>['Filas', 'Columnas'];
    return Column(
      children: <Widget>[
        (!generar) ? Text("Ingrese las dimension de la matriz", style: TextStyle(fontSize: 20)) : Container(),
        Center(
        child:GridView.count(
          childAspectRatio: 2.3,
          padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(3, (index) {
            if(index<2){
              return TextField(
                keyboardType: TextInputType.number,
                onChanged: (text){
                  setState(() {
                    if(index==0){
                      filas = int.parse(text);
                      agregar = true;
                    }else if(index == 1){
                      columnas = int.parse(text);
                      agregar = true;
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
              );
            }
          }),
        )
        )
      ],
    );
  }


}
