function Mus = recalcMus(X,Rnk)
    total = X' * Rnk;
    num = repmat(sum(Rnk, 1)',1,size(X,2));
    Mus = total' ./ num;
