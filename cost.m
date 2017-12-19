function cst = cost(s, distnc)
l=length(s);
cst=0;
for i=1:l-1
    cst=cst+distnc(s(i),s(i+1));
end
end