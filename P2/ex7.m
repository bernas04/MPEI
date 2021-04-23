tic
PA  =1/5;
PB  =3/10;
PC =1/2;
PE_C=0.001;
PE_B=0.05;
PE_A=0.01;

PE=(PA*PE_A)+(PB*PE_B)+(PC*PE_C);
PFC=(PE_C*PC)/PE;
disp("a) Probabilidade de o erro ser no programa do Carlos é de " +PFC);

PFA=(PE_A*PA)/PE;
PFB=(PE_B*PB)/PE;
if (PFA>PFB && PFA>PFC)
    disp("É mais provavel ser do Andre");
elseif (PFA>PFB && PFC>PFA)
    disp("É mais provável ser do Carlos")
else
    disp("É mais provável ser do Bruno")
end
toc