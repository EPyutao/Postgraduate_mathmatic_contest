%%chan algorithm
Nbase=30;
h = ones(Nbase,1);
Ga = ones(Nbase,4);
Ncase=1;
for i=1:1:Nbase
    h(i,1)=baselocation(i,1)^2+baselocation(i,2)^2+baselocation(i,3)^2-distance(Ncase,i)^2;
    Ga(i,1)=2*baselocation(i,1);
    Ga(i,2)=2*baselocation(i,2);
    Ga(i,3)=2*baselocation(i,3);
    Ga(i,4)=-1;
end
Q = cov(h);
B=diag(distance(Ncase,:));
L=4*B*Q*B;
Za=inv(Ga'*inv(L)*Ga)*Ga'*inv(L)*h;
%%
Ga1=[1,0,0;0,1,0;0,0,1;1,1,1];
h1=[Za(1)^2;Za(2)^2;Za(3)^2;Za(4)^2];
N1=[Za(1),Za(2),Za(3),0.5];
B1=diag(N1);
L1=4*B1*cov(Za)*B1;
Za1=inv(Ga1'*inv(L1)*Ga1)*Ga1'*inv(L1)*h1;
Za11=sqrt(Za1);