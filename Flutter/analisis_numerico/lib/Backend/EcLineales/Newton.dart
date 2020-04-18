
import 'package:analisis_numerico/Commons/funciones.dart';

class NewtonAlgorithm{

  Map tabla = new Map();
  Map get getTabla => tabla;

  String evaluateAlgorithm({double x0, int iteraciones, double tolerancia}){
    double y0 = f(x0);
    tabla[0]=[x0,y0,0];
    if(y0 == 0){
      return "$x0 es una raiz";
    }else if(tolerancia < 0){
      return "Tolerancia inapropiada";
    }else if(iteraciones <= 0){
      return "Valor de iteraciones inapropiado";
    }else{
      double d=dif(x0), x1 = 0;
      int contador = 1;
      double E = tolerancia + 1;
      while(E > tolerancia && y0 != 0 && contador < iteraciones){
        x1 = x0 - (y0/d);
        y0 = f(x1);
        d = dif(x1);
        E = ((x1-x0).abs())/x1;
        x0 = x1;
        contador++;
        tabla[contador]=[x0,y0,E];
      }
      if(E < tolerancia){
        return "$x0 es raíz.";
      }else if(y0 == 0){
        return "$x0 es una raiz";
      }else{
          if(d==0){
            return "Problema con la derivada";
          }else{
            return "Fracaso en $contador iteraciones";
          }

      }
    }
  }
}
