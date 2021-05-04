% cross correlation
x = [1 2 4 0];  % always takes 1st point as n=0
y = [1 1 1 1];
xcorr(x,y)

% autocorrelation
x = [1 2 1 1];
xcorr(x)

% convolution
n = -10:50;
x = stepseq(0,-10,50) - stepseq(10,-10,50);
stem(n,x)
h = ((0.9).^n).*(stepseq(0,-10,50));
figure(2);
stem(n,h)
m = -10:0.5:50; % convolution doubles the number of points
y = conv(x, h);
figure(3);
stem(m,y)

%% assignment: median and moving average
x = [1 2 3 4 5 6 7];    
[median, mov_agv] = med_avg(x, 3) % 3-point moving average

x = [2 4 6 8 6 4];  % even number of points
[median, mov_agv] = med_avg(x, 3) % 3-point moving average