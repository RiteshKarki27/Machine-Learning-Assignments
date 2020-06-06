function [C, sigma_1, err] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
iter1 = 1;
iter2 = 1;
c = 1;
C = [ 0.01 0.03 0.1 0.3 1 3 10 30];
sigma = [ 0.01 0.03 0.1 0.3 1 3 10 30];
err = zeros(1,64);
for iter1 = 1:length(C),
  for iter2 = 1:length(sigma),
    C_temp = C(iter1);
    sigma_temp = sigma(iter2);
    model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));
    predictions = svmPredict(model, Xval);
    err(1, c) = mean(double(predictions ~= yval));
    fprintf('C after iteration is %f\n', c);
    c = c + 1;
  endfor
endfor
% =========================================================================
E = min(err);
fprintf('E:%f', E);
indx = find(err == E);
if (rem(indx, 8) == 0),
  i_1 = floor(indx / 8);
  i_2 = 8;
else,
  i_1 = floor(indx / 8) + 1;
  i_2 = rem(indx,8);
endif
C_1 = C(1, i_1);
C = C_1(1);
sigma_1 = sigma(i_2);
end
