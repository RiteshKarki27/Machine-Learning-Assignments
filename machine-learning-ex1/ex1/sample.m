function J = sample(X, y, theta)
m = length(y);
H = X * theta;
Y = sum((H-y).^2)
J = Y / (2*m);
end