clear
clear all
clc

func = input('Ingrese la funcion: ', 's');
f = inline(func);
funcd = input('Ingrese la primera derivada: ', 's');
d = inline(funcd);
funcd2 = input('Ingrese la segunda derivada: ', 's');
d2 = inline(funcd2);

x0 = input('Ingrese el valor inicial: ');
tol = input('Ingrese la tolerancia: ');
iter = input('Ingrese el numero de iteraciones: ');

if tol <= 0
    fprintf("\n Ingrese una tolerancia valida.");
else
    if iter <=0
        fprintf("\n Ingrese un numero de iteraciones valido.");
    else
        contador = 1;
        error = tol + 1;
        y0 = f(x0);
        d0 = d(x0);
        dd0 = d2(x0);
        resultado = [[0,x0,y0,d0,dd0,"---"];];

        while y0 ~= 0 && error > tol && d0 ~= 0 && contador < iter
            x1 = x0 - ((y0*d0)/((d0^2)-(y0*dd0)));
            error = abs(x1-x0);
            x0 = x1;
            y0 = f(x1);
            d0 = d(x1);
            dd0 = d2(x1);
            resultado = [resultado;{contador,x0,y0,d0,dd0,error};];
            contador = contador + 1;
        end

        if y0 == 0
            fprintf("\n %g es raiz.", x0);
        else
            fprintf("\n el valor de y es %g",y0);
            if error < tol
                fprintf("\n %g es una raiz aproximada.", x0);
            else
                if d0 == 0
                    fprintf("\n Problema con la derivada, puede haber raiz multiple.");
                else
                    fprintf("\n Fracaso en %g iteraciones.", iter);
                end
            end
        end
    end
end
fprintf("\n");
VarNames = {'n','xn','f(xn)','f´(xn)','f´´(xn)','error'};
disp([VarNames;resultado]);
fprintf("\n");