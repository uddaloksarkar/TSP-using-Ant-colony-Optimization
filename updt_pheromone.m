function pheromone = updt_pheromone(p, S, Scst, pheromone)
l = size(S);
%pheromone = pheromone*(1-p);
for i=1:l(1)
    tmp = 1/Scst(i);
    for j=1:l(2)-1
        pheromone(S(i,j),S(i,j+1))= (1-p)*pheromone(S(i,j),S(i,j+1))+ tmp;
    end
end
end