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