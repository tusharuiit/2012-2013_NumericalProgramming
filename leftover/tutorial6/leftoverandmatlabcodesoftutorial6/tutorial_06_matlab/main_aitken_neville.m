% Numerical Programming I (for CSE), WT 2012/13
% tutorial 6
%
% -- interpolation --
%
% author: schraufstetter

function main_aitken_neville
%
% tests interpolation with scheme of Aitken and Neville
%

clear all
close all
clc

% e.g. interpolating the function sin(x*pi/2):
f = inline('sin(pi*x/2)','x');

% support points
x = [0 1 2 1/3];
y = f(x); % = [0 1 0 1/2];

% for plotting, do Aitken-Neville for many points
% (usually, use Newton's Scheme for evaluating at many points!)
xp = [0:0.1:2];
for k=1:length(xp)
yp(k) = interp_aitken_neville(xp(k),x,y);
end
plot(xp,yp, xp, f(xp),x,y,'r*')


% exercise 1
clc
x = [-2 -1 0 1];
y = [-7 0 1 2];
xp = 2;
yp = interp_aitken_neville(xp,x,y)





