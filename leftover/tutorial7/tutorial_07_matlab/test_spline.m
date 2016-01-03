% Numerical Programming I (for CSE), WT 2012/13
% tutorial 7
%
% -- interpolation test (cubic spline) --
%
% author: schraufstetter


function yp = test_spline(xi,yi,xp)

clear all 
close all
clc


x=[-2 0 1 2];
y=[2 0 2 3];

ya=3;
yb=0;

plot(x,y,'ko')
hold on



% spline interpolation with MATLAB
xp=linspace(min(x), max(x),3000);
yp= spline(x,[ya y yb],xp);
% alternatively:
%yp= interp1(x,y,xp,'spline');

plot(xp,yp,'b');

% alternatively:
%cs = spline(x,[ya y yb]);
%plot(xp,ppval(cs,xp),'b-');


% piecewise evaluation of 'our' spline interpolant
t = linspace(0,1,1000);
xp0 = x(1) + t*(x(2)-x(1));
xp1 = x(2) + t*(x(3)-x(2));
xp2 = x(3) + t*(x(4)-x(3));

yp0 = p(t,0);
yp1 = p(t,1);
yp2 = p(t,2);

hold on
plot(xp0,yp0,'r--',xp1,yp1,'r--',xp2,yp2,'r--');
legend('support points','spline interpolation of MATLAB','''our'' spline')



return;



%*********************************************


function y = p(t,i)
%
% subroutine for evaluation 'our' spline interpolant
%


[H0, H1, H2, H3] = HermiteBasis(t);

switch i
    case 0
     c = [2 0 6 6/11];
    case 1
     c = [0 2 3/11 24/11];
    case 2
     c = [2 3 24/11 0]; 
    otherwise
     error('c not in {0,1,2}!!')
end

y = c(1)*H0 + c(2)*H1 + c(3)*H2 + c(4)*H3;

return;




%*********************************************

function [H0, H1, H2, H3] = HermiteBasis(t)
%
% Subroutine for evaluation of the Hermite basis 
%

H0 = (1 + 2.*t) .* (1 - t).^2;
H1 = (3 - 2.*t) .* (t.^2);
H2 = t .* (1 - t).^2;
H3 = (t - 1) .* (t.^2);
   
return;