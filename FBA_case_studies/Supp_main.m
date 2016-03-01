model=changeRxnBounds(model, 'EX_glc(e)',-18.5,'l');
model=changeRxnBounds(model, 'EX_o2(e)',-1000,'l');
model=changeObjective(model,'Biomass_Ecoli_core_w_GAM');
FBAsolution=optimizeCbModel(model,'max');
writetable(table(model.rxns,FBAsolution.x),'Supp_main_aerobic.csv')

model=changeRxnBounds(model, 'EX_o2(e)',0,'l');
FBAsolution_2=optimizeCbModel(model,'max');
writetable(table(model.rxns,FBAsolution_2.x),'Supp_main_anaerobic.csv')
