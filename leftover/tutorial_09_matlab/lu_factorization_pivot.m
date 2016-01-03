% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization, loop-/storage-optimized, pivoting) --
%
% author: schraufstetter



function A = lu_factorization_pivot(A)
%
% lu_factorization (storage-/loop-optimized + pivoting)
%
% A: matrix to be decomposed
% 

n = size(A,1);


for k=1:n-1
    % partial pivoting
    [a_max,idx]=max(abs(A(k:n,k)));
    if(idx(1) ~= k && a_max(1) > abs(A(k,k)))
        pivot = k-1+idx(1);
        tmp = A(k,:);
        A(k,:) = A(pivot,:);
        A(pivot,:) = tmp;
        %fprintf('pivoting: %d and %d exchanged \n',k,pivot)
    end
   
    % LU factorization
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
end

return
