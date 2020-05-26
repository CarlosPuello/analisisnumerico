%x = [-4 -2 -1];
%y = [-2.59625884456571 -0.696958389857672 0.908181747039582];
%n = 3;

x = [2 2.5 3 3.5 4];
y = [9.1 16.95 18.78 19.33 23.88];
n = 5;
%x = [2 2.2 2.4 2.6 2.8];
%y = [-4.610943901069350 -4.174986500565880 -3.376823619358400 -2.136261964998310 -0.355353228902949];
%n = 5;
newtonInterpolacion(x,y,n);

function newtonInterpolacion(x,y,n)
    format long g
    %calculo de valores b
    f0 = y;
    f1 = [];
    for k = 2:n
        for i = 1:(n-k+1)
            f1(i) = (f0(i+1)-f0(i))/(x(i+k-1)-x(i));
        end
        b(k) = f1(1);
        f0 = f1;
    end
    %construcción de la expresión
    c = 0;
    pol = num2str(y(1));
    for i = 1:n
        sec = "+" + num2str(b(i));
        for j = 1:c
            sec = sec + "*(x-" +  num2str(x(j)) + ")";
        end
        c = c+1;
        pol = pol + sec;
    end
    disp(b);
    disp(pol);
    exp = simplify(str2sym(pol));
    disp(exp);
    plot(x, y, 'o');
    hold on;
    fplot(exp);
end