function [n, x, f] = bisection(a, b, f, stop, N, E)    
    n=1;
    x(n) = (a+b)./2;

    if stop == 1
        while n<N
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n = n+1;
            x(n)= (a+b)./2;
            
        end
    elseif stop == 2
        if f(a)*f(x(n))<0
            b = x(n);
        else
            a = x(n);
        end
        n =2;
        x(2) = (a+b)./2;
        while abs(x(n)-x(n-1))>=E
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;
            x(n)= (a+b)./2;

        end
    
    elseif stop == 3
        while abs(f(x(n)))>=E
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;    
            x(n)= (a+b)./2;
        
        end
    elseif stop == 4
        if f(a)*f(x(n))<0
            b = x(n);
        else
            a = x(n);
        end
        n =2;
        x(2) = (a+b)./2;
        while (abs(x(n)-x(n-1))>=E)
            if f(a)*f(x(n))<0
                b = x(n);
            else
                a = x(n);
            end
            n=n+1;    
            x(n)= (a+b)./2;
        end
        for i = [n:N]
            if f(a)*f(x(i))<0
                b = x(i);
            else
                a = x(i);
            end    
            x(i)= (a+b)./2;
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
            x(n) = (a+b)./2;
        end
        for i = [n:N]
            if f(a)*f(x(i))<0
                b = x(i);
            else
                a = x(i);
            end    
            x(i)= (a+b)./2;
        end
        n = N;
    end

end




        

