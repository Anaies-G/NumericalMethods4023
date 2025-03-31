function [a, b] = rfinder(f)
    for j=[1:1:100000]
        for i=[-10*j:1:10*j]
            if f(i)*f(i+1)<=0
                a = i;
                b = i+1;
                break
            end
        end
        if isempty(a)
            continue
        else
            break
        end
    end
end