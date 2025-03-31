function [n, x, f] = false_pos(a, b, f, stop, N, E)
    n=1;
    x(n) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
    

    if stop == 1
        while n<N
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n = n+1;
            x(n) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
            
        end
    elseif stop == 2
        if f(a)*f(x(n))<0
            b = x(n);
        else
            a = x(n);
        end
        n =2;
        x(2) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        while abs(x(n)-x(n-1))>=E
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;
            x(n) = (a.*f(b) - b.*f(a))./(f(b)-f(a));

        end
    
    elseif stop == 3
        while abs(f(x(n)))>=E
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;    
            x(n) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        
        end
    elseif stop == 4
        if f(a)*f(x(n))<0
            b = x(n);
        else
            a = x(n);
        end
        n =2;
        x(2) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        while (abs(x(n)-x(n-1))>=E)
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;    
            x(n) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        end
        for i = [n:N]
            if f(a)*f(x(i))<0
                b = x(i);
            else
                a = x(i);
            end   
            x(i) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        end
        n = N;
    elseif stop == 5
        while (abs(f(x(n)))>=E)
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;    
            x(n) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        end
        for i = [n:N]
            if f(a)*f(x(i))<0
                b = x(i);
            else
                a = x(i);
            end    
            x(i) = (a.*f(b) - b.*f(a))./(f(b)-f(a));
        end
        n = N;
    end
end
