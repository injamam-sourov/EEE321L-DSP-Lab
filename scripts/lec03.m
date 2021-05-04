%% signal generation
% (addition) x(n) = u(n+1) + u(n-2), -5:5
n = -5:5;
x = stepseq(-1,-5,5) + stepseq(2,-5,5);
stem(n,x)

% (scaling) x(n) = d(n+3) + 2d(n-2), -5:5
n = -5:5;
x = impseq(-3,-5,5) + 2*impseq(2,-5,5);
stem(n,x)

% (division) x(n) = n/u(n-2), -5:5
n = -5:5;
x = n./stepseq(2,-5,5);     % dot for element-wise operation
stem(n,x)

% (multiplication) x(n) = n[u(n)-u(n-5)], -5:5
n = -5:5;
x = n.*(stepseq(0,-5,5)-stepseq(5,-5,5));
stem(n,x)

% (power) x(n) = n^2u(n+2), -5:5
n = -5:5;
x = (n.^2).*(stepseq(-2,-5,5));
stem(n,x)

% x(n) = u(n+1)-2d((n-2), -5:5
n = -5:5;
x = stepseq(-1,-5,5)-2*impseq(2,-5,5);
stem(n,x)

%(exponential) x(n) = n[u(n)-u(n-5)] + 10e^[-0.5(n-5)], -5:5
n = -5:5;
x = n.*(stepseq(0,-5,5)-stepseq(5,-5,5)) + 10*exp(-0.5*(n-5));
stem(n,x)

%% magnitude, phase, real, imaginary part of complex signal
% x(n) = e^[-j0.5(n-5)], -10:10
n = -10:10;
x = exp(-0.5*(n-5)*i);
stem(n,x)
% mangitude
mag = abs(x);
stem(n,mag)
% real part
xreal = real(x);
stem(n,xreal)
% imaginary part
ximag = imag(x);
stem(n,ximag)
% phase angle
a = angle(x);
stem(n,a)

% x(n) = e^[j0.5(n-5)], -10:10
n = -10:10;
x = exp(0.5*(n-5)*i);
stem(n,x)

% mangitude
mag = abs(x);
stem(n,mag)
% real part
xreal = real(x);
stem(n,xreal)
% imaginary part
ximag = imag(x);
stem(n,ximag)
% phase angle
a = angle(x);
stem(n,a)

%% assignment adc
adc(20, 200);

