Nmove=1300;
Nbase=50;
computeLocation=ones(Nmove,3);
%%
maxTOA=ones(Nmove,Nbase/2);
maxarry =ones(1,Nbase/2);
maxTOAarry=ones(Nmove,1);
 for i=1:1:Nmove
     arry=1;
     SXarry=case001_input(i,:);
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
h = ones(Nbase/2,1);
Ga = ones(Nbase/2,4);
for n=1:1:Nmove
    Numb=maxTOA(n,:);
    distance=ones(1,Nbase);
    distance(1,:)=case001_input(n,:)*3*10^8*0.839;
    for i=1:1:(Nbase/2)
    h(i,1)=baselocation(Numb(i),1)^2+baselocation(Numb(i),2)^2+baselocation(Numb(i),3)^2-distance(1,Numb(i))^2;
    Ga(i,1)=2*baselocation(Numb(i),1);
    Ga(i,2)=2*baselocation(Numb(i),2);
    Ga(i,3)=2*baselocation(Numb(i),3);
    Ga(i,4)=-1;
    end
    Q = cov(h);
    B=diag(distance(Numb));
    L=4*B*Q*B;
    L=L/(10^14);
    Za=(Ga'*inv(L)*Ga)\Ga'*inv(L)*h;
    %
    Ga1=[1,0,0;0,1,0;0,0,1;1,1,1];
    h1=[Za(1)^2;Za(2)^2;Za(3)^2;Za(4)^2];
    N1=[Za(1),Za(2),Za(3),0.5];
    B1=diag(N1);
    L1=4*B1*cov(Za)*B1;
    Za1=(Ga1'*inv(L1)*Ga1)\Ga1'*inv(L1)*h1;
    Za11=sqrt(Za1);
    %compute Z
    z = -sqrt((case001_input(n,maxTOAarry(n,1))*3*10^8)^2-(Za(1,1)-baselocation(maxTOAarry(n,1),1))^2-(Za(2,1)-baselocation(maxTOAarry(n,1),2))^2)+baselocation(maxTOAarry(n,1),3);
    computeLocation(n,1)=Za(1,1);
    computeLocation(n,2)=Za(2,1);
    computeLocation(n,3)=z;
end