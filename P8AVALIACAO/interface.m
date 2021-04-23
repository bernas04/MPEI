clear all;
load data.mat

n=-1;
while(n>943 || n<1)
    n = input ("Insert User ID (1 to 943): ");
end
%%%%%%%%%
op=-1;
while(op~=4 || op>4 || op<1)
    op=input('1 - Your Movies\n2 - Get Suggestions\n3 - Search Title\n4 - Exit\nSelect choice: ');
    
    switch (op)
        case 1
            fprintf('%20s \n','Your Movies');
           disp(string(list{n,1}));
        case 2
            categoria=-1;
            while(categoria<1 || categoria>18)
                categoria=input('1- Action, 2- Adventure, 3- Animation, 4- Children’s\n 5- Comedy, 6- Crime, 7- Documentary, 8- Drama\n9- Fantasy, 10- Film-Noir, 11- Horror, 12- Musical\n13- Mystery, 14- Romance, 15- Sci-Fi, 16- Thriller\n17- War, 18- Western\nSelect choice: ');
            end
            J=zeros(nUtilizadores,1);
            for n2=1:nUtilizadores
                J(n2)=sum(MinHashTable(n,:)~=MinHashTable(n2,:))/K;
            end
            
            ind=mink(J,2);
            ind=ind(2);
            
            id=find(J==ind); %utilizador mais parecido com o escolhido (n)
            id=id(1);
            
            a=string(list{id,1}); % filmes do id
            filmesNovos=cell2mat(dic(:,categoria+2)); % o's e 1's
            filmesCategoria=string(dic(find(filmesNovos==1),1)); % Todos os filmes da categoria escolhida
            
            filmesAPrintar = string(1);
            indice = 1;
            for filme=1:length(a)
                if ismember(a(filme), filmesCategoria)
                    filmesAPrintar(indice) = a(filme);
                    indice = indice + 1;
                end
            end
            if (filmesAPrintar(1)~='1')
                fprintf('\n');
                fprintf("%40s\n", 'Suggetions');
                for i=1:length(filmesAPrintar)
                    fprintf("%10s%s\n","- ",filmesAPrintar(i));
                end
                fprintf("\n");
            else
                fprintf("\n");
                fprintf("%10s %s\n", '-', 'Cannot find any films');
                fprintf("\n");
            end
        case 3
            str=input("Write a string: ",'s');
            
            hash=100; %Funções de Hash
            shingSize=3;
            MinHashTable_String=inf(1,hash); %tamanho da minHash
            
            for i=1:length(str)
                for j=1:length(str)-shingSize+1
                    chave=lower(str(j:j+shingSize-1));
                    h=zeros(1,hash);
                        for kk=1:hash
                            chave=[chave num2str(kk)];
                            h(kk)= DJB31MA( chave, 127);
                        end
                MinHashTable_String(1,:)=min([MinHashTable_String(1,:);h]);
                end
            end
            
            M=zeros(1,2); %guarda distancia Jacard e ID filme
            c=1;
            for n2=1:nMovies
                x=sum(MinHashTable_String(1,:)~=MinHashTable_Movies(n2,:))/hash;    
                if (x<=0.99)
                   M(c,:)=[n2 x];
                   c=c+1;
                end
            end
            
            M=sortrows(M,2,'ascend');
            
            if (M(1,1)~=0)
                for i=1:min(5,length(M))
                    fprintf("%10s (%.4f) -> %s\n",'- ' ,M(i,2), string(movies(M(i,1))));
                end
            else
                fprintf("\n");
                fprintf('%30s \n','Cannot find any films');
                fprintf("\n");
            end
          
        case 4
            disp("Ending");
        end
end
