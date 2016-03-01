model = changeRxnBounds(model,'EX_glc(e)',-10,'b');
growthRates = zeros(21,1);
for i = 0:25
model = changeRxnBounds(model,'EX_o2(e)',-i,'b');
FBAsolution = optimizeCbModel(model,'max');
growthRates(i+1) = FBAsolution.f;
end