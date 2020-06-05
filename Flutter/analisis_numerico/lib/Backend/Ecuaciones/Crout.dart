import 'package:analisis_numerico/Commons/MatrixAndList.dart';
import 'dart:math';
class Crout{
  static String _mensaje = "";
  static String get mensaje => _mensaje;
  static bool _posible = true;
  static bool get isPossible => _posible;

  static List factorizar({List matriz, int n}) {
    print("#############  $n  ##############");
    print(matriz);
    List separar = quitarB(matriz,n);
    List A = separar[0];
    print(A);
    print(separar[1]);
    List U = Identidad(n);
    List L = Identidad(n);
    for(int k = 0 ; k < n ; k++){
      double suma = 0;
      for(int i = k ; i < n; i++){
        suma = 0;
        for(int s = 0 ; s < k-2; k++){
          suma = suma + (L[i][s] * U[s][k]);
        }
        L[i][k] = A[i][k] - suma;
      }
      for(int i = k+1 ; i < n; i++){
        suma = 0;
        for(int s = 0 ; s < k - 2; k++){
          suma = suma + (L[k][s] * U[s][i]);
        }
        L[k][i] = (A[k][i] - suma) /L[k][k];
      }
    }
    List retorno = new List();
    retorno.add(L);
    retorno.add(U);
    return retorno;
  }
}
