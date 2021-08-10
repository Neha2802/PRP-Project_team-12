function [mu, var] = map_norm (x, alpha, beta, gamma, delta)
  
    I = length(x);
    mu = (sum(x) + gamma*delta) / (I + gamma);
    var_up = sum((x - mu) .^ 2) + 2*beta + gamma*(delta-mu)^2;
    var_down = I + 3 + 2*alpha;
    var = var_up / var_down; 

end
