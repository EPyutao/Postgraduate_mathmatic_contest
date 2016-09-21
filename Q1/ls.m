A = ones(29,3);
for i=1:1:29
    A(i,1)=2*(baselocation(i,1)-baselocation(30,1));
    A(i,2)=2*(baselocation(i,2)-baselocation(30,2));
    A(i,3)=2*(baselocation(i,3)-baselocation(30,3));
end
b = ones(29,1);
for i=1:1:29
    b(i,1)=(baselocation(i,1)^2+baselocation(i,2)^2+baselocation(i,3)^2 ...
        -(baselocation(30,1)^2+baselocation(30,2)^2+baselocation(30,3)^2)...
        -(distance(1,i)^2-distance(1,30)^2));
end
xls = inv(A'*A)*A'*b;