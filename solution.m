function sol = solution(sol, ant, city, rnd, eta, pheromone, a, b)
l=length(city);
temp=(pheromone.^a).*(eta.^b);
for i=1:l
    rwsum(i)=sum(temp(i,:));
end
for i=1:l
    prob(i,:)=temp(i,:)./rwsum(i);
end
sol(ant,1)=rnd;
r=rand;

for i=1:l
    [x,y] = max(prob(sol(ant,i),:));
    sol(ant,i+1)=y;
    prob(sol(ant,i),:)=0;
    prob(:,sol(ant,i))=0;
end