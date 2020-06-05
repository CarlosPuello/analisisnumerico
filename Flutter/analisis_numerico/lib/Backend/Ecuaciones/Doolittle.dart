import 'package:analisis_numerico/Commons/MatrixAndList.dart';
import 'dart:math';
class Doolittle{
  static String _mensaje = "";
  static String get mensaje => _mensaje;
  static bool _posible = true;
  static bool get isPossible => _posible;

  static List factorizar({List matriz, int n}) {
    List separar = quitarB(matriz,n);
    List A = separar[0];
    List U = Identidad(n);
    List L = Identidad(n);
    for(int k = 0 ; k < n ; k++){
      double suma = 0;
      for(int j = k ; j < n; j++){
        suma = 0;
        for(int s = 0 ; s < k - 2; k++){
          suma = suma + (L[k][s] * U[s][j]);
        }
        U[k][j] = (A[k][j] - suma);
      }
      for(int j = k+1 ; j < n; j++){
        suma = 0;
        for(int s = 0 ; s < k - 2; k++){
          suma = suma + (L[j][s] * U[s][k]);
        }
        L[j][k] = (A[j][k] - suma) /L[k][k];
      }
    }
    List retorno = new List();
    retorno.add(L);
    retorno.add(U);
    return retorno;
  }
}
