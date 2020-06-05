class gaussPivoteoTotal{
  static String _mensaje = "";
  static String get mensaje => _mensaje;
  static bool _posible = true;
  static bool get isPossible => _posible;

  static List pivotear({List matriz, int n, int k, List indices}) {
    List listas = new List(2);
    double pivote = 0;
    int filaPivote = k, columnaPivote = k;
    for (int i = k ; i < n; i++) {
      for(int j = k ; j < n; j++){
        double aux = matriz[i][j].abs();
        if (pivote < aux) {
          pivote = aux;
          filaPivote = i;
          columnaPivote = j;
        }
      }
    }
    if (pivote == 0) {
      _mensaje = "No tiene solución única";
      _posible = false;
    } else {
      if (filaPivote != k) {
        List aux = matriz[k];
        matriz[k] = matriz[filaPivote];
        matriz[filaPivote] = aux;
      }
      if(columnaPivote != k){
        for(int i = 0; i < n; i++){
          double aux = matriz[i][k];
          matriz[i][k] = matriz[i][columnaPivote];
          matriz[i][columnaPivote] = aux;
        }
        print(k);
        print(columnaPivote);
        print(indices);
        var aux = indices[k];
        indices[k] = indices[columnaPivote];
        indices[columnaPivote] = aux;
      }
    }
    print(indices);
    listas[0] = matriz;
    listas[1] = indices;
    print(listas);
    return listas;
  }
}
