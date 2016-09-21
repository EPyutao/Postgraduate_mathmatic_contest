%visualization
%move location Za11
scZ=1:1:Ntime;
scatter3(Za11(:,1),Za11(:,2),scZ(:));
%
hold on
scatter(Za11(:,1),Za11(:,2));
axis([-1000,1000,-600,600]);
axis equal;
%
plot(Zhixian(:,1),yy,'r','LineWidth',2);

 alpha=0:pi/20:2*pi;    %½Ç¶È[0,2*pi] 
 RR=470;                   %°ë¾¶ 
 x=RR*cos(alpha); 
 y=RR*sin(alpha); 
 plot(x,y,'-','LineWidth',2) 