function check = verify(key,BF,k)
check=true;
n=length(BF);
for i=1:k
    key=[key num2str(i)];
    h=DJB31MA(key,127);
    h=mod(h,n)+1;
    if BF(h)==false;
        check=false;
        break;
    end
end
end