%%
clc
N=1e5;
n=0; %vai dar 23
a=ex4funcao(n,N);
while a <0.9
    n= n+1;
    a=ex4funcao(n,N);
end
disp("O menor valor de n: " +n);


%%
function p = ex4funcao(n,N)
dias= randi([1,365],n,N);
x=zeros(1,1);
for i=1:N
   x(i)= length(unique(dias(:,i))) <= n-1;
end
p=sum(sum(x))/N;
end