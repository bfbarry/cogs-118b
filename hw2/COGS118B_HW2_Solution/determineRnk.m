function responsibility = determineRnk(sqDmat)
  K = size(sqDmat, 2);
minVect = repmat(min(sqDmat,[],2),1,K);
responsibility = eq(minVect, sqDmat);
