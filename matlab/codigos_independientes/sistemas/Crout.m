function Crout(A,n)
    U = eye(n);
	L = eye(n);
    for k =  1:n
        for i = k:n
			sum = 0;
            for s = 1:(k-1)
				sum = sum + L(i,s)*U(s,k);
            end
			L(i,k) = A(i,k) - sum;
        end
        for j = (k+1):n
			sum = 0;
            for s = 1:(k-1)
				sum = sum + L(k,s)*U(s,j);
            end
			U(k,j) = (A(k,j) - sum)/L(k,k);
        end
    end
	disp(L);
    disp(U);
end