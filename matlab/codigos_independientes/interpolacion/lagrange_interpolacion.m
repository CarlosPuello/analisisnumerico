function lagrangeInterpolacion(x,y,n)
	p = 0;
    for k = 1:n
		Lk = "1";
        for i = 1:n
            if i ~= k
				Lk = Lk +"*((x-"+ num2str(x(i))+")/("+num2str(x(k)-x(i))+"))";
            end
        end
        Lk = string(expand(str2sym(Lk)));
		p = p + " + ("+Lk+")*"+num2str(y(k));
    end
    exp = simplify(str2sym(p));
    disp(exp);
    plot(x, y, 'o');
    hold on;
    fplot(exp);
end
