%data process
Nmove=1100;
Nbase=30;
Za11=ones(Nmove,2);
computeLocation=ones(Nmove,2);
h = ones(Nbase/2,1);
Ga = ones(Nbase/2,3);
%%
maxTOA=ones(Nmove,Nbase/2);
maxarry =ones(1,Nbase/2);
maxTOAarry=ones(Nmove,1);
 for i=1:1:Nmove
     arry=1;
     SXarry=case026_input(i,:);
     mediaSXarry = median(SXarry);
     for j=1:1:Nbase
         if SXarry(1,j)>mediaSXarry
             maxarry(arry)=j;
             arry=arry+1;
         end
     maxTOA(i,:)=maxarry(1,:);
     [x,maxTOAarry(i,1)]=max(SXarry);
     end
 end
 %%
for n=1:1:Nmove
    Numb=maxTOA(n,:);
    distance=ones(1,Nbase);
    distance(1,:)=case026_input(n,:)*3*10^8;
    for i=1:1:(Nbase/2)
    h(i,1)=baselocation(Numb(i),1)^2+baselocation(Numb(i),2)^2-distance(1,Numb(i))^2;
    Ga(i,1)=2*baselocation(Numb(i),1);
    Ga(i,2)=2*baselocation(Numb(i),2);
    Ga(i,3)=-1;
    end
    Q = cov(h);
    B=diag(distance(Numb));
    L=4*B*Q*B;
    L=L/(10^14);
    Za=(Ga'*inv(L)*Ga)\Ga'*inv(L)*h;
    computeLocation(n,1)=Za(1,1);
    computeLocation(n,2)=Za(2,1);
    %
    Ga1=[0,1;1,0;1,1];
    h1=[Za(1)^2;Za(2)^2;Za(3)];
    N1=[2*Za(1),2*Za(2),1];
    B1=diag(N1);
    L1=B1*cov(Za)*B1;
    Za1=(Ga1'*inv(L1)*Ga1)\Ga1'*inv(L1)*h1;
    if Za(1,1)<0&&Za(2,1)<0
        Za11(n,1)=-sqrt(Za1(1,1));
        Za11(n,2)=-sqrt(Za1(2,1));
    end
    if Za(1,1)<0&&Za(2,1)>0
        Za11(n,1)=-sqrt(Za1(1,1));
        Za11(n,2)=sqrt(Za1(2,1));
    end
    if Za(1,1)>0&&Za(2,1)>0
        Za11(n,1)=sqrt(Za1(1,1));
        Za11(n,2)=sqrt(Za1(2,1));
    end
     if Za(1,1)>0&&Za(2,1)<0
        Za11(n,1)=sqrt(Za1(1,1));
        Za11(n,2)=-sqrt(Za1(2,1));
     end
end
%calculate real distance
realdistance=ones(Nmove,Nbase);
for i=1:1:Nmove
    for j=1:1:Nbase
        realdistance(i,j)=sqrt((Za11(i,1)-baselocation(j,1))^2+(Za11(i,2)-baselocation(j,2))^2);
    end
end