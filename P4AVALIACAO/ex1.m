clear all;
clc
close all
N=1e5; %nº experiências
p1=0.002; %defeito da componentes 1 com defeito
p2=0.005; %defeito da componente 2 com defeito
pMontagem=0.01; %defeito no processo de montagem, independente se as componentes têm ou não defeito
pTotal = p1+p2+pMontagem;
n=8; %número de brinquedos por caixa
disp("Exercício 1");
%”A - uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito” (1 ou 2 ou 3 ... ou 8)
%P(A)=1-P(não ter defeito)
brinquedos=rand(3,n*N);
defeituoso= (brinquedos(1,:) < p1 | brinquedos(2,:) < p2 | brinquedos (3,:) < pMontagem);
prob=sum(defeituoso)/N; %A probabilidade pedida
disp("a) A probailidade do acontecimento A é "+prob);
%%
% alínea b)
%Sabendo que uma caixa de brinquedos tem pelo menos um brinquedo c defeito
%em 8 totais
%qual o numero medio de brinquedos defeituosos apenas devido ao processo de montagem
defeituoso = (brinquedos(3,:)<pMontagem); %1 quando tem defeito, 0 quando não tem defeito
probb=sum(defeituoso)/N;
disp("b) O número médio de brinquedos defeituosos apenas devido ao processo de montagem B é de " +probb);


%Exercício 2
%alínea a)
%A probabilidade de uma caixa de brinquedos não ter brinquedos com defeito
%é o acontecimento contrário da alínea a) do exercício 1
%ou seja, pb=1-pa;
disp("Exercício 2")
disp("a) A probabilidade do acontecimento B é: " +(1-prob));

%alínea b)
%probabilidade de uma caixa não ter brinquedos com defeito
ProbTotal=1-(p1+p2+pMontagem);
n=8;
pTeorica = (1-p1)*(1-p2)*(1-pMontagem);
pTeorica=pTeorica^n;
disp("b) A probabilidade do acontecimento B, teoricamente é: "+pTeorica);


%alínea c)
n=2:20;
probF=zeros(1,length(n));
for i=n
    k=i-1;
    brinquedos = rand(3,i*N);
    defeituoso= (brinquedos(1,:) < p1  | brinquedos(2,:) < p2 | brinquedos (3,:) < pMontagem); 
    prob=sum(defeituoso)/(N);
    probF(k)=1-prob;
end

figure(1);
plot(n,probF,"r.-");
xlabel("n");
ylabel("Prob");
title("Probabilidade de uma caixa não ter brinquedos com defeito");
grid on;
%Deverá ser n=5

disp("Exercício 3");
n=8;
x=zeros(1,8);
for i=1:9
    k=i-1;
    x(i)=nchoosek(n,k)*pTotal^k*(1-pTotal)^(n-k);
end
figure(2);
subplot(2,1,1);
stem(0:8,x,"r");
title("Gráfico da função massa de probabilidade");
axis([0 8 0 1]);
n=16;
xlabel("n");
ylabel("px, n=8");


soma=0;
for i=3:length(x)
    soma=soma+x(i);
end
disp("b) P(X>=2) = "+soma);
valorMedio=0;
for i=1:length(x)
    valorMedio=valorMedio+x(i);
end
valorMedio=valorMedio/length(x);
disp("c) Valor esperado: " +valorMedio);
%valor medio ao quadrado
x_2=x.^2;
valorMedio2=0;
for i=1:length(x)
    valorMedio2=valorMedio2+x_2(i);
end
valorMedio2=valorMedio2/length(x);
disp("Variância: "+(valorMedio2-valorMedio^2));
disp("Desvio Padrão: "+sqrt((valorMedio2-valorMedio^2)));

x=zeros(1,16);
for i=1:17
    k=i-1;
    x(i)=nchoosek(n,k)*pTotal^k*(1-pTotal)^(n-k);
end
subplot(2,1,2);
stem(0:16, x, "r")
title("Gráfico da função massa de probabilidade");
axis([0 16 0 0.8]);
xlabel("n");
ylabel("px, n=16");
soma=0;
for i=3:length(x) %começa em 3 porque a terceira posição do vetor corresponde 3
    soma=soma+x(i);
end
disp("b) P(X>=2) = "+soma);
for i=1:length(x)
    valorMedio=valorMedio+x(i);
end
valorMedio=valorMedio/length(x);
disp("c) Valor esperado: " +valorMedio);

x_2=x.^2;
valorMedio2=0;
for i=1:length(x)
    valorMedio2=valorMedio2+x_2(i);
end
valorMedio2=valorMedio2/length(x);
disp("Variância: "+(valorMedio2-valorMedio^2));
disp("Desvio Padrão: "+sqrt((valorMedio2-valorMedio^2)));


%%
%%%%exercício 4
%A PROBABILILDADE DE UMA CAIXA COMERCIALIZADA NÃO TER BRINQUEDOS COM
%DEDFEITO É PELO MENOS 90%
N=1e5; %nº experiências
p1=0.002; %defeito da componentes 1 com defeito
p2=0.005; %defeito da componente 2 com defeito
pMontagem=0.01; %defeito no processo de montagem, independente se as componentes têm ou não defeito
pTotal = p1+p2+pMontagem;
n=20;
pMontagem=0.1/100;

%alínea a)
disp("Exercício 4");
m=1;
brinquedos=rand(3,n*N);
matriz=rand(n,N);
for k=1:n*N
    matriz(k)=(brinquedos(1,k) >= p1 & brinquedos(2,k) >= p2 & brinquedos(3,k) >= pMontagem); %Matriz com 0 e 1 onde 1 corresponde a sem defeito e 0 com defeito
end

comercializacao = zeros(1,N);

for k=1:N
    index=randperm(n,m);
    if matriz(index,k)==0 %Caso o brinquedo seja defeituoso
        comercializacao(1,k)=0;
    else
        comercializacao(1,k)=1; %Se poder ser comercializado
    end
end
probFinal=sum(comercializacao)/N;
disp("a) A probabilidade de uma caixa ser comercializada com m=1 é "+probFinal);    

%%alínea b)
m=1:19;
probabilidades=zeros(1,length(m));


for i = 1:length(m)
    SemDefeito = zeros(n,N);
    for k = 1:n*N
        SemDefeito(k) = (brinquedos(1,k) >= p1 & brinquedos(2,k) >= p2 & brinquedos(3,k) >= pMontagem);
    end
    comercializacao = zeros(1,N); 
    for k = 1:N
        aleatorio = randperm(n,m(i)); % randperm retorna um vetor 1xm com valores aleatorios até 20
        for t = 1:length(aleatorio)
            if SemDefeito(aleatorio(t),k) == 0 % caso o brinquedo escolhido aleatoriamente seja defeituoso
                comercializacao(1,k) = 0;
                break; % caso encontrar um brinquedo com defeito a caixa já não é comercializada(0) e quebra-se o ciclo
            else
                comercializacao(1,k) = 1; % tem valor 1 se pode ser comercializado, ou seja, é caixa sem defeitos
            end
        end
    end
    probabilidades(i) = sum(comercializacao)/N;
end

plot(m,probabilidades,"r-x");
title("Gráfico do exercício 4");
grid on;
xlabel("m");
ylabel("P(m)");

disp("b) O menor valor de m para atingir o pedido é m=13");

