%% alínea a)
T=1000;
n=10;
N=1e5;
x= prob3(T,n,N);
disp("A probabilidade é de: " +x);

%% alínea b)
T=1000;
N=1e5;
n=[10:10:100];
for i=[10:10:100]
    x(i)=prob3(T,i,N);
end
f=nonzeros(x)';
plot(n,f,"r.-");
title("Gráfico da alínea B");
xlabel("Keys");
ylabel("Probabilidade");
%% alínea c)
n=50;
T=[100:100:1000];
N=1e5;
t=zeros(1,1);
for i=1:length(T)
    x=prob3(T(i),n,N);
    t(i)=1-x;
end

plot(T,t,"r.-");
title("Gráfico da alínea C");
xlabel("Tamanho");
ylabel("Probabilidade");
    