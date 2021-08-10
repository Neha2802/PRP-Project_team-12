function [alpha_post, beta_post, gamma_post, delta_post, x_prediction]...
 = by_norm(x, alpha_prior, beta_prior, gamma_prior, delta_prior, x_test)


 I = length(x);
 alpha_post = alpha_prior + I/2;
 beta_post= sum(x.^2)/2 + beta_prior + (gamma_prior*delta_prior^2)/2 ...
 - (gamma_prior*delta_prior + sum(x))^2 / (2*(gamma_prior + I));
 gamma_post = gamma_prior + I;
 delta_post = (gamma_prior*delta_prior + sum(x)) / (gamma_prior + I);

 
 alpha_int = alpha_post + 0.5;
 beta_int= (x_test.^2)/2 + beta_post + (gamma_post*delta_post^2)/2 - ...
 (gamma_post*delta_post + x_test).^2 / (2*gamma_post + 2);
 gamma_int = gamma_post + 1;

 temp1 = sqrt(gamma_post) * (beta_post^alpha_post) * gamma(alpha_int);
 x_prediction_up = repmat(temp1, 1, length(x_test));
 x_prediction_down = sqrt(2*pi) * sqrt(gamma_int) * gamma(alpha_post)...
 * beta_int.^alpha_int;
 x_prediction = x_prediction_up ./ x_prediction_down;

end
