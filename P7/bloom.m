fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid,'%s');
fclose(fid);
dicionario = dicionario{1,1};
n=8000;
m=1000;
m2=10000;
k=3;

vetor=init(n);
for i=1:m
    vetor=addElement(dicionario{i},vetor,k);
end
contador=0;
for i=1:m
   if ~verify(dicionario{i},vetor,k)
       contador=contador+1;
   end
end
fprintf("Número de falsos positivos %d\n",contador);
contador=0;
for i=m+1:m+m2
   if verify(dicionario{i},vetor,k)
       contador=contador+1;
   end
end
fprintf("Número de falsos positivos (%%) %.3f\n",(100*contador)/m2);

fprintf("Probabilidade teórica: %.3f\n", (100*(1-exp(-k*m/n))^k))/m2;
