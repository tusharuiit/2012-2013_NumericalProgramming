% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (Cholesky factorization) --
%
% author: schraufstetter



function L = cholesky_factorization(A)
%
% Cholesky factorization
%
% A: matrix to be decomposed
% 
% L: lower triangular matrix of Cholesky factorization
%

n = size(A,1);


% with for-loops:

% for k=1:n
%     L(k,k)=A(k,k);
%     for j=1:k-1
%         L(k,k)=L(k,k)-L(k,j)^2;
%     end
%     L(k,k) = sqrt(L(k,k));
%     for i=k+1:n
%         L(i,k)=A(i,k);
%         for j=1:k-1
%             L(i,k) = L(i,k)-L(i,j)*L(k,j);
%         end
%         L(i,k)=L(i,k)/L(k,k);
%     end
% end


% in matrix-vector-notation:

L=zeros(size(A));
for k=1:n
    L(k,k)=sqrt(A(k,k)-L(k,1:k-1)*L(k,1:k-1)');
    L(k+1:n,k) = (A(k+1:n,k)-L(k+1:n,1:k-1)*L(k,1:k-1)')./L(k,k);
end
   


return