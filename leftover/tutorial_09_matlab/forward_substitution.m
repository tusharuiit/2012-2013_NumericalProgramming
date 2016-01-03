% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization) --
%
% author: schraufstetter



function y = forward_substitution(L,b)
%
% forward substitution
%
% L: lower triangular matrix
% b: rhs vector
%
% y: solution of Ly=b
%

n = length(b);

y=b;
for i=1:n
   y(i)=y(i)-L(i,1:i-1)*y(1:i-1); 
end

%% long version:
%
% for i=1:n
%    y(i)=b(i);
%    for j=1:i-1 
%        y(i)=y(i)-L(i,j)*y(j); 
%    end
% end


return