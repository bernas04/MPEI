% 2 MOTORES
p= logspace(-3,log10(1/2),100);
n=2;
k=2;
nCk2=factorial(n)/(factorial(n-k)/factorial(k));
x2=nCk2.*p.^k.*(1-p).^(n-k);
% 4 MOTORES
n=4;
p4=0;
for k=3:4
    nCk3=factorial(n)/(factorial(n-k)/factorial(k));
    p4=p4+(nCk3.*p.^k.*(1-p).^(n-k));
end


plot(p,x2,"r");
hold on
plot(p,p4,"g");
legend("2 motores","4 motores")