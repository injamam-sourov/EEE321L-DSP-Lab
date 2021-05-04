% function to generate unit step sequence (delay n0, range n1,n2)
function [x, n] = stepseq(n0, n1, n2)
n = n1:n2;
x = (n - n0) >= 0;      % 1 when n-n0 >= 0, 0 otherwise
end