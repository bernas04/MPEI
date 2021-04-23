%% alínea a)
n = 20;
m=100;
N=1e5;
probF = calcula(n,m,N);

disp("A probabilidadde é de " +probF);
probB=1-probF;
disp("A probabilidade é de " +probB);
%% respetivo à alínea c)
m=1000;
subplot(3,1,1);
N=1e5;
n=10:10:100;
for i=10:10:100
    x(i)=1-calcula(i,m,N);
end
t=nonzeros(x)';
plot(n,t,"r");
legend("m=1000");
title("Figura 1");
subplot(3,1,2);
M=100000;
for i=10:10:100
    q(i)=1-calcula(i,M,N);
end
f=nonzeros(q)';
plot(n,f,"b");
legend("m=100000");
title("Figura 2")
subplot(3,1,3)
n=100;
m=[200,500,1000,2000,5000,10000,20000,50000,100000];
matrizResultados = zeros(1,1);
for i=1:length(m)
    prob=1-calcula(n,m(i),1e5);
    matrizResultados(i) = prob;
end

plot(m,matrizResultados,"y");
title("Probabilidade de pelo menos 1 alvo ter sido atingido 2 ou mais vezes");
xlabel=("alvos");
