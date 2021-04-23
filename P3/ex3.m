n=4; %nº lançamentos
N=1e5; %nº experiências
x=zeros(1,5);
for i=1:5
    k=i-1;
    x(i)=massaProbabilidade(n,k,N);
end
subplot(1,2,1)
stem(0:4, x,"r^");
title("Função massa de probabilidade");
xlabel("x");
ylabel("px");
axis([-0.5 4.5 0 0.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("b)")
E=0;
for i=1:5
    E= E+ (i-1) * x(i);
end
disp ("E[x]= " +E);
E2=0;
for i=1:5
    E2= E2 +(i-1)^2*x(i);
end
var = E2-E^2;
disp("Variância: " +var+ " desvio padrão: " +sqrt(var));



%%%%%%%%alínea C
%variável binomial
%px(k)=pr(x=k)=(n k)p^k(1-p)^n-k

%% d)
n=4;
p=1/2;
t=zeros(1,5);
for i=1:5
    k=i-1;
    nCk=factorial(n)/(factorial(n-k)*factorial(k));
    t(i)=nCk*p^k*(1-p)^(n-k);
end
subplot(1,2,2)
x=[0:4];
stem(x, t, "r^");
axis([-0.5 4.5 0 0.5]);
title("Função massa de probabilidade teoricamente");
xlabel("x")
ylabel("Px")

%%%%%%%%%%%%E
E = 0;
for i=1 : 5
  E = E+ (i-1) * t(i);
end
E2 = 0;
for i=1 : 5
  E2 = E + (i-1)^2 * t(i);
end
var = (E2 - E^2)^2;
disp("Variância: " +var+ " desvio padrão: " +sqrt(var));

% e)
%"probabilidade de obter pelo menos duas coroas" -> 2/3/4
pA = sum(t(x>=2));
pB=sum(t(x<=1));
pC=sum(t(1<=x & x<=3));
fprintf("i) " +pA +"\nii)"+pB+"\niii)" +pC+ "\n");


%% função
function px = massaProbabilidade(n,k,N)
matriz =rand(n,N)<0.5;
sucesso= sum(matriz)==k;
px = sum(sucesso)/N;
end


