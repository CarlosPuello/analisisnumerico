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