function Ab = pivoteoEscalado(Ab,n,k)
	S = [1,n-k+1];
    for i = k:n
		max = abs(Ab(i,k));
        for j = (k+1):n    
			aux = abs(Ab(i,j));
            if max < aux
				max = aux;
            end
        end
        if max == 0
			disp("No tiene solución única.");
        else
			S(i) = abs(Ab(i,k))/max;
        end
    end
	max = abs(S(1));
	fil = 1;
    for j = 2:(n-k+1)
		aux = abs(S(j));
        if max < aux
			max = aux;
			fil = j;
        end
    end
    if fil ~= 1
		Ab = swapRow(Ab,k+fil-1,k);
    end
	disp(Ab);
end