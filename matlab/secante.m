clear
clear all
clc

func = input('Ingrese la funcion f: ', 's');
f = inline(func);

x0 = input('Ingrese el primer valor inicial: ');
x1 = input('Ingrese el segundo valor inicial: ');
tol = input('Ingrese la tolerancia: ');
iter = input('Ingrese el numero de iteraciones: ');

y0 = f(x0);
y1 = f(x1);
cont = 2;
error = tol + 1;
resultado = [[0,x0,y0,"---"];[1,x1,y1,"---"]];

if y0 == 0
    fprintf('\n %g es una raiz.',x0);
else
    if y1 == 0
        fprintf('\n %g es una raiz.',x1);
    else
        if tol <= 0
            fprintf('\n Ingrese una tolerancia valida.');
        else
            if iter <= 2
                fprintf('\n Ingrese un numero de iteraciones valido.');
            else

                while y0 ~= 0 && error > tol && cont < iter
                    xn = x1-((y1*(x1-x0))/(y1-y0));
                    yn = f(xn);
                    error = abs(xn-x1);
                    resultado = [resultado; {cont,xn,yn,error}];
                    y0 = y1;
                    x0 = x1;
                    y1 = yn;
                    x1 = xn;
                    cont = cont + 1;
                end

                if y1 == 0 
                    fprintf('\n %g es una raiz.', x1);
                elseif error < tol
                    fprintf('\n %g es una raiz aproximada.',x1);
                else
                    fprintf('\n Fracaso en %g iteraciones.',iter);
                end
            end
        end
    end
end
fprintf("\n");
VarNames = {'n', 'xn', 'fxn', 'error'};
disp([VarNames;resultado]);
fprintf("\n");