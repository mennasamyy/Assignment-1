

clc
clear All
p=length(price);
%iterations=100;
alpha=0.01;
%plot(grade,price, 'rx', 'MarkerSize', 10);

%Best Power 0.0694 linear
features=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15];
% FP4=[ones(p,1), bedrooms.^4, bathrooms.^4, sqft_living.^4, sqft_lot.^4, floors.^4, waterfront.^4, view1.^4, condition.^4, grade.^4, sqft_above.^4, sqft_basement.^4, yr_built.^4, yr_renovated.^4, zipcode.^4, lat.^4, long.^4, sqft_living15.^4, sqft_lot15.^4];
% FP4=[ones(p,1), bedrooms.^8, bathrooms.^8, sqft_living.^8, sqft_lot.^8, floors.^8, waterfront.^8, view1.^8, condition.^8, grade.^8, sqft_above.^8, sqft_basement.^8, yr_built.^8, yr_renovated.^8, zipcode.^8, lat.^8, long.^8, sqft_living15.^8, sqft_lot15.^8];

%Best Power 0.0613 linear by powers 5 and 8 mix
H1=[bedrooms.^5,bathrooms.^5,bedrooms.^8,bathrooms.^8,waterfront.^5,view1.^5,floors.^5,floors.^8,grade.^5,condition.^5,condition.^8];
%Best Power 0.0614 linear by power 5
H2=[bedrooms.^5,bathrooms.^5,floors.^5,waterfront.^5,view1.^5,grade.^5,condition.^5];
%Best Power 0.0625 linear by power 7
H3=[floors.^7,long.^7,grade.^7,yr_renovated.^7,view1.^7,condition.^7];

features1=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H1];
features2=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H2];
features3=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H3];

n3=length(features3(1,:));
theta3=zeros(n3,1);
for w=2:n3
    if max(abs(features3(:,w)))~=0
     features3(:,w)=(features3(:,w)-mean((features3(:,w))))./std(features3(:,w));
    end
    
end

Y=price/mean(price);

J3=costfunction(features3, Y, theta3);
[ theta3, J_history3 ] = Gradientdescentmethodfinal( features3,Y,theta3,alpha,J3 );

figure()
plot(1:length(J_history3) , J_history3);

n2=length(features2(1,:));
theta2=zeros(n2,1);

for w=2:n2
    if max(abs(features2(:,w)))~=0
     features2(:,w)=(features2(:,w)-mean((features2(:,w))))./std(features2(:,w));
    end
    
end

Y=price/mean(price);

J2=costfunction(features2, Y, theta2);
[ theta2, J_history2 ] = Gradientdescentmethodfinal( features2,Y,theta2,alpha,J2 );

figure()
plot(1:length(J_history2) , J_history2);

n1=length(features1(1,:));
theta1=zeros(n1,1);
for w=2:n1
    if max(abs(features1(:,w)))~=0
     features1(:,w)=(features1(:,w)-mean((features1(:,w))))./std(features1(:,w));
    end
    
end

Y=price/mean(price);

J1=costfunction(features1, Y, theta1);
[ theta1, J_history1 ] = Gradientdescentmethodfinal( features1,Y,theta1,alpha,J1 );

figure()
plot(1:length(J_history1) , J_history1);

%Normaltheta=Normalization(features,price);
%Normaltheta

n=length(features(1,:));
theta=zeros(n,1);


for w=2:n
    if max(abs(features(:,w)))~=0
     features(:,w)=(features(:,w)-mean((features(:,w))))./std(features(:,w));
    end
    
end

Y=price/mean(price);

J=costfunction(features, Y, theta);
[ theta, J_history ] = Gradientdescentmethodfinal( features,Y,theta,alpha,J );

theta ;
figure()
plot(1:length(J_history) , J_history);

errorfinal=costfunction( features,Y,theta)
errorfinal1=costfunction( features1,Y,theta1)
errorfinal2=costfunction( features2,Y,theta2)
errorfinal3=costfunction( features3,Y,theta3)

%predictablegp = [1, 1, 2] * theta
%predictablenp = [1, 1, 2] * Normaltheta 


