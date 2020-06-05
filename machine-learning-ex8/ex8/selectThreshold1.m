function [bestEpsilon bestF1] = selectThreshold1(yval, pval)
bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
pval1 = zeros(size(pval, 1), 1);
stepsize = (max(pval) - min(pval)) / 1000;
%for epsilon = min(pval):stepsize:max(pval),
  for i = 1:length(pval),
    if(pval(i) >= max(pval))
      pval1(i) = 1;
    else 
      pval1(i) = 0;
    endif
  endfor
  fp = sum((pval1 == 1) & (yval == 0));
  tp = sum((pval1 == 1) & (yval == 1));
  fn = sum((pval1 == 0) & (yval == 1));
  prec = tp / (tp + fp);
  rec = tp / (tp + fn);
  F1 = (2 * prec * rec) / (prec + rec);
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    












    % =============================================================

%    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = max(pval);
    %endif
%endfor

end
