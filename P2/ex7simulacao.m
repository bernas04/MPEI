tic
n_tentativas=10000;

programas_Andre=0.20;
programas_Bruno=0.30;
programas_Carlos=0.50;
probErro_Andre=0.01;
probErro_Bruno=0.05;
probErro_Carlos=0.001;

%1-ANDRÉ
%2-BRUNO
%3-CARLOS

programas = [ones(1, programas_Andre*100) 2*ones(1, programas_Bruno*100) 3*ones(1,programas_Carlos*100)];
programas = programas(randperm(length(programas)));

index=randi(length(programas), n_tentativas,1);

andre=0;
erroAndre=0;
bruno=0;
erroBruno=0;
carlos=0;
erroCarlos=0;

for i=1:length(index)
    p = programas(index(i));
    erro=rand();
   
   if (p==1)
       andre=andre+1;
       if (erro<probErro_Andre)
           erroAndre=erroAndre+1;
       end
   end
   
   if (p==2)
       bruno=bruno+1;
       if (erro<probErro_Bruno)
           erroBruno=erroBruno+1;
       end
   end
   
   if (p==3)
       carlos=carlos+1;
       if (erro<probErro_Carlos)
           erroCarlos=erroCarlos+1;
       end
   end
end

%Pelo Teorema de Bayes
% P(Carlos|erro) = (P(erro|Carlos) * P(Carlos)) / P(erro)

pCarlos = carlos /length(index);
pErro = (erroAndre+erroBruno+erroCarlos)/length(index);
probCarlos_Erro = (probErro_Carlos * pCarlos)/pErro

disp("b)");

pAndre = andre/length(index);
pBruno = bruno/length(index);
probAndre_Erro = (probErro_Andre * pAndre)/pErro;
probBruno_Erro = (probErro_Bruno * pBruno)/pErro;
if (probCarlos_Erro>probAndre_Erro && probCarlos_Erro>probBruno_Erro)
    disp("Mais provável ser do Carlos")
elseif (probAndre_Erro>probCarlos_Erro && probAndre_Erro>probBruno_Erro)
    disp("Mais provável ser do André");
else
    disp("Mais provável ser do Bruno");
end
toc