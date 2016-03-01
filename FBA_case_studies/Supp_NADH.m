model = changeRxnBounds(model,'EX_glc(e)',-1,'b');
model = changeRxnBounds(model,'ATPM',0,'b');
model = addReaction(model,'NADH_drain','nadh[c] -> nad[c] + h[c]');
model = changeObjective(model,'NADH_drain');
FBAsolution = optimizeCbModel(model,'max');
writetable(table(model.rxns,FBAsolution.x),'Supp_NADH.csv')