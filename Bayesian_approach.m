clear
close all

    org_std = 8;
    org_mu = 5;

    r = org_mu + org_std.*randn(100,1);

    x_test = -20:0.01:30;
    [alpha_post, beta_post, gamma_post, delta_post, x_prediction] = x_prediction(r, 1, 1, 1, 0, x_test);


    [map_mu, map_var] = map_norm(r, 1, 1, 1, 0);
    map_sig = sqrt(map_var);

    original=zeros(1,length(x_test));
    map = zeros(1,length(x_test));
    for nn=1:length(x_test)
        original (nn)= caluclate_pdf(x_test(nn), org_mu, org_std);
        map(nn) = caluclate_pdf(x_test(nn), map_mu, map_sig);
    end

%plot(x_test, original, 'g', x_test, map, 'b', x_test, x_prediction, 'r');
    semilogy(x_test, original, 'g', x_test, map, 'b', x_test, x_prediction, 'r');
    xlabel('x');
    ylabel('log (P(x))');
    legend('Original', 'MAP', 'Bayesian');
    axis([-20,30,0,0.1]);
    set(gca,'XTick',[],'YTick',[]);
