# PRP-Project_team-12

## Maximum likelyhood
-> In maximum_likelyhood.m we are choosing a mean and variance from this we generate 100 random values from normal distribution with mean value. Then we calucale      estimated mean and variance. And we plot the pdf's of original and estimated models.

## Maximum a posteriori
-> In MAP.m we are again choosing mean and variance and generate 100 random values. And then we calculate mean and variance. Here we are using parametres alpha,beta,gamma,delta as 1,1,1,0 respectively. And the we plot pdf's of MAP and ML estimates and original model.

## Baseyian approach
-> In this we again do repeat the first step as above. Then we predict x using the function x_prediction.m
-> In x_prediction.m function we are first computing posterior parameters and then we calculate intermediate parameters and then we are predicting x from posterior    parameters and intermediate parameters.
-> And finally we plot pdf's of original and Predicted and MAP model.
