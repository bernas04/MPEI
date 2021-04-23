function BF = addElement(key,BF,k)
n=length(BF);
for i=1:k
    key=[key num2str(i)];
    h=DJB31MA(key,127);
    h=mod(h,n)+1;
    BF(h)=true;
end
end