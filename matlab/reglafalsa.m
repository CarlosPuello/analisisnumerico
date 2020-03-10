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
    fprintf('\n %g es una raiz', a);
elseif fb == 0
    fprintf('\n %g es una raiz', b);
elseif tol <= 0
    fprintf('\n Ingrese una tolerancia válida');
elseif iter <= 0
    fprintf('\n Ingrese un numero de iteraciones válida');
else
    i = 1;
    mprev = 0;
    err = tol + 1;
    fprintf('\n |   i  |  a   |   b  |   m   |  f(m)  |  err |');
    fprintf('\n ----------------------------------------------');
    
    while err > tol && i <= iter
        m = a - ((f(a)*(a-b))/(f(a)-f(b)));
        fm = f(m);
        
        if i != 1
            err = abs(m - mprev);
            fprintf('\n |   %g  |  %g   |   %g  |   %g   |  %g  |  %g |', i,a,b,m,fm,err);
        else
            fprintf('\n |   %g  |  %g   |   %g  |   %g   |  %g  |  0 |', i,a,b,m,fm);
        endif
        
        if fm != 0
            if fm > 0
                if fa > 0
                    a = m;
                else
                    b = m;
                endif
            elseif fm < 0
                if fa < 0
                    a = m;
                else
                    b = m;
                endif
            endif
        else
            fprintf('\n %m es raiz');
            i = iter;
        endif
        mprev = m;
        i = i + 1;
    end
    
    if err > tol
        fprintf('\n Fallo para conseguir tolerancia de %g en %g iteraciones.', tol,iter);
    endif
    
    ezplot(f)
    fprintf("\n")
endif