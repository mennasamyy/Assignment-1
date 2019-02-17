clc
clear All
p=length(target3);
alpha=0.01;
Y=target3(1:151,:);
YCV=target3(152:202,:);
YT=target3(203:250,:);

features=[ones(p,1),age3,sex3,cp3,trestbps3,chol3,fbs3,restecg3,thalach3,exang3,oldpeak3,slope3,ca3,thal3];

H2=[age3(1:151,:).^10,age3(1:151,:),sex3(1:151,:).^10,cp3(1:151,:).^10,trestbps3(1:151,:).^10,chol3(1:151,:).^10,fbs3(1:151,:).^10,restecg3(1:151,:).^10];
H2P2=[age3(1:151,:).^2,age3(1:151,:),sex3(1:151,:).^2,cp3(1:151,:).^2,trestbps3(1:151,:).^2,chol3(1:151,:).^2,fbs3(1:151,:).^2,restecg3(1:151,:).^2];
H2P5=[age3(1:151,:).^5,age3(1:151,:),sex3(1:151,:).^5,cp3(1:151,:).^5,trestbps3(1:151,:).^5,chol3(1:151,:).^5,fbs3(1:151,:).^5,restecg3(1:151,:).^5];

features2=[ones(151,1),age3(1:151,:),sex3(1:151,:),cp3(1:151,:),trestbps3(1:151,:),chol3(1:151,:),fbs3(1:151,:),restecg3(1:151,:),thalach3(1:151,:),exang3(1:151,:),oldpeak3(1:151,:),slope3(1:151,:),ca3(1:151,:),thal3(1:151,:),H2];
features21=[ones(151,1),age3(1:151,:),sex3(1:151,:),cp3(1:151,:),trestbps3(1:151,:),chol3(1:151,:),fbs3(1:151,:),restecg3(1:151,:),thalach3(1:151,:),exang3(1:151,:),oldpeak3(1:151,:),slope3(1:151,:),ca3(1:151,:),thal3(1:151,:),H2P2];
features22=[ones(151,1),age3(1:151,:),sex3(1:151,:),cp3(1:151,:),trestbps3(1:151,:),chol3(1:151,:),fbs3(1:151,:),restecg3(1:151,:),thalach3(1:151,:),exang3(1:151,:),oldpeak3(1:151,:),slope3(1:151,:),ca3(1:151,:),thal3(1:151,:),H2P5];

H20=[age3(152:202,:).^10,sex3(152:202,:).^10,cp3(152:202,:).^10,trestbps3(152:202,:).^10,chol3(152:202,:).^10,fbs3(152:202,:).^10,restecg3(152:202,:).^10];
H22P2=[age3(152:202,:).^2,sex3(152:202,:).^2,cp3(152:202,:).^2,trestbps3(152:202,:).^2,chol3(152:202,:).^2,fbs3(152:202,:).^2,restecg3(152:202,:).^2];
H22P5=[age3(152:202,:).^5,sex3(152:202,:).^5,cp3(152:202,:).^5,trestbps3(152:202,:).^5,chol3(152:202,:).^5,fbs3(152:202,:).^5,restecg3(152:202,:).^5];

features20=[ones(51,1),age3(152:202,:),sex3(152:202,:),cp3(152:202,:),trestbps3(152:202,:),chol3(152:202,:),fbs3(152:202,:),restecg3(152:202,:),thalach3(152:202,:),exang3(152:202,:),oldpeak3(152:202,:),slope3(152:202,:),ca3(152:202,:),thal3(152:202,:),H20];
features211=[ones(51,1),age3(152:202,:),sex3(152:202,:),cp3(152:202,:),trestbps3(152:202,:),chol3(152:202,:),fbs3(152:202,:),restecg3(152:202,:),thalach3(152:202,:),exang3(152:202,:),oldpeak3(152:202,:),slope3(152:202,:),ca3(152:202,:),thal3(152:202,:),H22P2];
features222=[ones(51,1),age3(152:202,:),sex3(152:202,:),cp3(152:202,:),trestbps3(152:202,:),chol3(152:202,:),fbs3(152:202,:),restecg3(152:202,:),thalach3(152:202,:),exang3(152:202,:),oldpeak3(152:202,:),slope3(152:202,:),ca3(152:202,:),thal3(152:202,:),H22P5];


H222P2=[age3(203:250,:).^5,sex3(203:250,:).^5,trestbps3(203:250,:).^5,chol3(203:250,:).^5,fbs3(203:250,:).^5,restecg3(203:250,:).^5,thalach3(203:250,:).^5];
features22220=[ones(48,1),age3(203:250,:),sex3(203:250,:),cp3(203:250,:),trestbps3(203:250,:),chol3(203:250,:),fbs3(203:250,:),restecg3(203:250,:),thalach3(203:250,:),exang3(203:250,:),oldpeak3(203:250,:),slope3(203:250,:),ca3(203:250,:),thal3(203:250,:),H222P2];


H3=[thalach3(1:151,:).^7,exang3(1:151,:).^7,oldpeak3(1:151,:).^7,slope3(1:151,:).^7,ca3(1:151,:).^7,thal3(1:151,:).^7];
H3P3=[thalach3(1:151,:).^3,exang3(1:151,:).^3,oldpeak3(1:151,:).^3,slope3(1:151,:).^3,ca3(1:151,:).^3,thal3(1:151,:).^3];
H3P5=[thalach3(1:151,:).^5,exang3(1:151,:).^5,oldpeak3(1:151,:).^5,slope3(1:151,:).^5,ca3(1:151,:).^5,thal3(1:151,:).^5];

features3=[ones(151,1),age3(1:151,:),sex3(1:151,:),cp3(1:151,:),trestbps3(1:151,:),chol3(1:151,:),fbs3(1:151,:),restecg3(1:151,:),thalach3(1:151,:),exang3(1:151,:),oldpeak3(1:151,:),slope3(1:151,:),ca3(1:151,:),thal3(1:151,:),H3];
features31=[ones(151,1),age3(1:151,:),sex3(1:151,:),cp3(1:151,:),trestbps3(1:151,:),chol3(1:151,:),fbs3(1:151,:),restecg3(1:151,:),thalach3(1:151,:),exang3(1:151,:),oldpeak3(1:151,:),slope3(1:151,:),ca3(1:151,:),thal3(1:151,:),H3P3];
features32=[ones(151,1),age3(1:151,:),sex3(1:151,:),cp3(1:151,:),trestbps3(1:151,:),chol3(1:151,:),fbs3(1:151,:),restecg3(1:151,:),thalach3(1:151,:),exang3(1:151,:),oldpeak3(1:151,:),slope3(1:151,:),ca3(1:151,:),thal3(1:151,:),H3P5];

H30=[thalach3(152:202,:).^7,exang3(152:202,:).^7,oldpeak3(152:202,:).^7,slope3(152:202,:).^7,ca3(152:202,:).^7,thal3(152:202,:).^7];
H33P3=[thalach3(152:202,:).^3,exang3(152:202,:).^3,oldpeak3(152:202,:).^3,slope3(152:202,:).^3,ca3(152:202,:).^3,thal3(152:202,:).^3];
H33P5=[thalach3(152:202,:).^5,exang3(152:202,:).^5,oldpeak3(152:202,:).^5,slope3(152:202,:).^5,ca3(152:202,:).^5,thal3(152:202,:).^5];

features30=[ones(51,1),age3(152:202,:),sex3(152:202,:),cp3(152:202,:),trestbps3(152:202,:),chol3(152:202,:),fbs3(152:202,:),restecg3(152:202,:),thalach3(152:202,:),exang3(152:202,:),oldpeak3(152:202,:),slope3(152:202,:),ca3(152:202,:),thal3(152:202,:),H30];
features311=[ones(51,1),age3(152:202,:),sex3(152:202,:),cp3(152:202,:),trestbps3(152:202,:),chol3(152:202,:),fbs3(152:202,:),restecg3(152:202,:),thalach3(152:202,:),exang3(152:202,:),oldpeak3(152:202,:),slope3(152:202,:),ca3(152:202,:),thal3(152:202,:),H33P3];
features322=[ones(51,1),age3(152:202,:),sex3(152:202,:),cp3(152:202,:),trestbps3(152:202,:),chol3(152:202,:),fbs3(152:202,:),restecg3(152:202,:),thalach3(152:202,:),exang3(152:202,:),oldpeak3(152:202,:),slope3(152:202,:),ca3(152:202,:),thal3(152:202,:),H33P5];

H333=[thalach3(203:250,:).^7,exang3(203:250,:).^7,oldpeak3(203:250,:).^7,slope3(203:250,:).^7,ca3(203:250,:).^7,thal3(203:250,:).^7];
features330=[ones(48,1),age3(203:250,:),sex3(203:250,:),cp3(203:250,:),trestbps3(203:250,:),chol3(203:250,:),fbs3(203:250,:),restecg3(203:250,:),thalach3(203:250,:),exang3(203:250,:),oldpeak3(203:250,:),slope3(203:250,:),ca3(203:250,:),thal3(203:250,:),H333];


n30=length(features30(1,:));
theta30=zeros(n30,1);
for w=2:n30
    if max(abs(features30(:,w)))~=0
     features30(:,w)=(features30(:,w)-mean((features30(:,w))))./std(features30(:,w));
    end
    
end

n330=length(features330(1,:));
theta330=zeros(n330,1);
for w=2:n330
    if max(abs(features330(:,w)))~=0
     features330(:,w)=(features330(:,w)-mean((features330(:,w))))./std(features330(:,w));
    end
    
end


n3=length(features3(1,:));
theta3=zeros(n3,1);
for w=2:n3
    if max(abs(features3(:,w)))~=0
     features3(:,w)=(features3(:,w)-mean((features3(:,w))))./std(features3(:,w));
    end
    
end

Y=Y/mean(Y);
YCV=YCV/mean(YCV);
YT=YT/mean(YT);

J3=costlog(features3, Y, theta3);
[ theta3, J_history3 ] = Gradientdescentmethodnew( features3,Y,theta3,alpha,J3 );

figure()
plot(1:length(J_history3) , J_history3);



n311=length(features311(1,:));
theta311=zeros(n311,1);
for w=2:n311
    if max(abs(features311(:,w)))~=0
     features311(:,w)=(features311(:,w)-mean((features311(:,w))))./std(features311(:,w));
    end
    
end

n31=length(features31(1,:));
theta31=zeros(n31,1);
for w=2:n31
    if max(abs(features31(:,w)))~=0
     features31(:,w)=(features31(:,w)-mean((features31(:,w))))./std(features31(:,w));
    end
    
end

J31=costlog(features31, Y, theta31);
[ theta31, J_history31 ] = Gradientdescentmethodnew( features31,Y,theta31,alpha,J31 );

figure()
plot(1:length(J_history31) , J_history31);



n322=length(features322(1,:));
theta322=zeros(n322,1);
for w=2:n322
    if max(abs(features322(:,w)))~=0
     features322(:,w)=(features322(:,w)-mean((features322(:,w))))./std(features322(:,w));
    end
    
end

n32=length(features32(1,:));
theta32=zeros(n32,1);
for w=2:n32
    if max(abs(features32(:,w)))~=0
     features32(:,w)=(features32(:,w)-mean((features32(:,w))))./std(features32(:,w));
    end
    
end

J32=costlog(features32, Y, theta32);
[ theta32, J_history32 ] = Gradientdescentmethodnew( features32,Y,theta32,alpha,J32 );

figure()
plot(1:length(J_history32) , J_history32);


n2=length(features2(1,:));
theta2=zeros(n2,1);

for w=2:n2
    if max(abs(features2(:,w)))~=0
     features2(:,w)=(features2(:,w)-mean((features2(:,w))))./std(features2(:,w));
    end
    
end

n20=length(features20(1,:));
theta20=zeros(n20,1);

for w=2:n20
    if max(abs(features20(:,w)))~=0
     features20(:,w)=(features20(:,w)-mean((features20(:,w))))./std(features20(:,w));
    end
    
end

Y=Y/mean(Y);

J2=costlog(features2, Y, theta2);
[ theta2, J_history2 ] = Gradientdescentmethodnew( features2,Y,theta2,alpha,J2 );

figure()
plot(1:length(J_history2) , J_history2);


n211=length(features211(1,:));
theta211=zeros(n211,1);

for w=2:n211
    if max(abs(features211(:,w)))~=0
     features211(:,w)=(features211(:,w)-mean((features211(:,w))))./std(features211(:,w));
    end
    
end

n21=length(features21(1,:));
theta21=zeros(n21,1);

for w=2:n21
    if max(abs(features21(:,w)))~=0
     features21(:,w)=(features21(:,w)-mean((features21(:,w))))./std(features21(:,w));
    end
    
end

J21=costlog(features21, Y, theta21);
[ theta21, J_history21 ] = Gradientdescentmethodnew( features21,Y,theta21,alpha,J21);

figure()
plot(1:length(J_history21) , J_history21);


n222=length(features222(1,:));
theta222=zeros(n222,1);

for w=2:n222
    if max(abs(features222(:,w)))~=0
     features222(:,w)=(features222(:,w)-mean((features222(:,w))))./std(features222(:,w));
    end
    
end

n2220=length(features22220(1,:));
theta2220=zeros(n2220,1);

for w=2:n2220
    if max(abs(features22220(:,w)))~=0
     features22220(:,w)=(features22220(:,w)-mean((features22220(:,w))))./std(features22220(:,w));
    end
    
end

n22=length(features22(1,:));
theta22=zeros(n22,1);

for w=2:n22
    if max(abs(features22(:,w)))~=0
     features22(:,w)=(features22(:,w)-mean((features22(:,w))))./std(features22(:,w));
    end
    
end
J22=costlog(features22, Y, theta22);
[ theta22, J_history22 ] = Gradientdescentmethodnew( features22,Y,theta22,alpha,J22 );

figure()
plot(1:length(J_history22) , J_history22);

errorfinal2=costlog( features2,Y,theta2)
errorfinal21=costlog( features21,Y,theta21)
errorfinal22=costlog( features22,Y,theta22)

YCV=YCV/mean(YCV);
errorfinal20=costlog( features20,YCV,theta20)
errorfinal211=costlog( features211,YCV,theta211)
errorfinal222=costlog( features222,YCV,theta222)

YT=YT/mean(YT);
JFINAL2=costlog( features22220,YT,theta2220)
% 60% DATA
errorfinal3=costlog( features3,Y,theta3)
errorfinal31=costlog( features31,Y,theta31)
errorfinal32=costlog( features32,Y,theta32)
%CROSSVALIDATION
YCV=YCV/mean(YCV);

errorfinal30=costlog( features30,YCV,theta30)
errorfinal311=costlog( features311,YCV,theta311)
errorfinal322=costlog( features322,YCV,theta322)

%TESTED
YT=YT/mean(YT);
JFINAL3=costlog( features330,YT,theta330)

