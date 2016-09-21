% % 四边测量法 第一个矩阵Q 第二个矩阵W
a=5;
b=6;
c=7;
d=8;
Q=2*[baselocation(a,1)-baselocation(d,1),baselocation(a,2)-baselocation(d,2),baselocation(a,3)-baselocation(d,3);
    baselocation(b,1)-baselocation(d,1),baselocation(b,2)-baselocation(d,2),baselocation(b,3)-baselocation(d,3);
    baselocation(c,1)-baselocation(d,1),baselocation(c,2)-baselocation(d,2),baselocation(c,3)-baselocation(d,3);];
W=[(baselocation(a,1)^2+baselocation(a,2)^2+baselocation(a,3)^2)-(baselocation(d,1)^2+baselocation(d,2)^2+baselocation(d,3)^2)-(distance(1,a)^2-distance(1,d)^2);
   (baselocation(b,1)^2+baselocation(b,2)^2+baselocation(b,3)^2)-(baselocation(d,1)^2+baselocation(d,2)^2+baselocation(d,3)^2)-(distance(1,b)^2-distance(1,d)^2);
   (baselocation(c,1)^2+baselocation(c,2)^2+baselocation(c,3)^2)-(baselocation(d,1)^2+baselocation(d,2)^2+baselocation(d,3)^2)-(distance(1,c)^2-distance(1,d)^2)];
xsibianceliang5 = inv(Q)*W;