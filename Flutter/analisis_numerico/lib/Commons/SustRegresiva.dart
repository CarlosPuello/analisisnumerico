class SustRegresiva{
  static List resolverEcuaciones({List matriz}){
    int n = (matriz[0].length)-1;
    double s = 0;
    List soluciones = new List(n);
    soluciones[n-1] = matriz[n-1][n] / matriz[n-1][n-1];
    print(matriz);
    for(int i = n-2; i >= 0; i--){
      s=0;
      for(int j = i+1; j<n; j++){
        s = s + matriz[i][j] * soluciones[j];
      }
      soluciones[i] = (matriz[i][n]-s)/matriz[i][i];
    }
    print(soluciones);
    return soluciones;
  }
}