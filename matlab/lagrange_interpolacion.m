%TEST 1
%{
x = [2 2.5 3 3.5 4];
y = [9.1 16.95 18.78 19.33 23.88];
n = 5;
%}
%TEST 2
%{
x = [-4 -2 -1];
y = [-2.59625884456571 -0.696958389857672 0.908181747039582];%n = 3;
%}
%TEST 3
x = [2 2.2 2.4 2.6 2.8];
y = [-4.610943901069350 -4.174986500565880 -3.376823619358400 -2.136261964998310 -0.355353228902949];
n = 5;
lagrangeInterpolacion(x,y,n);

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
