[fluxes,model,labels,curlModelapp] = calculate_fluxes2;
CAKI1 = curlModelapp(7);
CAKI1_fluxes = fluxes(:,7);
C_model=CAKI1;
writetable(table(C_model.rxns,CAKI1_fluxes),'CAKI1_Normal_w_Arg_111515.csv');
newfluxes=abs(CAKI1_fluxes)*1000000;
newfluxes=log(newfluxes);
%laurence stuff
writetable(table(C_model.rxns,newfluxes),'CAKI1_Normal_w_Arg_111515.csv');
[fluxes,model,labels,curlModelapp] = calculate_fluxes3;
CAKI1 = curlModelapp(7);
CAKI1_fluxes = fluxes(:,7);
C_model=CAKI1;
writetable(table(C_model.rxns,CAKI1_fluxes),'CAKI1_Normal_WO_Arg_111515.csv');
newfluxes=abs(CAKI1_fluxes)*1000000;
newfluxes=log(newfluxes);
%laurence stuff to get rid of 0's
writetable(table(C_model.rxns,newfluxes),'CAKI1_Normal_WO_Arg_111515.csv');
[fluxes,model,labels,curlModelapp] = calculate_fluxes3;
CAKI1 = curlModelapp(7);
CAKI1_fluxes = fluxes(:,7);
C_model = CAKI1;
C_model = changeObjective(C_model,'ARGSS');
C_model = changeRxnBounds(C_model, 'ARGSS',0,'b');
FBAsolution = optimizeCbModel(C_model,'max');
newfluxes=abs(FBAsolution.x)*1000000;
newfluxes=log(newfluxes);
%laurence stuff
writetable(table(C_model.rxns,newfluxes),'CAKI1_Normal_WO_Arg_KO_111515.csv');
C_model = changeObjective(C_model,'AICART');
FBAsolution = optimizeCbModel(C_model,'max');
newfluxes=abs(FBAsolution.x)*1000000;
newfluxes=log(newfluxes);
%laurence stuff
writetable(table(C_model.rxns,newfluxes),'CAKI1_Normal_WO_Arg_KO_AICART_111515.csv');
C_model = addReaction(C_model,'AICAR_Drain',{'aicar[c]'},[-1],0,0,1000,0);
C_model = changeObjective(C_model,'AICAR_Drain');
FBAsolution = optimizeCbModel(C_model,'max');
newfluxes=abs(FBAsolution.x)*1000000;
newfluxes=log(newfluxes);
writetable(table(C_model.rxns,newfluxes),'CAKI1_Normal_WO_Arg_KO_AICART_Drain_111515.csv');