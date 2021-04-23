function prob = torneiras (defeito, amostra, experiencia)
testes = rand (amostra,experiencia) <= defeito;
sucesso = sum(testes)== 3;
prob = sum (sucesso)/experiencia
end