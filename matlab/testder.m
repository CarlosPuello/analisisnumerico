func = input("ingrese una funcion",'s');
f = inline(func);
            f1 = inline2sym(f);
            
            dp = diff(f1,1);
            d = inline(dp);
            d1 = inline2sym(d);
            %app.PrimeraderivadaEditField.Value = dp;
            
            dp2 = diff(d1,1);
            d2 = inline(dp2);
disp(dp);
disp(dp2);