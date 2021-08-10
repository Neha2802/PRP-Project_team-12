clear all
close all

    org_mu = 5;
    org_std = 8;
    
    r = org_mu + org_std.*randn(100,1);            % Generating 100 random nums
    [est_mu, est_std] = mu_std(r);                 % around the mean    
 
    mu_Error = abs(org_mu - est_mu);
    est_std = sqrt(est_std);
 
    std_Error = abs(org_std - est_std);
    x = -20:0.01:30;
 
    est = zeros(1,length(x));
    org = zeros(1,length(x));

% Ploting original vs estimate
   for nn=1:length(x)
        org(nn)=caluclate_pdf(x(nn),org_mu,org_std);
        est(nn)=caluclate_pdf(x(nn),est_mu,est_std);
    end

    plot(x, org, 'g', x, est, 'b');
    legend('original','estimate')
    xlabel('X')
