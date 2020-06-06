function J = computeCost(X, y, theta)
m = length(y);
H = X * theta;
J = (sum((H-y).^2))/(2*m);
end