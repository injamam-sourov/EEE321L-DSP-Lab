% fucntion to downsample a signal by factor M
function [y,m] = dnsample(n, x, M)
m = min(n./M):max(n./M);
y = x(1:length(m));
end
