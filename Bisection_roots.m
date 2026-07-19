function [xr] = Bisection_roots(func, xL, xU) 
    %
    % calculate the value of the function at xL and xU
    fL = func(xL);
    fU = func(xU);
%   use bisection to find root xr
    xr = xU;
    xr_old = xU;
    iter = 0;
    fprintf('iter    xr      err \n')
    %
    while (1)
        iter = iter + 1;
      xr = (xL + xU)/2;  % bisection
     %
     fr = func(xr);      % value of the function
     %
    % check the convergence of iteration
    err = abs((xr - xr_old)/xr);    % relative error between each iteration
    %  
    if err < 1e-6 || iter > 10, break, end
    %
    xr_old = xr;    % save the new root for comparison
    %
    % new bracket setting
    if fL*fr > 0
        xL = xr;
        fL = fr;
    else
        xU = xr;
        fU = fr;
    end
    fprintf('%5d %9.2f %9.6f \n',iter,xr,err)
        
        
    % end of while loop
    end
    %
end