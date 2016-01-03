% Numerical Programming I (for CSE), WT 2012/13
% tutorial 6
%
% -- interpolation --
%
% author: schraufstetter

function main_interpolation
%
% compares:
% 1. polynomial interpolation (Newton's interpolation formula)
%    a) equidistant nodes
%    b) Chebysheff nodes
% 2. Hermite interpolation
%

clear all
close all
clc



% support points
% ==============

% define interval [a,b] and number (n+1) of support points
%a=0; b=1; n=5;
%a=0; b=2; n=20;
a = -5; b = 5; n=20;

% intervall [a,b] with high resolution (for evaluation of interpolation)
x0 = [a:1e-3:b];
y0 = func(x0);

% support points 1 (equidistant)
x1 = [a:(b-a)/n:b];
y1 = func(x1);

% support points 2 (Chebyshev)
idx=0:n;
x2 = a + (b-a)/2 * (1 + cos( (2*idx+1)/(2*(n+1))*pi ) );
y2 = func(x2);

% plot support points
subplot(2,1,1)
plot(x0,y0,'k',x1,y1,'r+',x2,y2,'bx')
title('function with support points')
subplot(2,1,2)
plot(x1,ones(size(x1)),'r+',x2,2*ones(size(x2)),'bx');
title('support abscissas')
axis([a b 0 3.5])
legend('equidistant','Chebyshev')


input('go on with Newton''s interpolation?')


% Newton's interpolation formula
% ==============================

% interpolation 1 (equidistant support points)
c1 = interp_newton(x1,y1);
yp1 = eval_newton(c1,x1,x0);

% interpolation 2 (Chebyshev support points)
c2 = interp_newton(x2,y2);
yp2 = eval_newton(c2,x2,x0);


% Hermitian interpolation
% =======================

dy1 = dfunc(x1);
yp1H = interp_hermite(x1,y1,dy1,x0);



% visualization
% =============

% plot results and interpolation errors
figure

subplot(2,3,1)
plot(x0,y0,'k',x0,yp1,'r-',x1,y1,'r.') % function, polynomial interpolant and support points
title('polynomial interpolation 1 (equidistant)')
axis([a b 0.2 1])

subplot(2,3,2)
plot(x0,y0,'k',x0,yp2,'b-',x2,y2,'b.') % function, polynomial interpolant and support points
title('polynomial interpolation 2 (Chebyshev)')

subplot(2,3,3)
plot(x0,y0,'k',x0,yp1H,'g-',x1,y1,'g.')
title('Hermitian interpolation')

subplot(2,3,4)
plot(x0,abs(yp1-y0),'r-')
title('error 1 (polynomial, equidistant)')

subplot(2,3,5)
plot(x0,abs(yp2-y0),'b-')
title('error (polynomial, Chebyshev)')

subplot(2,3,6)
plot(x0,abs(yp1H-y0),'g-')  
title('error (Hermitian)')

return








% define the function to be interpolated
function y = func(x)

% Runge function
y=1./(1+x.^2);

% cosine function
%y=cos(pi*x);

return;


function y = dfunc(x)

% derivative of Runge function
y=-2.*x./(1+x.^2).^2;

% derivative of cosine function
%y=-pi*sin(pi*x);

return;