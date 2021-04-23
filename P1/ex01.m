%% 1ª maneira
a = rand (3,10);
b = a>0.5;
c = sum(b);
d = c==2;
e = sum(d)/10;
%% 2ª maneira
N = 1e5; %nº de experiências
p = 0.5; %probabilidade de sair cara
k = 2; %nº de caras (dito na experiência)
n = 3; %numero de lançamentos (dito na experiência)
lancamentos = rand (n, N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N

%% exercício 2
N = 1e5; %nº de experiências;
p = 0.5; %prob sair cara
k = 6; %nº caras
n = 15; %nº lançamentos
lancamentos = rand (n, N) > p;
sucesso = sum(lancamentos) == k;
probSimulacao = sum (sucesso)/N

%%
%ex 3
N = 1e5; %nº de experiências;
p = 0.5; %prob sair cara
k = 6; %nº caras
n = 15; %nº lançamentos
lancamentos = rand (n, N) > p;
sucesso = sum(lancamentos) >= k;
probSimulacao = sum (sucesso)/N
%%
% ex4
clear all
N = 1e5; %nº de experiências;
p = 0.5; %prob sair cara
n = 20; %nº lançamentos, depois tem que se mudar o numero de lançamentos aqui
for k=0:n
    probSimulacao(k+1)=aSou(p,k,n,N);
end
stem(0:n, probSimulacao)
%% ex5
p =0.5;
n = 3; %nº de lançamentos
k =2; %numero de caras pretendidas
prob = nchoosek(n,k)*p^k*(1-p)^(n-k)

%% ex06
defeito = 0.3;
amostra = 5;
numeroExp = 1e5;
for k=0:amostra
    p(k+1) = torneiras(defeito,amostra,numeroExp)
end
bar(0:k,p)

%% ex06_2
clear all
defeito = 0.3;
amostra = 5;
numeroExp = 1e5;
for k=0:amostra
    p(k+1) = torneiras2(defeito,amostra,numeroExp)
end
bar(0:k,p)

