uData=load('u.data');
dic= readcell('u_item.txt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OPCÃO 1
utilizadores=uData(:,1);
filmes=uData(:,2); %id filmes

list=cell(943,1);
for i=1:max(utilizadores)
   ind=find(utilizadores==i);
   list{i,1}=dic(filmes(ind),1);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OPÇÃO 2
nUtilizadores=length(unique(utilizadores));

K=200; %Funções de Hash

MinHashTable=inf(nUtilizadores,K);
for i=1:nUtilizadores
   conjunto=list{i};
   for j=1:length(conjunto)
       chave=char(conjunto(j));
       for kk=1:K
            chave=[chave num2str(kk)];
            h(kk)= DJB31MA( chave, 127);
       end
       MinHashTable(i,:)=min([MinHashTable(i,:);h]);
   end
end




%%%%%%%%%%%%%%%%%% opção 3


hash=100; %Funções de Hash
shingSize=3;
movies={dic{:,1}};
nMovies=length(movies);

MinHashTable_Movies=inf(nMovies,hash); %tamanho
for i=1:nMovies %tamanho
   movie=movies{i};
   for j=1:length(movie)-shingSize+1
       chave=lower(movie(j:j+shingSize-1));
       h=zeros(1,hash);
       for kk=1:hash
            chave=[chave num2str(kk)];
            h(kk)= DJB31MA( chave, 127);
       end
       MinHashTable_Movies(i,:)=min([MinHashTable_Movies(i,:);h]);
   end
end

save data list MinHashTable nUtilizadores K dic hash MinHashTable_Movies nMovies nUtilizadores nMovies movies



 

