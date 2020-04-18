import 'package:analisis_numerico/Commons/funciones.dart';

class ReglaFalsaAlgoritmo{

  Map tabla = new Map();
  Map get getTabla => tabla;

  String evaluateAlgorithm({double x0, double x1,int iteraciones, double tolerancia}){
    double y0 = f(x0);
    double y1 = f(x1);
    if(y0 == 0){
      return "$x0 es una raiz";
    }else if(y1 == 0){
      return "$x1 es una raiz";
    }else if(y0*y1 > 0){
      return "Intervalo inapropiado";
    }else if(iteraciones <= 0){
      return "Valor de iteraciones inapropiado";
    }else{
      double xm = x0-((y0*(x0-x1))/(y0-y1));
      double ym = f(xm);
      int contador = 1;
      double E = tolerancia + 1;
      tabla[contador]=[x0,x1,xm,ym,0];
      while(ym != 0 && E > tolerancia && contador < iteraciones){
        if(y0*ym<0){
          x1 = xm;
          y1 = ym;
        }else{
          x0 = xm;
          y0 = ym;
        }
        double xmAnt = xm;
        xm = x0-((y0*(x0-x1))/(y0-y1));
        ym = f(xm);
        E = (xmAnt - xm).abs();
        contador++;
        tabla[contador]=[x0,x1,xm,ym,E];
      }
      if(E < tolerancia){
        return "$xm es raíz";
      }else if(ym == 0){
        return "$xm es una raiz";
      }else{
        return "Fracaso en $contador iteraciones";
      }
    }
  }
}
