MatADoo = [[39 -8 -7 8];[-15 79 9 -5];[-6 4 57 12];[-3 8 -10 96]];%Matriz Doo
MatACro = [[20 -1 3 4];[6 23 4 3];[7 21 46 9];[-3 -9 12 38]];%Matriz para Crout
MatACho = [[8 2 2 5];[4 5 7 -8];[-4 7 12 11];[8 -3 -11 28]];%Matriz Cholesky

disp("Cholesky");
Cholesky(MatACho,4);
disp("Doolittle");
Doolittle(MatADoo,4);
disp("Crout");
Crout(MatACro,4);
disp(MatACho);
function Cholesky(A,n)
    L = eye(n);
    U = eye(n);
    for k = 1:n
        sum = 0;
        for s = 1:(k-1)
            sum = sum + L(k,s)*U(s,k);
        end
        L(k,k) = sqrt(A(k,k) - sum);
		U(k,k) = L(k,k);
        for j = (k+1):n
            sum = 0;
            for s = 1:(k-1)
				sum = sum + L(k,s)*U(s,j);
            end
			U(k,j) = (A(k,j) - sum)/L(k,k);
        end
        for i = (k+1):n
			sum = 0;
            for s = 1:(k-1)
				sum = sum + L(i,s)*U(s,k);
            end
			L(i,k) = (A(i,k) - sum)/L(k,k);
        end
    end
    disp(L);
    disp(U);
end

function Doolittle(A,n)
    U = eye(n);
	L = eye(n);
    for k = 1:n
        for j = k:n
			sum = 0;
            for s = 1:(k-1)
				sum = sum + L(k,s)*U(s,j);
            end
			U(k,j) = A(k,j) - sum;
        end
        for i = (k+1):n
			sum = 0;
            for s = 1:(k-1)
				sum = sum + L(i,s)*U(s,k);
            end
			L(i,k) = (A(i,k) - sum)/U(k,k);
        end
    end
	disp(L);
    disp(U);
end

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