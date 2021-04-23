N=1e5;
letras=['a':'z' 'A':'Z'];
probs=load('prob_pt.txt');
tic
keysB=P07_t1(N,6,20,letras,probs);
fprintf("1a) nº keys %d\n" ,length(keysB));
fprintf(" nº unique %d\n" ,length(unique(keysB)));
fprintf("Running time: %f seconds\n", toc);
save 'keysB' 'keysB'
