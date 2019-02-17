function [ theta, J_history ] = Gradientdescentmethodnew( features,target,theta,alpha,J)
p=length(target);
k=1;
J_history(k)=J;
R=1;

while R==1

H=1./(1+exp(-(features*theta)));
theta=theta-(alpha/p)*features'*(H-target);
k=k+1;
J_history(k)=costlog(features, target, theta);

if J_history(k-1)-J_history(k)<0
    break
end 
q=(J_history(k-1)-J_history(k))./J_history(k-1);
if q <.000001;
    R=0;
end
  

end

