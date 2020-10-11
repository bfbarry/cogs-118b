function [Kmus] = recalcMus(X,Rnk)
    D = size(X,2);
    K = size(Rnk,2);
    Kmus  = zeros(K,D);
    for k = 1:K
        Kmus(k,:) = mean(X(Rnk(:,k)',:));
    end
end
