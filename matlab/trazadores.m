x = [2 2.5 3 3.5 4];
y = [9.1 16.95 18.78 19.33 23.88];
n = 5;
splines(x,y,n,1);
%pp = spline(x,y);
disp(pp);

function splines(x,y,n,grado)
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
	%sol = Gauss_Pivoteo(A,b,dim);
    sol = linsolve(A,b);
    disp(sol);
    f = [];
    for i = 1:(n-1)
        for j = 1:(grado+1)
            info = [grado i j];
            disp(info);
            idx = (grado+1)*(n-1)+j;
            disp("lolxd");
            disp(idx);
			f = [f  num2str(sol((grado+1)*(i-1)+j))+"*x^"+num2str(grado+1-j)];
        end
		disp("f = y");
    end
    disp(f');
end


function [A,b,dim] = splinesLineal(x,y,n)
	A = zeros(2*(n-1),2*(n-1));
	b = zeros(2*(n-1),1);
    for i = 1:(n-1)
		A(2*i-1,2*i-1) = x(i);
		A(2*i-1,2*i) = 1;
		b(2*i-1) = y(i);
		A(2*i,2*i-1) = x(i+1);
		A(2*i,2*i) = 1;
		b(2*i) = y(i+1);
    end
    dim = 2*(n-1);
end

function [A,b,dim] = splinesCuadratico(x,y,n)
	A = zeros(3*(n-1),3*(n-1));
	b = zeros(3*(n-1),1);
    for i = 1:(n-1)
		A(2*i-1,3*i-2) = x(i)^2;
		A(2*i-1,3*i-1) = x(i);
		A(2*i-1,3*i) = 1;
		b(2*i-1) = y(i+1);
		A(2*i,3*i-2) = x(i+1)^2;
		A(2*i,3*i-1) = x(i+1);
		A(2*i,3*i) = 1;
		b(2*i) = y(i+1);
    end
    for i = 1:(n-2)
		A(2*n-2+i,3*i-2) = 2*x(i+1);
		A(2*n-2+i,3*i-1) = 1;
		A(2*n-2+i,3*i+1) = -2*x(i+1);
		A(2*n-2+i,3*i+2) = -1;
		b(2*n-2+i) = 0;
    end
	A(3*n-3,3*n-5) = 2;
	b(3*n-3) = 0;
    dim = 3*(n-1);
end

function [A,b,dim] = splinesCubico (x,y,n)
	A = zeros(4*(n-1),4*(n-1));
	b = zeros(4*(n-1),1);
    for i = 1:(n-1)
		A(2*i-1,4*i-3) = x(i)^3;
		A(2*i-1,4*i-2) = x(i)^2;
		A(2*i-1,4*i-1) = x(i);
		A(2*i-1,4*i) = 1;
		b(2*i-1) = y(i+1);
		A(2*i,4*i-3) = x(i+1)^3;
		A(2*i,4*i-2) = x(i+1)^2;
		A(2*i,4*i-1) = x(i+1);
		A(2*i,3*i) = 1;
		b(2*i) = y(i+1);
    end
    for i = 1:(n-2)
		A(2*n-2+i,4*i-3) = 3*x(i+1)^2;
		A(2*n-2+i,4*i-2) = 2*x(i+1);
		A(2*n-2+i,4*i-1) = 1;
		A(2*n-2+i,4*i+1) = -3*x(i+1)^2;
		A(2*n-2+i,4*i+2) = -2*x(i+1);
		A(2*n-2+i,4*i+3) = 1;
		b(2*n-2+i) = 0;
    end
    for i = 1:(n-2)
		A(3*n-4+i,4*i-3) = 6*x(i+1);
		A(3*n-4+i,4*i-2) = 2;
		A(3*n-4+i,4*i+1) = -6*x(i+1);
		A(3*n-4+i,4*i+2) = -2;
		b(3*n-4+i) = 0;
    end
	A(4*n-5,1) = 6*x(1);
	A(4*n-5,2) = 2;
	A(4*n-4,4*n-7) = 6*x(n);
	A(4*n-4,4*n-6) = 2;
	b(4*n-5) = 0;
	b(4*n-4) = 0;
    dim = 4*(n-1);
end