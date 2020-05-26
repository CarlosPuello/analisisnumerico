A = [[5 -2 3];[1 4 -4];[-5 -2 4]];
b = [-8;102;-90];
n = 3;
x0 = [8 22 -1.3];
tol = input('Ingrese la tolerancia: ');
iter = input('Ingrese el numero de iteraciones: ');
lambda = input("Ingrese lambda: ");

if tol < 0
    disp("El valor de la tolerancia es inadecuado");
elseif iter <= 0
    disp("El valor de las iteraciones es inadecuado");
else
    C = 0;
    E = tol +1;
    x1 = x0;
    resultado = [[0,x0,0];];
    while E>tol && C<iter
        for i = 1:n
            sum = 0;
            for j = 1:n
                if j~=i
                    sum = sum + A(i,j)*x0(j);
                end
            end
            x1(i) = lambda*(b(i)-sum)/A(i,i)+(1-lambda)*x0(i);
        end
        E = abs((norm(x1-x0))/norm(x1));
        x0 = x1;
        C = C+1;
        resultado = [resultado;[C,x0,E];];
    end
    if E<tol
        disp(x1);
        disp("Es la solución");
    else
        disp("Fracasó en el número de iteraciones");
    end
    names = ["n",1:n,"Error"];
    disp([names;resultado]);
end