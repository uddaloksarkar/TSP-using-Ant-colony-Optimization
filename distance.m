function distnc = distance(city)
l=length(city);
for i=1:l
    for j=1:l
        distnc(i,j)=(city(i,1)-city(j,1))^2+(city(i,2)-city(j,2))^2;
    end
end
end