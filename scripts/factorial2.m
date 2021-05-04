% fuction to calculate factorial
function [f] = factorial2(a)
    f = 1;          % default value
    while a > 1     
        f = f*a;
        a = a-1;
    end
end