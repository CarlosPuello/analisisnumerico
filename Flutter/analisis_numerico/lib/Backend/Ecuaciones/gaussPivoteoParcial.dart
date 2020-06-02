class pivoteoParcial {
  static String _mensaje = "";

  static String get mensaje => _mensaje;
  static bool _posible = true;

  static bool get isPossible => _posible;

  static List pivotear({List matriz, int n, int k}) {
    double pivote = matriz[k][k].abs();
    int filaPivote = k;
    for (int i = k + 1; i < n; i++) {
      double aux = matriz[i][k].abs();
      if (pivote < aux) {
        pivote = aux;
        filaPivote = i;
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
    }
    return matriz;
  }
}
