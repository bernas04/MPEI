function keys = P07_t1(N,iMin, iMax,array, prob)
    if (nargin==4)
        prob=1;
    end
keys={};
n=0;
nAlpha=length(array);   
while(n<N)
    tam=randi([iMin, iMax]);
    if prob==1
        list=randi(nAlpha,1,tam);
        key=array(list);
        if ~ismember(key,keys)
            n=n+1;
            keys{n}=key;
        end
    else
        list=zeros(1,tam);
        aux=cumsum(prob);
        for i=1:tam
            list(i)=1+sum(rand()>aux);
        end
    end
end