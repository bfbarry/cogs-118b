function [sqDmat] = calcSqDistances(X,Kmus)
     N = size(   X,1);
     K = size(Kmus,1);
    sqDmat = zeros(N,K);
    for k = 1:K
        pete = (X - repmat(Kmus(k,:), N, 1));
        sqDmat(:,k) = sqrt(sum(pete .* pete,2));
    end
end