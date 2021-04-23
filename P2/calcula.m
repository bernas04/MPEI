function probF = calcula(n,m,N)

alvos = randi([1,m],n,N);
resultados=zeros(1,1);
for i=1:N
    resultados(i)=length(unique(alvos(:,i)))==n;
end
probF= sum(sum(resultados))/N;