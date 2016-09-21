%
Nbase = 50;
Nmove = 1300;
% ALLdistance = realdistance;
ALLdistance = case026_input*3*10^8;
%
J=ones(Nmove,Nbase);
for i=1:1:Nmove
    for j=1:1:Nbase
        if ALLdistance(i,j) >200
            J(i,j)=0;
        else
            J(i,j)=1;
        end
    end
end
%
Jmove=zeros(Nmove,1);
allbasenum=0;
for i=1:1:Nmove
    basenum=0;
    for j=1:1:Nbase
        if J(i,j)>0
            basenum=basenum+1;
            allbasenum=allbasenum+1;
        end
    end
    if basenum>3;
        Jmove(i,1)=sum(J(i,:));
    end
end
movecancompute=sum(Jmove');