MatA = [[34 -5 6 12];[-9 43 21 -8];[-12 4 -75 22];[7 5 -13 65]];
MatB = [37;123;16;9];
inds = 1:4;
disp(inds);
disp()
disp(Gauss(MatA,MatB,4));


function Mat = Gauss(A,b,n)
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

function Mat = pivoteoParcial(Mat,n,k)
    pivote = abs(Mat(k,k));
    filapivote = k;
    for i = k+1:n
        aux = abs(Mat(i,k));
        if pivote < aux
            pivote = aux;
            filapivote = i;
        end
    end
    if pivote == 0
        disp("No tiene solucion unica")
    else
        if filapivote ~= k
            Mat = swapRow(Mat,filapivote,k);
        end
    end
end

function Ab = pivoteoTotal(Ab,n,k)
    pivote = 0;
    filaPivote = k;
    columnaPivote = k;
    for i = k:n
        for j = k:n
            aux = abs(Ab(i,j));
            if pivote < aux
                pivote = aux;
                filaPivote = i;
                columnaPivote = j;
            end
        end
    end
    if pivote == 0
        disp("no tiene solucion unica");
    else
        if filaPivote ~= k
            Ab = swapRow(Ab,filaPivote,k);
        end
        if columnaPivote ~= k
            Ab = swapCol(Ab,columnaPivote,k);%do swapCols and swapIndexes
            indicesX = 1:4;
            indicesX = swapIndex(indicesX,columnaPivote,k);
        end
    end 
end


