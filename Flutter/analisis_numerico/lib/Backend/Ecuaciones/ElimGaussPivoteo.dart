import 'package:analisis_numerico/Backend/Ecuaciones/gaussPivoteoParcial.dart';

class gaussPivoteoParcial{
  List _pasos = new List();
  List get pasos => _pasos;
  List _mensajePasos = new List();
  List get mensajePasos => _mensajePasos;
  String _mensaje = "";
  String get getMensaje => _mensaje;

  bool resolverSistema({List matriz, int n}){
    int cont = 1;
    print("Resolver el sistema $matriz");
    for(int k = 0; k<n-1;k++){
      matriz = pivoteoParcial.pivotear(matriz: matriz,n: n,k: k);
      _mensajePasos.add("Pivoteo parcial $cont");
      _pasos.add(matriz);
      print(matriz);
      if(pivoteoParcial.isPossible){
        for(int i = k+1; i<n ; i++){
          double m = matriz[i][k] / matriz[k][k];
          for(int j = k; j<n+1; j++){
            matriz[i][j] = matriz[i][j]  - (m*matriz[k][j]);
          }
        }
        print(matriz);
      }else{
        _mensajePasos.add(pivoteoParcial.mensaje);
        return false;
      }
      cont++;
    }
    print(pasos);
    print(_mensajePasos);
    return true;
  }
}