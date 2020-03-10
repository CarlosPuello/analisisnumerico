clear
clear all
clc

func = input('Ingrese la funcion: ', 's');
f = inline(func);
xi = input('Ingrese el valor inicial: ');
delta = input('Ingrese el delta: ');
iter = input('Ingrese el número de iteraciones');
fa = f(a)
fb = f(b)

fprintf('\n |   x  |  f(x)   |');
fprintf('\n ------------------');

fprintf('\n |   %g   |  %g  |', a,fa);

if fa == 0
	fprintf('\n %g es una raiz',a);
else
	if delta <= 0
		fprintf('\n Ingrese un delta válido');
	else
        if  iter <= 0
            fprintf('\n Ingrese un número de iteraciones válido');
        else
            
        endif
    fprintf('\n')
    ezplot(f)
	endif
endif


Map tabla = new Map();
String incrementalAlgorithm({double x0, int iteraciones, double delta}){
  double y0 = f(x0);
  if(y0 == 0){
    return "$x0 es una raiz";
  }else if(delta == 0){
    return "Delta inapropiado";
  }else if(delta <= 0){
    return "Valor de iteraciones inapropiado";
  }else{
    tabla[0]=[x0,y0];
    double x1, y1;
    int contador = 1;
    x1 = x0 + delta;
    y1 = f(x1);
    while(y0*y1 > 0 && contador < iteraciones){
      x0 = x1;
      y0 = y1;
      x1 = x0 + delta;
      y1 = f(x1);
      contador++;
      tabla[contador]=[x0,y0];
    }
    if(y0*y1 < 0){
      return "[$x0,$x1] definen un intervalo";
    }else if(y1 == 0){
      return "$x1 es una raiz";
    }else{
      return "Fracaso en $iteraciones iteraciones";
    }
  }
}