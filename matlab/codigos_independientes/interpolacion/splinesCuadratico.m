function [A,b,dim] = splinesCuadratico(x,y,n)
	A = zeros(3*(n-1),3*(n-1));
	b = zeros(3*(n-1),1);
    for i = 1:(n-1)
		A(2*i-1,3*i-2) = x(i)^2;
		A(2*i-1,3*i-1) = x(i);
		A(2*i-1,3*i) = 1;
		b(2*i-1) = y(i);
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
	A(3*n-3,1) = 2;
	b(3*n-3) = 0;
    dim = 3*(n-1);
end