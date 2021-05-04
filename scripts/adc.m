% doesnt work as expected (check x-axis)
function [] = adc(f, fs)
p = 1/f;
t = 0:p/100:p;
x = sin(2*pi*f*t);
figure;
subplot(2,1,1);
plot(t,x)
ts = 1/fs;
n = t./ts;
subplot(2,1,2);
stem(n,x)
end
