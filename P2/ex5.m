%A-soma de dois valores igual a 9
%B-segundo valor par
%C-pelo menos um dos valores é igual a 5
%D-nenhum dos valores é igual a 1

% probabilidade de A
n=2; %nº de lançamentos
N=1e5; %número de experiências
valores = randi ([1,6],n,N);
n_de_noves=zeros(1,N);
for i=1:N
    n_de_noves(i) = sum(valores(:,i))==9;
end
probF_a= sum(n_de_noves)/N;
disp("P(A)---> " +probF_a);
%alínea B
n_de_pares = zeros(1,1);
for i=1:N
    n_de_pares(i) = mod(valores(2,i),2)==0;
end
probF_b = sum(n_de_pares)/N;
disp("P(B)---> "+probF_b);
%alínea C
n_de_5 = zeros(1,1);
for i=1:N
    n_de_5(i) = valores(1,i)==5 || valores(2,i) == 5;
end
probF_c = sum(n_de_5)/N;
disp("P(C)---> " +probF_c);
%alínea D
n_de_1 = zeros(1,1);
for i=1:N
    n_de_1(i) = valores(1,i)~=1 && valores(2,i) ~= 1;
end
probF_d = sum(n_de_1)/N;
disp("P(D)---> "+probF_d);