function J = costlog(features,target,theta)
s=length(features);
h=1./(1+exp(-(features*theta)));
J=(-1/m)*sum((target.*log(h))+(ones(s,1)-target).*log(h));
end