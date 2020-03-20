import 'dart:collection';

import 'package:analisis_numerico/Commons/funciones.dart';

class IncrementalAlgorithm{

  Map tabla = new Map();
  Map get getTabla => tabla;

  String evaluateAlgorithm({double x0, int iteraciones, double delta}){
    double y0 = f(x0);
    if(y0 == 0){
      return "$x0 es una raiz";
    }else if(delta == 0){
      return "Delta inapropiado";
    }else if(iteraciones <= 0){
      return "Valor de iteraciones inapropiado";
    }else{
      double x1, y1;
      int contador = 1;
      x1 = x0 + delta;
      y1 = f(x1);
      tabla[contador]=[x0,y0];
      while(y0*y1 > 0 && contador < iteraciones){
        x0 = x1;
        y0 = y1;
        x1 = x0 + delta;
        y1 = f(x1);
        contador++;
        tabla[contador]=[x0,y0];
      }
      if(y0*y1 < 0){
        tabla[contador]=[x0,y0];
        tabla[contador+1]=[x1,y1];
        return "[$x0,$x1] definen un intervalo";
      }else if(y1 == 0){
        return "$x1 es una raiz";
      }else{
        return "Fracaso en $iteraciones iteraciones";
      }
    }
  }
}
