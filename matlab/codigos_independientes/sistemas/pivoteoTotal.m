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
            %indicesX = swapIndex(indicesX,columnaPivote,k);
        end
    end 
end