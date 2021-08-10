function [alpha_post, beta_post, gamma_post, delta_post, x_prediction]= x_prediction(x, alpha_prior, beta_prior, gamma_prior, delta_prior, x_test)
    
    p = length(x);
    alpha_post = alpha_prior + p/2;
    beta_post= sum(x.^2)/2 + beta_prior + (gamma_prior*delta_prior^2)/2 - (gamma_prior*delta_prior + sum(x))^2 / (2*(gamma_prior + p));
    gamma_post = gamma_prior + p;
    delta_post = (gamma_prior*delta_prior + sum(x)) / (gamma_prior + p);

    alpha_post1 = alpha_post + 0.5;
    beta_post1= (x_test.^2)/2 + beta_post + (gamma_post*delta_post^2)/2 - (gamma_post*delta_post + x_test).^2 / (2*gamma_post + 2);
    gamma_post1 = gamma_post + 1;

    temp1 = sqrt(gamma_post) * (beta_post^alpha_post) * gamma(alpha_post1);
    x_prediction = (repmat(temp1, 1, length(x_test)))./(sqrt(2*pi) * sqrt(gamma_post1) * gamma(alpha_post)* beta_post1.^alpha_post1);

end
