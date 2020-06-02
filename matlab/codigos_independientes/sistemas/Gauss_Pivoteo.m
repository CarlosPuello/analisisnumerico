MatA = [[34 -5 6 12];[-9 43 21 -8];[-12 4 -75 22];[7 5 -13 65]];
MatB = [37;123;16;9];
disp(Gauss(MatA,MatB,4));

function res = Gauss_Pivoteo(A,b,n)
    Mat = [A b];
    for k = 1:(n-1)
        Mat = pivoteoTotal(Mat,n,k);
        for i = k+1:n
            m = Mat(i,k)/Mat(k,k);
            for j = k:n+1
                Mat(i,j) = Mat(i,j)-m*Mat(k,j);
            end
        end
    end
    res = sust_regresiva(Mat,n);
end

function x = sust_regresiva(Mat,n)
    disp(Mat);
    x(n) = Mat(n,n+1)/Mat(n,n);
    for i = n-1:1
        s = 0;
        for j = i+1:n
            s = s + Mat(i,j)*x(j);
        end
        x(i)= (Mat(i,n+1)-s)/Mat(i,i);
    end
end

function A = swapRow(A, row1, row2)
  A([row2, row1], :) = A([row1, row2], :);
end

function A = swapCol(A, row1, row2)
   t = A(:,row1);
   A(:,row1) = A(:,row2);
   A(:,row2) = t;
end

function A = swapIndex(A, i, j)
    t = A(i);
    A(i) = A(j);
    A(j) = t;
end