% function to compute N point circular folding
function x2 = circfold(x1, N)
n = 0:N-1;
x2 = x1(mod(-n, N)+1);
end