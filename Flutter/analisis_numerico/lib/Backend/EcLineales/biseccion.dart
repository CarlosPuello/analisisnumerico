
import 'package:analisis_numerico/Commons/funciones.dart';

class BisectionAlgorithm{

  Map tabla = new Map();
  Map get getTabla => tabla;

  String evaluateAlgorithm({double x0, double x1,int iteraciones, double tolerancia}){
    double y0 = funciones.f(x0);
    double y1 = funciones.f(x1);
    if(y0 == 0){
      return "$x0 es una raiz";
    }else if(y1 == 0){
      return "$x1 es una raiz";
    }else if(y0*y1 > 0){
      return "Intervalo inapropiado";
    }else if(iteraciones <= 0){
      return "Valor de iteraciones inapropiado";
    }else{
      double xm = (x0+x1)/2;
      double ym = funciones.f(xm);
      int contador = 1;
      double E = tolerancia + 1;
      tabla[contador]=[x0,x1,xm,ym,E];
      while(E > tolerancia && ym != 0 && contador < iteraciones){
        if(y0*ym<0){
          x1 = xm;
          y1 = ym;
        }else{
          x0 = xm;
          y0 = xm;
        }
        double xmAnt = xm;
        xm = (x0+x1)/2;
        ym = funciones.f(xm);
        contador++;
        E = (xmAnt - xm).abs();
        tabla[contador]=[x0,x1,xm,ym,E];
      }
      if(E < tolerancia){
        return "$xm es raíz";
      }else if(ym == 0){
        return "$xm es una raiz";
      }else{
        return "Fracaso en $iteraciones iteraciones";
      }
    }
  }
}
