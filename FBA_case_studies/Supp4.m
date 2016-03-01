model = changeRxnBounds(model,'EX_o2(e)',-17,'b');
growthRates = zeros(21,1);
for i = 0:20
model = changeRxnBounds(model,'EX_glc(e)',-i,'b');
FBAsolution = optimizeCbModel(model,'max');
growthRates(i+1) = FBAsolution.f;
end