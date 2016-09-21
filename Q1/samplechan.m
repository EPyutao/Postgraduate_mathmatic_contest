%%chan algorithm
Nbase=30;
h = ones(Nbase,1);
Ga = ones(Nbase,4);
m3distance = case001_input(3,:)*3*10^8*0.715;
m1distance = case001_input(1,:)*3*10^8*0.715;
Numb=[1:30];
%Numb=[2,3,7,9,10,12,15,16,17,18,19,23,24,26,28];
for i=1:1:Nbase
    h(i,1)=baselocation(Numb(i),1)^2+baselocation(Numb(i),2)^2+baselocation(Numb(i),3)^2-m3distance(1,Numb(i))^2;
    Ga(i,1)=2*baselocation(Numb(i),1);
    Ga(i,2)=2*baselocation(Numb(i),2);
    Ga(i,3)=2*baselocation(Numb(i),3);
    Ga(i,4)=-1;
end
Q = cov(h);
B=diag(m3distance(Numb));
L=4*B*Q*B;
L=L/(10^14);
Za=(Ga'*inv(L)*Ga)\Ga'*inv(L)*h;
%%
Ga1=[1,0,0;0,1,0;0,0,1;1,1,1];
h1=[Za(1)^2;Za(2)^2;Za(3)^2;Za(4)^2];
N1=[Za(1),Za(2),Za(3),0.5];
B1=diag(N1);
L1=4*B1*cov(Za)*B1;
Za1=(Ga1'*inv(L1)*Ga1)\Ga1'*inv(L1)*h1;
Za11=sqrt(Za1);
%%compute Z
hZ = ones(Nbase,1);
GaZ = ones(Nbase,4);
%  i=1
%     hZ(i,1)=m1distance(1,Numb(i))^2-(Za(1,1)-baselocation(Numb(i),1))^2-(Za(2,1)-baselocation(Numb(i),2))^2-baselocation(Numb(i),3)^2;
%     GaZ(i,1)=-2*baselocation(Numb(i),3);
%     GaZ(i,2)=1;
% 
% % QZ = cov(hZ);
% % BZ=diag(m1distance(Numb));
% % LZ=4*BZ*QZ*BZ;
% % LZ=LZ/(10^14);
% % ZaZ=(GaZ'*inv(LZ)*GaZ)\GaZ'*inv(LZ)*hZ;
% ZaZ=(GaZ'*GaZ)\GaZ'*hZ;
za=ones(1,30);
zb=ones(1,30);
zm=ones(1,30);
for i=1:1:30
za(1,i) = -0.25*sqrt((case001_input(3,i)*3*10^8*0.85)^2-(Za(1,1)-baselocation(i,1))^2-(Za(2,1)-baselocation(i,2))^2)+baselocation(i,3);
zm(1,i)=sqrt((case001_input(3,i)*3*10^8*0.85)^2-(Za(1,1)-baselocation(i,1))^2-(Za(2,1)-baselocation(i,2))^2);
end
