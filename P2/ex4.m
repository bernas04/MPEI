%Valor de n, para a probF ser menor que 0,5
n=0;
N=1e5;
a=teste(n,N); %n tem que ser igual a 41
while (a<0.50)
    n= n+1;
    a=teste(n,N);
end
disp("Menor valor de n " +n+ " corresponde a uma probabilidade de: "+a);

%% função
function p = teste(n,N)
dias= randi([1,365],n,N);
x=zeros(1,N);
for i=1:N
   x(i)= length(unique(dias(:,i))) <= n-1;
end
p=sum(x)/N;
end

   