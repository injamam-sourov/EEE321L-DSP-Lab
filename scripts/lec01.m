% generating sinusoidal signal
x = -2*pi:0.01:2*pi;    % specify domain 
y = 20*sin(x+pi/4);     % leading waveform
z = 20*sin(x-pi/4);     % lagging waveform
plot(x,y)               % plot of y wrt x
plot(x,z)               % plot of y wrt x
plot(x,y,x,z)           % plot both in same graph
grid                    % toggles grid

% exponential signal
expo = 10*exp(x);       % exponetial function
plot(x, expo)

% complex variable (i)
a = 3+4i;
b = 3-8i;
c = a+b

% combination of signals
x = 0:0.01:10;
comb = 10*exp(-x) + cos(x);
plot(x, comb)

% square wave
x = 0:0.01:10;
y = 5*square(x);
plot(x,y)

% random signal
rand(4)         % random 0 to 1
randn(4)        % negative included
rand(1,5)       % 1 row, 5 col, 0 to 1

% clear window
clc             % clears window, doesn't remove variables/commands

% periodic signal
t = 0:0.01:2*pi;
x = 2*sin(t);
plot(t,x)

% subplots
x = -2*pi:0.01:2*pi;
y = 20*sin(x+pi/4);
z = 20*sin(x-pi/4);
% side by side (1 row, 2 col)
figure(1)           % open figure window
subplot(1,2,1)      % (row, col, handle)
plot(x,y)
subplot(1,2,2)
plot(x,z)
% one above other (2 row, 1 col)
figure(2)           % open figure window
subplot(2,1,1)      % (row, col, handle)
plot(x,y)
subplot(2,1,2)
plot(x,z)

% functions (see definition in script saved as function name)
% to check if function is accesnible: edit functionName
% make sure command window path is same as script folder

addition(5,10)      % test function, returns 15

% assignment: create a function for factorial
factorial2(0)
factorial2(1)
factorial2(5)