% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization) --
%
% author: schraufstetter



function x = backward_substitution(U,y)
%
% backward substitution
%
% U: upper triangular matrix
% y: solution of Ly=b
%
% x: solution of Rx=y <=> Ax=b
%

n = length(y);

x=y;
for i=n:-1:1
   x(i)=x(i)-U(i,i+1:n)*x(i+1:n); 
   x(i)=x(i)/U(i,i);
end

%% long version:
%
% for i=n:-1:1
%    x(i)=y(i);
%    for j=i+1:n 
%        x(i)=x(i)-U(i,j)*x(j); 
%    end
%    x(i)=x(i)/U(i,i);
% end

return