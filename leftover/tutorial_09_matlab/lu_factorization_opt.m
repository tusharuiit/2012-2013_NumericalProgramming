% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization, loop-/storage-optimized) --
%
% author: schraufstetter



function A = lu_factorization_opt(A)
%
% LU factorization (storage-/loop-optimized)
%
% A: matrix to be decomposed
% 

n = size(A,1);

%
%% with for-loops:
%
% for k=1:n
%     for i=k+1:n
%         A(i,k)=A(i,k)/A(k,k);
%         for j=k+1:n
%             A(i,j) = A(i,j)-A(i,k)*A(k,j);
%         end
%     end
% end


% in matrix-vector-notation:

for k=1:n-1
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
end


return