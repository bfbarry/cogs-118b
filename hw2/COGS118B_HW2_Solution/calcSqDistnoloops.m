function sqDmat = calcSqDistances(Data,Centers)
    N = size(Data,1);
    D = size(Data,2);
    K = size(Centers,1);
    
    sqData=sum((Data.*Data),2)
    sqCents=sum((Centers.*Centers),2)

    sqDmat=repmat(sqData,1,K) -2*Data*Centers'+repmat(sqCents',N,1);
