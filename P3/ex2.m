%90 notas 5€
%9 notas de 50€
%1 nota de 100€
%ESPAÇO DE AMOSTRAGEM DISCRETO, pois contém um número finito de elementos(3)
notasT= 100;
notas5=90;
notas50=9;
notas100=1;
fprintf("Probabilidade de retirar uma nota de 5€ ---> "+90/100 +"\n");
fprintf("Probabilidade de retirar uma nota de 50€ ---> "+9/100+"\n");
fprintf("Probabilidade de retirar uma nota de 100€ ---> "+1/100+"\n");
%% alínea b)
%ESPAÇO DE AMOSTRAGEM DISCRETO, com os valores (5,50,100)
subplot(1,2,1)
mp=[90/100 9/100 1/100];
x=[5 50 100];
stem(x,mp,"rx");
title("Função massa de probabilidade");
xlabel("Valores de x");
ylabel("Fx(X)");

subplot(1,2,2)
%%alínea c)
dist = cumsum(mp);
dist = [0 dist];
x= [0 5 50 100];
stairs(x, dist,"b.-")
xlim([0,101]);
xlabel("Valores");
ylabel("Fx(x)");
title("Função distribuição acumulada");


