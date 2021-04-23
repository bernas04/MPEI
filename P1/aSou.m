function probSimulacao = aSou(p,k,n,N)
lancamentos = rand (n, N) > p;
sucesso = sum(lancamentos) == k;
probSimulacao = sum (sucesso)/N;
end