function newtonInterpolacion(x,y,n)
    format long g
    f0 = y;
    f1 = [];
    for k = 2:n
        for i = 1:(n-k+1)
            f1(i) = (f0(i+1)-f0(i))/(x(i+k-1)-x(i));
        end
        b(k) = f1(1);
        f0 = f1;
    end
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