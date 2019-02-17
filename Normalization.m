function [ Normaltheta ] = Normalization( features,price )
Normaltheta=(((features.')*features)^(-1))*((features.')*price);
end

