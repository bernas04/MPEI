function x = prob3(T,n,N)
opcoes=randi([0,T-1],n,N); %matriz c os endereços da posição array
resultados=zeros(0,0);
for i=1:N
    resultados(i)= length(unique(opcoes(:,i))) ~= n;
end
x=sum(sum(resultados))/N;
