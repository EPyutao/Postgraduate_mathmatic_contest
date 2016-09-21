%%ans 1 range
Nbase=40;
ml=[-259.20	-341.86	1.12];
realdistance = ones(1,Nbase);
for i=1:1:Nbase
    realdistance(1,i)=(baselocation(i,1)-ml(1))^2+(baselocation(i,2)-ml(2))^2+(baselocation(i,3)-ml(3))^2;
    realdistance(1,i)=sqrt(realdistance(1,i));
end
disdiff = ones(1,Nbase);
for i=1:1:Nbase
    disdiff(1,i)=realdistance(1,i)-distance(1,i);
end
distime = disdiff / (3*10^8);
disratio = distime(1,:)./case001_input(1,:);