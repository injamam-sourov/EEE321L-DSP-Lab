% x(n) = u(n+1) for -10:10
[x, n] = stepseq(-1, -10, 10);  % delay = -1
stem(n, x)

% x(n) = -u(n-2) for -10:10
n = -10:10;
y = -stepseq(2,-10,10);
stem(n,y)

% x(n) = d(n-2) -10:10
[x, n] = impseq(2, -10, 10);
stem(n, x)

% x(n) = -d(n+3) for -10:10
n = -10:10;
y = -impseq(-3,-10,10);
stem(n,y)


% x(n) = u(n+1) + d(n-2) for -10:10
n = -10:10;
y = stepseq(-1, -10, 10) + impseq(2,-10,10);
stem(n,y)

%% assignment ramp sequence
% x(n) = ramp(n) for -10:10
[x, n] = rampseq(0, -10, 10);
stem(n, x)

% x(n) = ramp(n-4) for -10:10
[x, n] = rampseq(4, -10, 10);
stem(n, x)

% x(n) = -ramp(n-4) for -10:10
n = -10:10;
y = -rampseq(4,-10,10);
stem(n,y)