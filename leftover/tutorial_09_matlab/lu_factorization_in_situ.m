% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization, in situ) --
%
% author: schraufstetter



function A = lu_factorization_in_situ(A)
%
% LU factorization (storage-efficient: L, U stored in A in situ)
%
% A: matrix to be decomposed
% 



% initialization
n = size(A,1);

for i=1:n
   for k=1:i-1
      for j=1:k-1 
          A(i,k)=A(i,k)-A(i,j)*A(j,k); 
      end
      A(i,k)=A(i,k)/A(k,k);
  end
   for k=i:n
      for j=1:i-1 
          A(i,k)=A(i,k)-A(i,j)*A(j,k); 
      end
  end
end

return