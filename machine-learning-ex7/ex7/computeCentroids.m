function [centroids, c1, c2, c3, x1, x2, x3] = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
c1 = 0; c2 = 0; c3 = 0;

% for i = 1:300,
%   if(idx(i) == 1)
%   c1 += 1;
%   x1(c1, :) = X(i, :);
%   elseif(idx(i) == 2)
%   c2 += 1;
%   x2(c2, :) = X(i, :);
% else
%   c3 += 1;
%   x3(c3, :) = X(i, :);   
% 	endif
% end
% endfor
% centroids = [mean(x1) ; mean(x2) ; mean(x3)];
 for k=1:K,
	centroids(k, :) = mean(X(idx==k, :));
endfor







% =============================================================


end

