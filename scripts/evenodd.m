% function to determine even/odd component
function [xe,xo,m] = evenodd(x,n)
m = n;
xe = 0.5*(x + fliplr(x));   % fliplr -> x(-n)
xo = 0.5*(x - fliplr(x));
end