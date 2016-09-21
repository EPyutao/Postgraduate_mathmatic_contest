%shaixuan
maxTOA=ones(1000,15);
maxarry =ones(1,15);

for i=1:1:1000
    arry=1;
    SXarry=case001_input(i,:);
    mediaSXarry = median(SXarry);
    for j=1:1:30
        if SXarry(1,j)>mediaSXarry
            maxarry(arry)=j;
            arry=arry+1;
        end
    maxTOA(i,:)=maxarry(1,:);
    end
end