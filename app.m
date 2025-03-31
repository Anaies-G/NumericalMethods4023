clc;clear;close all

image_path = 'Designer.png';
Im = imread(image_path);

p = figure('Position',[100 100 1300 600]); 

imshow(Im);
title('Find The Root', 'FontSize', 14, 'Color', 'black');
set(p, 'Name', 'Find The Root');
pause(2.5);
close all;

disp('By Anaies Golboudaghians');
pause(1);
disp('EE student at KNTU');
pause(1);
disp('Supervisor: Dr Zakeri');
pause(2);
clc;

syms x;
f(x) = input('Enter a function e.g 3.*x - exp(-x):');
n = 1;

disp('1.Bisection');
disp('2.False Position');
disp('3.Fixed Point');
disp('4.Newton');
disp('5.Secant');
disp('6.The fastest method');
method = input('What method do you want to use? Type the number:');
disp('1.n times repeat');
disp('2. x(n+1) - x(n)<e');
disp('3. f(x)<e');
disp('4. 1&2');
disp('5. 1&3');
stop = input('What is your stopping criteria?');
if stop == 1
    N = input('Enter the n:');
    N = N + 1;
    E =0;
elseif (stop ==2) || (stop==3) 
    E = input('Enter the e - the tolerance:');
    N =0;
elseif (stop ==4)||(stop==5)
    N = input('Enter the n:');
    N = N + 1;
    E = input('Enter the e - the tolerance:');
end

acc = input('How many decimal places do you want to be accurate?');

if method == 1
    disp('Do you want me to guess the range (a,b)');
    gss = input('1.Yes (Any key).No:');
    if gss==1
        [a, b] = rfinder(f);
    else
        a = input('Enter the a: ');
        b = input('Enter the b: ');
        while (f(a)*f(b)) > 0
            disp('There is no root in that range');
             a = input('Enter the a: ');
             b = input('Enter the b: ');
        end
    end
   [n, x, f] = bisection(a, b, f, stop, N, E);
elseif method == 2 
    disp('Do you want me to guess the range (a,b)');
    gss = input('1.Yes (Any key).No:');
    if gss==1
        [a, b] = rfinder(f);
    else
        a = input('Enter the a: ');
        b = input('Enter the b: ');
        while (f(a)*f(b)) > 0
            disp('There is no root in that range');
             a = input('Enter the a: ');
             b = input('Enter the b: ');
        end
    end
   [n, x, f] = false_pos(a, b, f, stop, N, E);
elseif method ==3
    g(x) = input('Enter your g(x):');
    disp('Do you want me to guess the range (a,b)');
    gss = input('1.Yes (Any key).No:');
    if gss==1
        [a, b] = rfinder(f);
    else
        a = input('Enter the a: ');
        b = input('Enter the b: ');
        while (f(a)*f(b)) > 0
            disp('There is no root in that range');
             a = input('Enter the a: ');
             b = input('Enter the b: ');
        end
    end
    valid = gvalid(g, a, b);

    while valid<=0
        if valid == -3
            disp('g(x) is invalid in both conditions');
            g(x) = input('enter g(x):');
            valid = gvalid(g, a, b);
        elseif valid == 0
            disp("|g'(x)|>1");
            g(x) = input('enter g(x):');
            valid = gvalid(g, a, b);
        elseif valid == -1
            disp("range of g(x) is not in (a,b)");
            g(x) = input('enter g(x):');
            valid = gvalid(g, a, b);
        end
    end
    if valid == 2
        disp('g(x) is valid');
    end
       
    x0 = input('Enter a the point of start:');
    [n, x, fval] = fixed_point(f, g, x0, stop, N, E);
elseif method ==4
    x0 = input('Enter a the point of start:');
    [n, x, fval] = newton(f, x0, stop, N, E);
elseif method ==5
    x0 = input('Enter the point of start:');
    x1 = input('Enter second point of start:');
    [n, x, fval] = secant(f, x0, x1, stop, N, E);
elseif method ==6
    disp('Do you want me to guess the range (a,b)');
    gss = input('1.Yes (Any key).No:');
    if gss==1
        [a, b] = rfinder(f);
    else
        a = input('Enter the a: ');
        b = input('Enter the b: ');
        while (f(a)*f(b)) > 0
            disp('There is no root in that range');
             a = input('Enter the a: ');
             b = input('Enter the b: ');
        end
    end
   [n1, x_1, f] = bisection(a, b, f, stop, N, E);   
   [n2, x_2, f] = false_pos(a, b, f, stop, N, E);    
    g(x) = input('Enter your g(x):');
    valid = gvalid(g, a, b);

    while valid<=0
        if valid == -3
            disp('g(x) is invalid in both conditions');
            g(x) = input('enter g(x):');
            valid = gvalid(g, a, b);
        elseif valid == 0
            disp("|g'(x)|>1");
            g(x) = input('enter g(x):');
            valid = gvalid(g, a, b);
        elseif valid == -1
            disp("range of g(x) is not in (a,b)");
            g(x) = input('enter g(x):');
            valid = gvalid(g, a, b);
        end
    end
    if valid == 2
        disp('g(x) is valid');
    end
       
    x0 = input('Enter a the point of start:');
    [n3, x_3, fval] = fixed_point(f, g, x0, stop, N, E);    
    [n4, x_4, fval] = newton(f, x0, stop, N, E);
    x1 = input('Enter second point of start:');
    [n5, x_5, fval] = secant(f, x0, x1, stop, N, E);
    ns = [n1, n2, n3, n4, n5];
    n = min(ns);
        if n == n1
            disp('Method no.1_bisection is the fastest');
            x = x_1;
        end
        if n == n2
            disp('Method no.2_false position is the fastest');
            x = x_2;
        end
        if n == n3
            disp('Method no.3_fixed point is the fastest');
            x = x_3; 
        end
        if n == n4
            disp('Method no.4_newton is the fastest');
            x = x_4;
        end
        if n == n5
            disp('Method no.5_secant is the fastest');
            x = x_5;
        end
end


disp(n-1);

acc = round(abs(acc));
formatSpecx = ['%.', num2str(acc), 'f'];
fprintf(formatSpecx, x(n));
disp('    ');
y = matlabFunction(f);
formatSpecy = ['%.', num2str(acc+1), 'f'];
fprintf(formatSpecy,y(x(n)));

table = zeros(n, 3);
for i=[1:n]
    table(i,1) = i-1;
    table(i,2) = x(i);
    table(i,3) = y(x(i));
end

disp('   ');
disp(table);