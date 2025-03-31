function [n, x, fval] = secant(f, x0, x1, stop, N, E)

    n = 2;
    x(1) = x0;
    x(2) = x1;
    
    f_num = matlabFunction(f);

    if stop ==1
        while n<N
            x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
            n = n + 1;
        end
    elseif stop ==2
        x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
        n = n + 1;
        while abs(x(n)-x(n-1))>=E
            x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
            n = n + 1;
        end
    elseif stop ==3
        while abs(f_num(x(n))) >= E
            x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
            n = n + 1;
        end
    elseif stop ==4
        x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
        n = n + 1;
        while abs(x(n)-x(n-1))>=E
            x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
            n = n + 1;
        end
        for i = [n:N]
            x(i+1) = (x(i-1).*f_num(x(i)) - x(i).*f_num(x(i-1)))./(f_num(x(i))-f_num(x(i-1)));
        end
        n = N;
    elseif stop==5
        while abs(f_num(x(n))) >= E
            x(n+1) = (x(n-1).*f_num(x(n)) - x(n).*f_num(x(n-1)))./(f_num(x(n))-f_num(x(n-1)));
            n = n + 1;
        end        
        for i = [n:N]
            x(i+1) = (x(i-1).*f_num(x(i)) - x(i).*f_num(x(i-1)))./(f_num(x(i))-f_num(x(i-1)));
        end
        n = N;
    end
    fval = f_num(x(n));
end