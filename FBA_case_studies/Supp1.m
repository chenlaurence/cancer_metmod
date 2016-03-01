model=changeObjective(model,'Biomass_Ecoli_core_w_GAM');
model=changeRxnBounds(model, 'EX_glc(e)',0,'l');
model=changeRxnBounds(model, 'EX_succ(e)',-20,'l');
FBAsolution=optimizeCbModel(model,'max');