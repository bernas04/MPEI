function prob = torneiras2 (defeito, amostra, experiencia)
testes = rand (amostra,experiencia) <= defeito;
sucesso = sum(testes) <=2;
prob = sum (sucesso)/experiencia
end