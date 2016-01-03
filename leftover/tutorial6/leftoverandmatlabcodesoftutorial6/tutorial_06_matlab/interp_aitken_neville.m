% Numerical Programming I (for CSE), WT 2012/13
% tutorial 6
%
% -- interpolation (Aitken/Neville) --
%
% author: schraufstetter

function yp = interp_aitken_neville(xp,x,y)
%
% interpolation with scheme of Aitken and Neville
%
% xp: node to be interpolated
% x:  support abscissas
% y:  support ordinates
%
% yp: interpolated value
%

if (length(x) ~= length(y))
    error('x and y must have the same length')
end

n = length(x);

p=y;

disp(p)

for k=1:n
    %p(1:n+1-k) % just for output of the values of the scheme of Aitken and Neville
    
    for i=1:n-k
        p(i) = p(i) + (xp - x(i))/(x(i+k)-x(i)) * (p(i+1) - p(i));
    end   
    disp(p(1:(n-k)))
end

yp = p(1);

return;