function [mu, var] = mu_std(x)
    
    I = length(x);
    mu = sum(x) / I;
    var = sum((x - mu) .^ 2) / I;

end
