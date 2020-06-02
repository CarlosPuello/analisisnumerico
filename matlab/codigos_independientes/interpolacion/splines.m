function splines(x,y,n,grado)
    format long g
    switch grado
        case 2
            [A,b,dim] = splinesCuadratico(x,y,n);
        case 3
            [A,b,dim] = splinesCubico(x,y,n);
        otherwise
            [A,b,dim] = splinesLineal(x,y,n);
    end
    disp(A);
    disp(b);
    disp(dim);
    sol = linsolve(A,b);
    disp(sol);
    for i = 1:(n-1)
        f = 0;
        for j = 1:(grado+1)
			f = f +strjoin(["+"  num2str(sol((grado+1)*(i-1)+j)) "*x^" num2str(grado+1-j)]);
            f = string(expand(str2sym(f)));
        end
        funciones(i) = f;
    end
    disp(funciones');
    plot(x, y, 'o');
    hold on;
    for i = 1:n-1
        ply = funciones(i);
        fplot(str2sym(ply),[x(i) x(i+1)]);
    end
end