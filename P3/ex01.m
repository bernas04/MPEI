%face entre 1 e  6
subplot(1,2,1)
xi=1:6;
p=ones(1,6)/6;
stem(xi,p);
xlabel('x');
ylabel('px(x)');
title("Função massa de probabilidade");
%outra alínea
subplot(1,2,2)
Fx=cumsum(p);
Fx=[0 Fx 0];
x= 0:7;
stairs(x,Fx, "r.-");
xlabel("x")
ylabel("F(x)");
xlim([0,7]);
title("Função distribuição acumulada");