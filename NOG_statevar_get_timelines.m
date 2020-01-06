
%statevar_names = zeros(129,1);
index = 0;

%Membranes
index = index + 1;
sg = statevar_timelines(:,index);

index = index + 1;
nb1_cg = statevar_timelines(:,index);     

index = index + 1;
nb1_mtc = statevar_timelines(:,index);     

index = index + 1;
nb1_cpm = statevar_timelines(:,index);     

index = index + 1;
spm = statevar_timelines(:,index);     

index = index + 1;
na1_cg = statevar_timelines(:,index);

index = index + 1;
na1_mtc = statevar_timelines(:,index);     

index = index + 1;
na1_cpm = statevar_timelines(:,index);     

index = index + 1;
nb2_cg = statevar_timelines(:,index);     

index = index + 1;
nb2_mtc = statevar_timelines(:,index);     

index = index + 1;
nb2_cpm = statevar_timelines(:,index);     

index = index + 1;
na2_cg = statevar_timelines(:,index);     

index = index + 1;
na2_mtc = statevar_timelines(:,index);     

index = index + 1;
na2_cpm = statevar_timelines(:,index);     

index = index + 1;
s3 = statevar_timelines(:,index);     

%Snares YY
index = index + 1;
yy_g = statevar_timelines(:,index);     

index = index + 1;
yy_b1_cg = statevar_timelines(:,index);     

index = index + 1;
yy_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
yy_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
yy_pm = statevar_timelines(:,index);     

index = index + 1;
yy_a1_cg = statevar_timelines(:,index);

index = index + 1;
yy_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
yy_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
yy_b2_cg = statevar_timelines(:,index);     

index = index + 1;
yy_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
yy_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
yy_a2_cg = statevar_timelines(:,index);     

index = index + 1;
yy_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
yy_a2_cpm = statevar_timelines(:,index);     

%Snares VV
index = index + 1;
vv_g = statevar_timelines(:,index);     

index = index + 1;
vv_b1_cg = statevar_timelines(:,index);     

index = index + 1;
vv_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
vv_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
vv_pm = statevar_timelines(:,index);     

index = index + 1;
vv_a1_cg = statevar_timelines(:,index);

index = index + 1;
vv_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
vv_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
vv_b2_cg = statevar_timelines(:,index);     

index = index + 1;
 vv_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
vv_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
vv_a2_cg = statevar_timelines(:,index);     

index = index + 1;
vv_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
vv_a2_cpm = statevar_timelines(:,index);     


%Snares XX
index = index + 1;
xx_g = statevar_timelines(:,index);     

index = index + 1;
xx_b1_cg = statevar_timelines(:,index);     

index = index + 1;
xx_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
xx_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
xx_pm = statevar_timelines(:,index);     

index = index + 1;
xx_a1_cg = statevar_timelines(:,index);

index = index + 1;
xx_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
xx_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
xx_b2_cg = statevar_timelines(:,index);     

index = index + 1;
xx_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
xx_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
xx_a2_cg = statevar_timelines(:,index);     

index = index + 1;
xx_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
xx_a2_cpm = statevar_timelines(:,index);     


%Snares UU
index = index + 1;
uu_g = statevar_timelines(:,index);     

index = index + 1;
uu_b1_cg = statevar_timelines(:,index);     

index = index + 1;
 uu_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
 uu_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
uu_pm = statevar_timelines(:,index);     

index = index + 1;
 uu_a1_cg = statevar_timelines(:,index);

index = index + 1;
 uu_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
 uu_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
 uu_b2_cg = statevar_timelines(:,index);     

index = index + 1;
 uu_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
 uu_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
 uu_a2_cg = statevar_timelines(:,index);     

index = index + 1;
 uu_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
 uu_a2_cpm = statevar_timelines(:,index);     

%Kinesin-Receptor
index = index + 1;
 kk_g = statevar_timelines(:,index);     

index = index + 1;
 kk_b1_cg = statevar_timelines(:,index);     

index = index + 1;
 kk_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
 kk_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
 kk_pm = statevar_timelines(:,index);     

index = index + 1;
 kk_a1_cg = statevar_timelines(:,index);

index = index + 1;
 kk_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
 kk_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
 kk_b2_cg = statevar_timelines(:,index);     

index = index + 1;
 kk_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
 kk_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
 kk_a2_cg = statevar_timelines(:,index);     

index = index + 1;
 kk_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
 kk_a2_cpm = statevar_timelines(:,index);     

%Dynein-Receptor
index = index + 1;
 dd_g = statevar_timelines(:,index);     

index = index + 1;
 dd_b1_cg = statevar_timelines(:,index);     

index = index + 1;
 dd_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
 dd_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
 dd_pm = statevar_timelines(:,index);     

index = index + 1;
 dd_a1_cg = statevar_timelines(:,index);

index = index + 1;
 dd_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
 dd_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
 dd_b2_cg = statevar_timelines(:,index);     

index = index + 1;
 dd_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
 dd_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
 dd_a2_cg = statevar_timelines(:,index);     

index = index + 1;
 dd_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
 dd_a2_cpm = statevar_timelines(:,index);     

%Recruitment factor cc1-Receptor
index = index + 1;
 cc1_g = statevar_timelines(:,index);     

index = index + 1;
 cc1_b1_cg = statevar_timelines(:,index);     

index = index + 1;
 cc1_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc1_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
 cc1_pm = statevar_timelines(:,index);     

index = index + 1;
 cc1_a1_cg = statevar_timelines(:,index);

index = index + 1;
 cc1_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc1_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
 cc1_b2_cg = statevar_timelines(:,index);     

index = index + 1;
 cc1_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc1_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
 cc1_a2_cg = statevar_timelines(:,index);     

index = index + 1;
 cc1_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc1_a2_cpm = statevar_timelines(:,index);     


%Recruitment factor cc2
index = index + 1;
 cc2_g = statevar_timelines(:,index);     

index = index + 1;
 cc2_b1_cg = statevar_timelines(:,index);     

index = index + 1;
 cc2_b1_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc2_b1_cpm = statevar_timelines(:,index);     

index = index + 1;
 cc2_pm = statevar_timelines(:,index);     

index = index + 1;
 cc2_a1_cg = statevar_timelines(:,index);

index = index + 1;
 cc2_a1_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc2_a1_cpm = statevar_timelines(:,index);     

index = index + 1;
 cc2_b2_cg = statevar_timelines(:,index);     

index = index + 1;
 cc2_b2_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc2_b2_cpm = statevar_timelines(:,index);     

index = index + 1;
 cc2_a2_cg = statevar_timelines(:,index);     

index = index + 1;
 cc2_a2_mtc = statevar_timelines(:,index);     

index = index + 1;
 cc2_a2_cpm = statevar_timelines(:,index);     

index = index + 1;
effective_tubulin = statevar_timelines(:,index);

index = index + 1;
dyn_MTs = statevar_timelines(:,index);

index = index + 1;
stbl_MTs_length = statevar_timelines(:,index);

index = index + 1;
total_membrane = statevar_timelines(:,index);
