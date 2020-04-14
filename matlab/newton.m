clear
clear all
clc

func = input('Ingrese la funcion f: ', 's');
f = inline(func);

funcp = input('Ingrese la derivada de f: ', 's');
fp = inline(funcp);

x0 = input('Ingrese el valor inicial: ');
tol = input('Ingrese la tolerancia: ');
iter = input('Ingrese el numero de iteraciones: ');

y0 = f(x0);
yp0 = fp(x0);
cont = 1;

error = tol + 1;
fprintf("\n | n | xn | f(xn) | f'(xn) | err |");
fprintf("\n | 0 | %g | %g | %g | ---- |",x0,y0,yp0);

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
                xn = x0 - (y0/yp0);
                error = abs(xn-x0);
                y0 = f(xn);
                yp0 = fp(xn);
                fprintf("\n | %g | %g | %g | %g | %g |",cont,xn,y0,yp0,error);
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