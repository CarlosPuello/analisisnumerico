class SustProgresiva{
  static List resolverEcuaciones({List matriz}){
    int n = (matriz[0].length)-1;
    double s = 0;
    List soluciones = new List(n);
    soluciones[0] = matriz[0][n] / matriz[0][0];
    for(int i = 1; i < n; i++){
      s=0;
      for(int j = 0; j < i; j++){
        s = s + matriz[i][j] * soluciones[j];
      }
      soluciones[i] = (matriz[i][n]-s)/matriz[i][i];
    }
    return soluciones;
  }
}