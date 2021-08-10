function y=caluclate_pdf(x,mean,std)

   var= power(std,2);
   y=1/sqrt(2*pi*var)*exp((-0.5*power((x-mean),2))/var);

end
