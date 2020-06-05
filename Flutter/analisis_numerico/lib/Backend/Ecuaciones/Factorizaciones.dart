import 'package:analisis_numerico/Commons/MatrixAndList.dart';
import 'package:analisis_numerico/Backend/Ecuaciones/cholesky.dart';
import 'package:analisis_numerico/Backend/Ecuaciones/Crout.dart';
import 'package:analisis_numerico/Backend/Ecuaciones/Doolittle.dart';
import 'package:analisis_numerico/Commons/SustProgresiva.dart';
class Factorizaciones{
  List _U = new List();
  List get U => _U;
  List _L = new List();
  List get L => _L;
  List _X = new List();
  List get X => _X;

  bool factCholesky({List matriz, int n}){
    List matrices = Cholesky.factorizar(matriz: matriz,n: n);
    print(matrices);
    _L = matrices[0];
    _U = matrices[1];
    List separar = quitarB(matriz,n);
    List b = separar[1];
    List Lb = Concatenar(L,b);
    List z = new List();
    z.add(SustProgresiva.resolverEcuaciones(matriz: Lb));
    List Uz = Concatenar(U,z);
    _X.add(SustProgresiva.resolverEcuaciones(matriz: Uz));
    return true;
  }
  bool factCrout({List matriz, int n}){
    List matrices = Crout.factorizar(matriz: matriz,n: n);
    print(matrices);
    _L = matrices[0];
    _U = matrices[1];
    List separar = quitarB(matriz,n);
    List b = separar[1];
    List Lb = Concatenar(L,b);
    List z = new List();
    z.add(SustProgresiva.resolverEcuaciones(matriz: Lb));
    List Uz = Concatenar(U,z);
    _X.add(SustProgresiva.resolverEcuaciones(matriz: Uz));
    return true;
  }
  bool factDoolittle({List matriz, int n}){
    List matrices = Doolittle.factorizar(matriz: matriz,n: n);
    print(matrices);
    _L = matrices[0];
    _U = matrices[1];
    List separar = quitarB(matriz,n);
    List b = separar[1];
    List Lb = Concatenar(L,b);
    List z = new List();
    z.add(SustProgresiva.resolverEcuaciones(matriz: Lb));
    List Uz = Concatenar(U,z);
    _X.add(SustProgresiva.resolverEcuaciones(matriz: Uz));
    return true;
  }
}