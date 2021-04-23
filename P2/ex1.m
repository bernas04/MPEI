%% alínea a) e b)
%Obtenha por simulação uma estimativa da probabilidade do acontecimento “ter pelo menos um filho rapaz” em fam´ılias com 2 filhos
%ter um filho rapaz sabendo que a familia tem dois filhos
%pm e dois filhos
N = 1e5; %nº experiências
p = 0.5;
k = 1; %nº filhos rapazes
n = 2; %nº filhos total

filhos = rand(n,N) > p;
sucesso = sum(filhos) >= 1;
probSimulacao = sum (sucesso)/N;

probTeorica = 3/4;%probabilidade de ter pelo menos um rapaz: rapaz + rapariga, rapariga+rapaz, rapaz+rapaz, rapariga+rapariga
disp("ALÍNEA a)&b) Probabilidade por simulação " +probSimulacao + " probabilidade teórica " +probTeorica);

%% alínea c)
clear all
N = 1e5; %nº experiências
n = 2; %nº filhos total
filhos = rand (n,N)>0.5;
A = sum(filhos) == 2;
B = sum(filhos) >=1;
prob_c = sum (A&B)/sum(B);
disp("ALÍNEA c) Probabilidade por simulação " +prob_c )%+ " probabilidade teórica " +probT_c);

%% alínea d)
clear all
N = 1e5; %nº experiências
n = 2; %nº filhos total
filhos = rand (n,N)>0.5;
A = sum (filhos) == 2;
B = filhos(1,:);
prob_d = sum(A&B)/sum(B);
disp("ALÍNEA d) Probabilidade por simulação " +prob_d);

%% alínea e)
clear all
N = 1e5; %nº experiências
n = 5;
filhos=rand(n,N) >0.5;
A = sum (filhos) == 2;
B = sum(filhos) >=1; %pelo menos um dos filhos ser rapaz
prob_e = sum(A&B)/sum(B);
disp("ALÍNEA e) Probabilidade por simulação " +prob_e);

%% alínea f)
clear all
N = 1e5; %nº experiências
n = 5;
filhos=rand(n,N) >0.5;
A = sum (filhos) >= 2;
B = sum(filhos) >=1; %pelo menos um dos filhos ser rapaz
prob_f = sum(A&B)/sum(B);
disp("ALÍNEA f) Probabilidade por simulação " +prob_f);









