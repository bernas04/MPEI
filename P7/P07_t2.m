load keys;
Nkeys = length(keys);
Ntabela = 5e5;
valores = zeros(1,Nkeys);
tabela = zeros(1,Ntabela);
colisoes = 0;
tic;
for i = 1:Nkeys
   hash = string2hash(keys{i});
   hash = mod(hash,Ntabela)+1;
   
   hash = string2hash(keys{i}, 'sdbm');
   hash = mod(hash,Ntabela)+1;
   
   hash= hashstring(keys{i},Ntabela)+1;
   
   valores(i) = hash;
   if tabela(hash)>=1
       colisoes = colisoes+1;
   end
   tabela(hash) = tabela(hash) + 1;
end

tempo = toc;
histogram(valores,100);
h = valores/Ntabela;
fprintf('Momento 2: medido - %f teorico - %f\n',mean(h.^2),1/(2+1));
fprintf('Momento 5: medido - %f teorico - %f\n',mean(h.^5),1/(5+1));
fprintf('Momento 10: medido - %f teorico - %f\n',mean(h.^8),1/(10+1));
fprintf('No. de colisoes = %d\n',colisoes);
fprintf('No. max de atribuições = %d',max(tabela));
fprintf('Tempo de execução= %f\n',tempo);