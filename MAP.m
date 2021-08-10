clear all
close all

    org_mu = 5;
    org_sig = 8;

    r = org_mu + org_sig .* randn(100,1);

    [est_mu, est_var] = map_norm(r, 1, 1, 1, 0);     % alpha = 1,beta = 1, gamma = 1, delta = 0
    est_sig = sqrt(est_var);

    [mle_mu, mle_var] = mu_std(r);
    mle_sig = sqrt(mle_var);

    sigError = abs(org_sig - est_sig);
    muError = abs(org_mu - est_mu);
    
    x = -20:0.01:30;
    est = caluclate_pdf(x, est_mu, est_sig);
    org = caluclate_pdf(x, org_mu, org_sig);
    mle = caluclate_pdf(x, mle_mu, mle_sig);
    plot(x, org, 'g', x, est, 'b', x, mle, 'r');
    legend('original','MAP estimate','ML estimate')
    xlabel('X')
    axis([-20,30,0,0.1]);
