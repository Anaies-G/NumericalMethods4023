function valid = gvalid(g, a, b)
    g_num = matlabFunction(g);
    dg = diff(g);
    dg_num = matlabFunction(dg);
    
    r1 = 0;
    for i=[1:1:10000000]
        r1 = -500;
        r2 = 200.*i;
        x = [r1:0.0001:r2];
        max_d(i) = abs(max(dg_num(x)));
        min_d(i) = abs(min(dg_num(x)));
        r1 = r2;
        if (max_d(i)>1)|| (min_d(i)>1)
            valid = -1;
            break
        else
            valid = 1;
            disp("g(x) is considered valid in |g'(x)|<1");
            apr = input('Do you want to check more? 1.Yes, (any key).No');
            if apr == 1
                continue
            else
                break
            end
        end
    end
    
            
    x = [a:0.0001:b];
    max_s = max(g_num(x));
    min_s = min(g_num(x));
    if max_s>b || min_s<a
        valid = valid - 2;
    else
        valid = valid + 1;
    end

end