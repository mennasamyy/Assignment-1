function [ theta, J_history ] = Gradientdescentmethodfinal( features,price,theta,alpha,J)
p=length(price);
k=1;
J_history(k)=J;
R=1;

while R==1

H=features*theta;
theta=theta-(alpha/p)*features'*(H-price);
k=k+1;
J_history(k)=costfunction(features, price, theta);

if J_history(k-1)-J_history(k)<0
    break
end 
q=(J_history(k-1)-J_history(k))./J_history(k-1);
if q <.000001;
    R=0;
end
    %H=features*theta;
    %theta1=theta(1)-alpha*(1/p)*sum(H-price);
    %theta2=theta(2)-alpha*(1/p)*(sum((H-price).*features(:,2)));
    %theta3=theta(3)-alpha*(1/p)*(sum((H-price).*features(:,3)));
    %theta(1)=theta1;
    %theta(2)=theta2;
    %theta(3)=theta3;
    %J_history(i)=costfunction(features,price,theta);


end

