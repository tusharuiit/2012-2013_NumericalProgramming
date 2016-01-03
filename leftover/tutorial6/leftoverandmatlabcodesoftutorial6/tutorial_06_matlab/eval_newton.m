% Numerical Programming I (for CSE), WT 2012/13
% tutorial 6
%
% -- interpolation --
%
% author: schraufstetter

function yp = eval_newton(c,x,xp)
%
% evaluation of a polynomial interpolant (with Horner scheme)
%
% c: coefficients of the polynomial interpolant
% x: support abscissas
% xp: nodes to be interpolated
%
% yp: interpolated values
%

if (length(x) ~= length(c))
    error('c and x must have the same length')
end


n = length(c);
m=length(xp);

yp(1:m)=c(n);


for i=n-1:-1:1
    yp = yp.*(xp-x(i)) + c(i);
end

return;