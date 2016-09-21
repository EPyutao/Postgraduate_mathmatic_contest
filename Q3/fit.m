%compute EllipseDirectFit
%move location Za11
Knum=0;
clear Nihe;
for i=1:1:Ntime
    if Za11(i,2)<0
        Knum=Knum+1;
        Nihe(Knum,1)=Za11(i,1);
        Nihe(Knum,2)=Za11(i,2);
    end
end
scatter(Nihe(:,1),Nihe(:,2));
axis([-1000,1000,-600,600]);
axis equal;
%
R=min(Nihe(:,2))
R2=(max(Nihe(:,1))-min(Nihe(:,1)))/2

%straight polyfit
Knum=0;
clear Zhixian;
for i=1:1:Ntime
    if Za11(i,2)>200&&Za11(i,1)<-300;
        Knum=Knum+1;
        Zhixian(Knum,1)=Za11(i,1);
        Zhixian(Knum,2)=Za11(i,2);
    end
end
hold on 
scatter(Zhixian(:,1),Zhixian(:,2));
axis([-1000,0,-600,800]);
axis equal;
p = polyfit(Zhixian(:,1),Zhixian(:,2),1);
yy=polyval(p,Zhixian(:,1));
%
plot(Zhixian(:,1),yy,'r','LineWidth',2);
