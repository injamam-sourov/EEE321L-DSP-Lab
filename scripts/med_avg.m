% function to compute the median(m) and the n-point moving average(y) of a signal
function [m, y] = med_avg(x, n)
m = median(x);
y = movmean(x, n); % see help
end