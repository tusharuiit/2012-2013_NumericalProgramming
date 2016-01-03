% Numerical Programming I (for CSE), WT 2012/13
% tutorial 6
%
% -- interpolation (Hermite) --
%
% author: schraufstetter (modified version of Tobias Neckel's code)


function yp = interp_hermite(xi,yi,yprime,xp)
%
% Hermite interpolation
%
% xp:     node to be interpolated (xp in ]x0;xn])
% xi:     support abscissas x0,...,xn (unsorted points are possible)
% yi:     support ordinates y0,...,yn
% yprime: derivatives at support points y'0,...,y'n
%
% yp:     interpolated values yp = p(xp)
%

   if (length(xi) ~= length(yi) || length(xi) ~= length(yprime))
       error('xi and yi must have the same length')
   elseif (length(xi)<2)
       error('xi and yi must have the same length')
   end
   
   % initialization
   t = zeros(1,length(xp));
   y0 = t;
   y1 = t;
   yprime0 = t;
   yprime1 = t;
   
   % loop over all points to be interpolated
   for i = 1:length(xp) 
       
       % find smallest intervall [x(l), x(r)] of support abscissas
       l = max( find(xi <= xp(i)) );
       r = min( find(xi >= xp(i)) );
       
       if (length(l)==0 || length(r)==0)
           error('xp < min(xi) or xp > max(xi)  => no interpolation possible!');
       end

       % find values of x, y and yprime at boundaries of the intervall 
       % and compute intervall width
       xl = xi(l);
       xr = xi(r);
       h = xr - xl;
       
       if(l==r)
           h=1;
       end
       
       y0(i) = yi(l);
       y1(i) = yi(r);     
       
       yprime0(i) = h*yprime(l); % factor h considered here!
       yprime1(i) = h*yprime(r);
       
       
       % find parameter t for transformation [x(l),x(r)] -> [0,1]
       t(i) = (xp(i) - xl)./h;
       
   end
   
   % evaluate Hermite basis at t
   [H0, H1, H2, H3] = HermiteBasis(t);
   
   % compute value of Hermite polynomial at t
   yp = y0.*H0 + y1.*H1 + yprime0.*H2 + yprime1.*H3;
   
return;


%********************************************

function [H0, H1, H2, H3] = HermiteBasis(t)
%
% Subroutine for evaluation of the Hermite basis 
% polynomials H0,...,H3 (vector values possible)
%

H0 = (1 + 2.*t) .* (1 - t).^2;
H1 = (3 - 2.*t) .* (t.^2);
H2 = t .* (1 - t).^2;
H3 = (t - 1) .* (t.^2);
   
return;