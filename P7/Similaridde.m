%1ª coluna -> ID utilizador
%2ª coluna -> ID filme
%3ª coluna -> Avaliação dada pelo utilizador
%4ª coluna -> Timestamp do momento de avaliação

udata=load('u.data'); 
% Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); 
clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Número de utilizadores
% Constrói a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa células
for n = 1:Nu 
    % Para cada utilizador
    % Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa células porque utilizador tem um número
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end



J=zeros(Nu); % array para guardar distâncias
tic
K=50; % número de hash functions
MinHashTable=inf(Nu,K);
for i=1:Nu
   conjunto=Set{i};
    for j=1:length(conjunto)
       chave=char(conjunto(j));
       for kk=1:K
            chave=[chave num2str(kk)];
            h(kk)= DJB31MA( chave, 127);
       end
       MinHashTable(i,:)=min([MinHashTable(i,:);h]);
   end
end
for n1=1:Nu
    for n2=n1+1:Nu
        J(n1,n2)=sum(MinHashTable(i,:)); h;
    end
end
% h= waitbar(0,'Calculating');
% for n1= 1:Nu
% waitbar(n1/Nu,h);
%     for n2= n1+1:Nu
%     % Adicionar código aqui
%         J(n1,n2)=1-length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2}));
%     end
% end
% delete (h)
% save 'distancias.mat' J
fprintf("Elapsed time: %.5f\n" ,toc);
%% Com base na distaˆncia, determina pares com
%% distância inferior a um limiar pre´-definido
tic
threshold =0.4; % limiar de decisa˜o
% Array para guardar pares similares (user1, user2, distaˆncia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if (J(n1,n2)<=threshold)
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
fprintf("Cálculo dos utilizadores mais similares %.5f\n", toc);
fprintf("Números de pares de utilizadores %d\n" ,size(SimilarUsers,1));