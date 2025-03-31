function [n, x, fval] = fixed_point(f, g, x0, stop, N, E)
    
    n = 1;
    x(1) = x0;
    f_num = matlabFunction(f);
    g_num = matlabFunction(g);
    
    
    if stop ==1
        while n<N
            x(n+1) = g_num(x(n));
            n=n+1;
        end
    elseif stop ==2
        x(n+1) = g_num(x(n));
        n=n+1;
        while abs(x(n)-x(n-1))>=E
            x(n+1) = g_num(x(n));
            n=n+1;
        end
    elseif stop ==3
        while abs(f_num(x(n))) >= E
            x(n+1) = g_num(x(n));
            n=n+1;
        end
    elseif stop ==4
        x(n+1) = g_num(x(n));
        n=n+1;
        while abs(x(n)-x(n-1))>=E
            x(n+1) = g_num(x(n));
            n=n+1;
        end
        for i = [n:N]
            x(i+1) = g_num(x(i));
        end
        n = N;
    elseif stop==5
        while abs(f_num(x(n))) >= E
            x(n+1) = g_num(x(n));
            n=n+1;
        end        
        for i = [n:N]
            x(i+1) = g_num(x(i));
        end
        n = N;
    end
    fval = f_num(x(n));
end
