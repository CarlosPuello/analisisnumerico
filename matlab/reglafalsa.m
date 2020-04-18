clear
clear all
clc

func = input('Ingrese la funcion: ', 's');
f = inline(func);
a = input('Ingrese a: ');
b = input('Ingrese b: ');
tol = input('Ingrese la tolerancia: ');
iter = input('Ingrese el numero de iteraciones: ');
fa = f(a);
fb = f(b);

if fa == 0
    fprintf('\n %g es una raiz.', a);
elseif fb == 0
    fprintf('\n %g es una raiz.', b);
elseif tol <= 0
    fprintf('\n Ingrese una tolerancia válida.');
elseif iter <= 0
    fprintf('\n Ingrese un numero de iteraciones válida.');
else
    i = 1;
    err = tol + 1;
    m = a - ((f(a)*(a-b))/(f(a)-f(b)));
    fm = f(m);

    resultado = [[i,a,b,m,fm,"---"];];

    while fm ~= 0 && err > tol && i < iter
        if fa*fm < 0
            b = m;
            fb = fm;
        else
            a = m;
            fa = fm;
        end
        aux = m;
        m = a - ((f(a)*(b-a))/(f(b)-f(a)));
        fm = f(m);
        i = i + 1;
        err = abs(m - aux);
        resultado = [resultado;[i,a,b,m,fm,err];];
    end
    
    if err < tol
        fprintf('\n %g es raiz aproximada.',m);
    end

    if fm == 0
        fprintf('\n %g es raiz.',m);
    end

    if err > tol
        fprintf('\n Fallo para conseguir tolerancia de %g en %g iteraciones.', tol,iter);
    end
end    
fprintf("\n")
VarNames = {'n', 'a', 'b','m','f(m)','error'};
disp([VarNames;resultado]);
fprintf("\n")