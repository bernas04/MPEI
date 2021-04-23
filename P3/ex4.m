%%% SIMULAÇÃO
N=1e5;
n=5;
p=0.3;
t= zeros(1,5);
for k=0:n
    i=k+1;
    t(i)=massaProbabilidade(n,k,p,N);
end

stem(0:5,t,"r");
title("Função massa de probabilidade simulação");
axis([-0.5 5.5 0 0.5]);

dist=cumsum(t);
dist=[0 dist];
stairs(0:6,dist);
%% teorico
clear all
n=5;
p=0.3;
pxteorico=zeros(1,n);
for k=0:n
    i=k+1;
    nCk= factorial(n)/(factorial(n-k)*factorial(k));
    pxteorico(i)= nCk*p^k*(1-p)^(n-k);
end
subplot(1,2,2);
stem(0:5, pxteorico, "r");
title("Função massa de probabilidade analiticamente");
axis([-0.5 5.5 0 0.5]);
distA=cumsum(pxteorico);
distA=[0 distA];
stairs(0:6, distA);

%% alínea c)
clear all
N=1e5;
n=5;
p=0.3;
matriz=rand(n,N)<p;
sucesso = sum(matriz) <=2;
prob=sum(sucesso)/N;
disp("Probabilidade de pelo menos duas das peças serem defeituosas: "+prob);
%% teórico
n=5;
p=0.3;
x=0;

for k=0:2
    nCk = factorial(n)/(factorial(n-k)*factorial(k));
    teorico= nCk*p^k*(1-p)^(n-k);
    x = x+teorico;
end
fprintf("Teoricamente, a probabilidade de sairem pelo menos duas peças com defeito é %d.\n" ,x);

%% função
function px = massaProbabilidade(n,k,p,N)
matriz=rand(n,N)<p;
sucesso = sum(matriz)==k;
px=sum(sucesso)/N;
end