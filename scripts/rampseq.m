% function to generate unit step sequence (delay n0, range n1,n2)
function [x, n] = rampseq(n0, n1, n2)
n = n1:n2;
x = (n-n0).*[(n-n0) >= 0];     % 1*(n-n0) when n-n0 >= 0, 0 otherwise
end