MatA = [[34 -5 6 12];[-9 43 21 -8];[-12 4 -75 22];[7 5 -13 65]];
x = 1:4;
disp(swapRow(MatA,1,2))
disp(swapCol(MatA,1,2))
disp(swapIndex(x,2,3))
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