%MeanSquareError 
function J = costfunction ( features, price, theta )
p=length(price);
H= features*theta;
L=length(theta);
J= 1/(2*p)*sum((H-price).^2)+((0.00000001/(2*p)*sum((theta(2:L,1)).^2)));
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

end

