clear
clear all
clc

func = input('Ingrese la funcion: ', 's');
f = inline(func);
x0 = input('Ingrese el valor inicial: ');
delta = input('Ingrese el delta: ');
iter = input('Ingrese el numero de iteraciones');
y0 = f(x0);

fprintf('\n |   x  |  f(x)   |');
fprintf('\n ------------------');

fprintf('\n |   %g   |  %g  |', x0,y0);

if y0 == 0
	fprintf('\n %g es una raiz',x0);
else
	if delta <= 0
		fprintf('\n Ingrese un delta valido');
	else
        if  iter <= 0
            fprintf('\n Ingrese un número de iteraciones valido');
        else
            contador = 1;
            x1 = x0 + delta;
            y1 = f(x1);
            while y0*y1 > 0 && contador < iter
              x0 = x1;
              y0 = y1;
              fprintf('\n |   %g   |  %g  |', x0,y0);
              x1 = x0 + delta;
              y1 = f(x1);
              contador = contador + 1;
            end
            fprintf('\n |   %g   |  %g  |', x1,y1);
            if y0*y1 < 0
              fprintf('\n [%g,%g] es un intervalo que contiene una raiz.', x0,x1);
            elseif y1 == 0
              fprintf('\n %g es una raiz.', x1);
            else
              fprintf('\n Fracaso en %g iteraciones.', iter);
            endif

        endif
    fprintf('\n')
    ezplot(f)
	endif
endif