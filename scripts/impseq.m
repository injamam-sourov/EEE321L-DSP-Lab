% function to generate impulse sequence(delay n0, range n1, n2) 
function [x, n] = impseq(n0, n1, n2)
n = n1:n2;          % define range
x = (n-n0) == 0;    % array with 1 when n-n0 = 0 otherwise 0
end
