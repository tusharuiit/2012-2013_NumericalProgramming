% Numerical Programming I (for CSE), WT 2012/13
% tutorial 09
%
% -- direct solving of SLE (LU factorization) --
%
% author: schraufstetter

function main_lse(ex)

clc

fprintf('ex %s:\n',ex)


switch(ex)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case '1d'  

    A = [ 4 2 3; ...
          2 2 1; ...
          2 2 2]

    b = [2 1 2]'

    [L,U] = lu_factorization(A)
    y = forward_substitution(L,b);
    x = backward_substitution(U,y)


    disp('and ''in situ'':')

    A = lu_factorization_in_situ(A)
    y = forward_substitution(A,b);
    x = backward_substitution(A,y)



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case '1e'

    disp('loop-optimized version (in situ!):')

    A = [ 4 2 3; ...
          2 2 1; ...
          2 2 2];

    b = [2 1 2]';

    A = lu_factorization_opt(A)
    y = forward_substitution(A,b);
    x = backward_substitution(A,y)



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case '1f'

    disp('measurement of execution time:')

    n = [5 50 100 500];

    for k=1:length(n)    
        m=n(k);
        A = ones(m,m)+3*eye(m);

        fprintf('n = %3d  --  non-opt:   ',n(k))
        tic
        A2 = lu_factorization_in_situ(A);
        toc

        fprintf('             opt:       ')
        tic
        A2 = lu_factorization_opt(A);
        toc
    end
    
    
    input('solve more efficiently?')
    
    for k=1:length(n)        
        m=n(k);
        A = ones(m,m)+3*eye(m);

        fprintf('n = %3d  --  cholesky:  ',n(k))
        tic
        A2 = cholesky_factorization(A);
        toc
    end

    

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case '1g'
        
        disp('quality of solution:')

    n = [4 6 8 10 12 20];
    fprintf(' n       error        residual \n')
    
    for k=1:length(n)    
        m=n(k);
        H = hilb(m);
        b=ones(m,1);

        [L,U] = lu_factorization(H);
        y = forward_substitution(L,b);
        x = backward_substitution(U,y);
        
        x_exact = invhilb(m)*b;
        x2 = norm(abs(x-x_exact));
        res=norm(b-H*x);
        
        fprintf('%2d   %e   %e \n', m, x2, res)
    end
    
    fprintf('\n')
    input('go on?')
    fprintf('\n')
    fprintf(' n      cond(H) \n')
    
    for k=1:length(n)    
        m=n(k);
        H = hilb(m);
                
        fprintf('%2d   %e \n', m, cond(H))
    end
    
    
        
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case{'2b','2c','2','2bc'}
        
        A = [-1e-3 1; ...
              2    1]

        b = [1 0]'
        
        disp('***** without pivoting *****')
        
        [L,U] = lu_factorization(A)

        fprintf('cond(A) = %e,   cond(L) = %e,   cond(U) = %e \n \n \n',cond(A), cond(L), cond(U))
        
        
        disp('***** with pivoting *****')

        A2 = lu_factorization_pivot(A)

        % splitting into L and U
        L=tril(A2,-1)+eye(size(A2))
        U=triu(A2)
        fprintf('cond(A) = %e,   cond(L) = %e,   cond(U) = %e \n',cond(A), cond(L), cond(U))

 
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case '3a'        
        
        A = hilb(3);
        L = cholesky_factorization(A)
        
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case '3b'        
        
        A = hilb(3);
        
        disp('Cholesky factorization:')
        L_chol = cholesky_factorization(A)
        
        disp('L, U derived from Cholesky factorization:')
        L = L_chol * diag(1./diag(L_chol))
        U = diag(diag(L_chol)) * L_chol'
        
        disp('LU factorization:')
        [L,U] = lu_factorization(A)
        

end

return



