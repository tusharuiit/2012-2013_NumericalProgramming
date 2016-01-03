% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization) --
%
% author: schraufstetter



function [L,U] = lu_factorization(A)
%
% LU factorization (not optimized)
%
% A: matrix to be decomposed
% 
% L: lower triangular matrix
% U: upper triangular matrix
%


% initialization
n = size(A,1);
L = eye(n);
U = zeros(n,n);


for i=1:n
   for k=1:i-1
      L(i,k)=A(i,k);
      for j=1:k-1 
          L(i,k)=L(i,k)-L(i,j)*U(j,k); 
      end
      L(i,k)=L(i,k)/U(k,k);
  end
  for k=i:n
      U(i,k)=A(i,k);
      for j=1:i-1 
          U(i,k)=U(i,k)-L(i,j)*U(j,k); 
      end
  end
end

return