class ElimGaussSimple{

  List _resultado = new List();
  List get getResultado => _resultado;
  String _mensaje = "";
  String get getMensaje => _mensaje;
  bool evaluateAlgorithm({List matriz, int n}){
    try{
      double m = 0;
      for(int k = 0; k < n-1; k++){
        for(int i = k+1 ; i < n; i++){
          m = matriz[i][k]/matriz[k][k];
          for(int j = k; j < n+1; j++){
            matriz[i][j] = matriz[i][j] - (m*matriz[k][j]);
          }
        }
      }
      _resultado = new List(matriz.length);
      for(int i = 0; i < matriz.length ; i++){
        List fila = new List(matriz[i].length);
        for(int j = 0; j< matriz[i].length;j++){
          fila[j] = matriz[i][j];
        }
        _resultado[i] = fila;
      }
      _mensaje = "El sistema se ha resuelto con éxito, el nuevo sistema es: ";
      return true;
    }catch(e){
      _mensaje = "Error de división por cero";
      return false;
    }

  }
}