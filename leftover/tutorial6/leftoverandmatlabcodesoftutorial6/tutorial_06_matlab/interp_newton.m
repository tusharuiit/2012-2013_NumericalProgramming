% Numerical Programming I (for CSE), WT 2012/13
% tutorial 6
%
% -- interpolation (Newton) --
%
% author: schraufstetter

function c = interp_newton(x,y)
%
% Newton's interpolation formula (polynomial interpolation)
%
% x: support abscissas
% y: support ordinates
%
% c: coefficients of Newton's interpolant
%

if (length(x) ~= length(y))
    error('x and y must have the same length')
end

n = length(x)-1;

c=y;    
for k=1:n
    for i=n+1:-1:k+1
        c(i) = ( c(i)-c(i-1) )/( x(i)-x(i-k) );
    end
end

return;