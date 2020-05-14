MatA = [[34 -5 6 12];[-9 43 21 -8];[-12 4 -75 22];[7 5 -13 65]];
MatB = [37;123;16;9];
Mat = [MatA MatB];
%Eliminacion simple
disp(Mat);
n = 4;
for k = 1:(n-1)
    for i = (k+1):n
        m = Mat(i,k)/Mat(k,k);
        for j = k:(n+1)
            Mat(i,j) = Mat(i,j)-m*Mat(k,j);
        end
    end
end
disp(Mat)
%Fin Eliminacion simple

%Sust Regresiva
x(n) = Mat(n,n+1)/Mat(n,n);
for i = n-1:1
    s = 0;
    for j = i+1:n
        s = s + Mat(i,j)*x(j);
    end
    x(i)= (Mat(i,n+1)-s)/Mat(i,i);
end
disp(x);
%Fin Sust Regresiva