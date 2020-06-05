import 'dart:convert';

import 'package:analisis_numerico/Backend/Ecuaciones/gaussPivoteoParcial.dart';
import 'package:analisis_numerico/Backend/Ecuaciones/gaussPivoteoTotal.dart';

class gaussPivoteo{
  List _pasos = new List();
  List get pasos => _pasos;
  List _mensajePasos = new List();
  List get mensajePasos => _mensajePasos;
  String _mensaje = "";
  String get getMensaje => _mensaje;
  List _variables = new List();
  List get variables => _variables;

  bool pivoteoParcial({List matriz, int n}){
    int cont = 1;
    print("Resolver el sistema $matriz");
    for(int k = 0; k<n-1;k++){
      matriz = gaussPivoteoParcial.pivotear(matriz: matriz,n: n,k: k);
      _mensajePasos.add("Pivoteo parcial $cont");
      _pasos.add(json.decode(json.encode(matriz)));
      if(gaussPivoteoParcial.isPossible){
        for(int i = k+1; i<n ; i++){
          double m = matriz[i][k] / matriz[k][k];
          for(int j = k; j<n+1; j++){
            matriz[i][j] = matriz[i][j]  - (m*matriz[k][j]);
          }
        }
        _mensajePasos.add("Nuevo cálculo de la matriz: ");
        _pasos.add(json.decode(json.encode(matriz)));
      }else{
        _mensajePasos.add(gaussPivoteoParcial.mensaje);
        return false;
      }
      cont++;
    }
    return true;
  }
  bool pivoteoTotal({List matriz, int n}){
    List indices = new List();
    for(int i = 0; i < n ; i++){
      indices.add("X${i+1}");
    }
    indices.add("S");
    int cont = 1;
    print("Resolver el sistema $matriz");
    for(int k = 0; k<n-1;k++){
      List response = gaussPivoteoTotal.pivotear(matriz: matriz,n: n,k: k, indices: indices);
      matriz = response[0];
      indices = response[1];
      print("###$indices");
      if(gaussPivoteoTotal.isPossible){
        _mensajePasos.add("Pivoteo parcial $cont");
        _pasos.add(json.decode(json.encode(matriz)));
        _variables.add(json.decode(json.encode(indices)));
        for(int i = k+1; i<n ; i++){
          double m = matriz[i][k] / matriz[k][k];
          for(int j = k; j<n+1; j++){
            matriz[i][j] = matriz[i][j]  - (m*matriz[k][j]);
          }
        }
        _mensajePasos.add("Nuevo cálculo de la matriz: ");
        _pasos.add(json.decode(json.encode(matriz)));
        _variables.add(json.decode(json.encode(indices)));
      }else{
        _mensajePasos.add(gaussPivoteoTotal.mensaje);
        return false;
      }
      cont++;
    }
    return true;
  }
}