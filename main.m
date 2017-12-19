clear
%-----parameters------%
a = 0.1;
b = 3;
p = 0.1;
iter_max = 200;
ant_pop = 40;
%---------------------%

%-----database------%
cities = 40;
city=rand(cities,2)*100;
%-------------------%

distnc = distance(city);
for i=1:cities
    for j=1:cities
        if distnc(i,j)==0
            eta(i,j)=0;
        else
            eta(i,j)=1/distnc(i,j);
        end
    end
end     
%pheromone = init_pheromone(cities, city);
for i=1:cities
    for j=1:cities
        pheromone(i,j)=0.001;
    end
end
bst = randperm(cities);
init=bst;
bstcst = cost(bst, distnc);
i=1;
sol=[];

figure;
scatter(city(:,1),city(:,2))
txt=[1:cities]';
txt=num2str(txt);
txt=cellstr(txt);
text(city(:,1),city(:,2),txt)
hold on;
while i<=(iter_max)
    for ant=1:ant_pop
        rnd=randi(cities);
        sol = solution(sol, ant, city, rnd, eta, pheromone, a, b);
        cst = cost(sol(ant,:), distnc);
        Scst(ant) = cst;
        if(Scst<bstcst)
            bstcst = Scst(ant);
            bst = sol(ant,:);
        end
        if(i==100)
            init2=bst;
        end
        %pheromone = updt_pheromone(p, sol, Scst, pheromone);
    end
    pheromone = updt_pheromone(p, sol, Scst, pheromone);
    i = i+1;
    for li=1:cities-1
        plot([city(bst(li),1),city(bst(li+1),1)],[city(bst(li),2),city(bst(li+1),2)])
    end
end
%for li=1:cities-1
%    plot([city(bst(li),1),city(bst(li+1),1)],[city(bst(li),2),city(bst(li+1),2)])
%end