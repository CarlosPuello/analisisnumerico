clear
clear all
clc

func = input('Ingrese la funcion f: ', 's');
f = inline(func);

gunc = input('Ingrese la funcion g: ', 's');
g = inline(gunc);

x0 = input('Ingrese el valor inicial: ');
tol = input('Ingrese la tolerancia: ');
iter = input('Ingrese el numero de iteraciones: ');

y0 = f(x0);
cont = 0;
error = tol + 1;
fprintf("\n |n| xn | f(xn) | err |");
if y0 == 0
    fprintf('\n %g es una raiz',x0);
else
    if tol <= 0
        fprintf('\n Ingrese una tolerancia valida');
    else
        if iter <= 1
            fprintf('\n Ingrese un numero de iteraciones valido');
        else
            while y0 != 0 && error > tol && cont < iter
                xn = g(x0);
                error = abs(xn-x0);
                fprintf("\n | %g | %g | %g| %g |",cont,x0,y0,error);
                y0 = f(xn);
                x0 = xn;
                cont = cont + 1;
            end

            if y0 == 0 
                fprintf('\n %g es una raiz.', x0);
            elseif error < tol
                fprintf('\n %g es una raiz aproximada.',x0);
            else
                fprintf('\n Fracaso en %g iteraciones.',iter);
            endif
        endif
    endif
endif

fprintf("\n");