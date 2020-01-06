function [d_statevar,t] = NOG_function(t,statevar,parameters,statevar_input,statevar_buffer)
% function [deriv] = NOG_vesicular_transport_MT_growth(t,statevar,constant_molecules,k,Km)

global Output_fluxes
global Output_time


NOG_statevar_get;
NOG_parameters_get_from_vector;

%% Model dynamic microtubules


%% Integration of MTB with Vesicular model
% alpha = 1;
NOG_function1_microtubule;
NOG_function2_get_concentrations;
NOG_function3_get_saturations;
NOG_function4_calculate_membrane_fluxes;
NOG_function5_calculate_molecule_fluxes;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
%% ############
d_total_membrane = k_membrane_production;

% differential equations for sizes of compartments G and PM
d_sg    =  -     a1_g_into_cg -     b1_g_into_cg +     a1_cg_into_g +     b1_cg_into_g +     a2_cg_into_g +     b2_cg_into_g + k_membrane_production;
d_xx_g  =  -  xx_a1_g_into_cg -  xx_b1_g_into_cg +  xx_a1_cg_into_g +  xx_b1_cg_into_g +  xx_a2_cg_into_g +  xx_b2_cg_into_g + k_xx_production;
d_uu_g  =  -  uu_a1_g_into_cg -  uu_b1_g_into_cg +  uu_a1_cg_into_g +  uu_b1_cg_into_g +  uu_a2_cg_into_g +  uu_b2_cg_into_g + k_uu_production;
d_yy_g  =  -  yy_a1_g_into_cg -  yy_b1_g_into_cg +  yy_a1_cg_into_g +  yy_b1_cg_into_g +  yy_a2_cg_into_g +  yy_b2_cg_into_g + k_yy_production;
d_vv_g  =  -  vv_a1_g_into_cg -  vv_b1_g_into_cg +  vv_a1_cg_into_g +  vv_b1_cg_into_g +  vv_a2_cg_into_g +  vv_b2_cg_into_g + k_vv_production;
d_cc1_g =  - cc1_a1_g_into_cg - cc1_b1_g_into_cg + cc1_a1_cg_into_g + cc1_b1_cg_into_g + cc1_a2_cg_into_g + cc1_b2_cg_into_g + k_cc1_production;
d_cc2_g =  - cc2_a1_g_into_cg - cc2_b1_g_into_cg + cc2_a1_cg_into_g + cc2_b1_cg_into_g + cc2_a2_cg_into_g + cc2_b2_cg_into_g + k_cc2_production;
d_kk_g  =  -  kk_a1_g_into_cg -  kk_b1_g_into_cg +  kk_a1_cg_into_g +  kk_b1_cg_into_g +  kk_a2_cg_into_g +  kk_b2_cg_into_g + k_kk_production;
d_dd_g  =  -  dd_a1_g_into_cg -  dd_b1_g_into_cg +  dd_a1_cg_into_g +  dd_b1_cg_into_g +  dd_a2_cg_into_g +  dd_b2_cg_into_g + k_dd_production;

d_spm     = -     a2_pm_into_cpm -     b2_pm_into_cpm +     a2_cpm_into_pm +     b2_cpm_into_pm +     a1_cpm_into_pm +     b1_cpm_into_pm;
d_xx_pm  = -  xx_a2_pm_into_cpm -  xx_b2_pm_into_cpm +  xx_a2_cpm_into_pm +  xx_b2_cpm_into_pm +  xx_a1_cpm_into_pm +  xx_b1_cpm_into_pm;
d_uu_pm  = -  uu_a2_pm_into_cpm -  uu_b2_pm_into_cpm +  uu_a2_cpm_into_pm +  uu_b2_cpm_into_pm +  uu_a1_cpm_into_pm +  uu_b1_cpm_into_pm;
d_yy_pm  = -  yy_a2_pm_into_cpm -  yy_b2_pm_into_cpm +  yy_a2_cpm_into_pm +  yy_b2_cpm_into_pm +  yy_a1_cpm_into_pm +  yy_b1_cpm_into_pm;
d_vv_pm  = -  vv_a2_pm_into_cpm -  vv_b2_pm_into_cpm +  vv_a2_cpm_into_pm +  vv_b2_cpm_into_pm +  vv_a1_cpm_into_pm +  vv_b1_cpm_into_pm;
d_cc1_pm = - cc1_a2_pm_into_cpm - cc1_b2_pm_into_cpm + cc1_a2_cpm_into_pm + cc1_b2_cpm_into_pm + cc1_a1_cpm_into_pm + cc1_b1_cpm_into_pm;
d_cc2_pm = - cc2_a2_pm_into_cpm - cc2_b2_pm_into_cpm + cc2_a2_cpm_into_pm + cc2_b2_cpm_into_pm + cc2_a1_cpm_into_pm + cc2_b1_cpm_into_pm;
d_kk_pm  = -  kk_a2_pm_into_cpm -  kk_b2_pm_into_cpm +  kk_a2_cpm_into_pm +  kk_b2_cpm_into_pm +  kk_a1_cpm_into_pm +  kk_b1_cpm_into_pm;        
d_dd_pm  = -  dd_a2_pm_into_cpm -  dd_b2_pm_into_cpm +  dd_a2_cpm_into_pm +  dd_b2_cpm_into_pm +  dd_a1_cpm_into_pm +  dd_b1_cpm_into_pm;         

d_s3 = 0;

if (d_spm>0)
    if (spm + d_spm > Max_size_spm)
        d_s3 = spm + d_spm - Max_size_spm;
        d_spm = Max_size_spm - spm;
    end
elseif (d_spm<0)
    if (s3>0)
        d_s3 = d_spm;
        if (abs(d_s3)>s3)
            d_s3 = -s3;
            d_spm = d_spm - d_s3;
        else
            d_spm =0;
        end
    end
end

% Differential equations for No of vesicles in cg, MTC and CPM compartment - forward

%Delta cytosol golgi
   d_na1_cg =     a1_g_into_cg -     a1_cg_into_g -     a1_cg_into_mtc; 
 d_xx_a1_cg =  xx_a1_g_into_cg -  xx_a1_cg_into_g -  xx_a1_cg_into_mtc; 
 d_uu_a1_cg =  uu_a1_g_into_cg -  uu_a1_cg_into_g -  uu_a1_cg_into_mtc; 
 d_yy_a1_cg =  yy_a1_g_into_cg -  yy_a1_cg_into_g -  yy_a1_cg_into_mtc; 
 d_vv_a1_cg =  vv_a1_g_into_cg -  vv_a1_cg_into_g -  vv_a1_cg_into_mtc; 
d_cc1_a1_cg = cc1_a1_g_into_cg - cc1_a1_cg_into_g - cc1_a1_cg_into_mtc; 
d_cc2_a1_cg = cc2_a1_g_into_cg - cc2_a1_cg_into_g - cc2_a1_cg_into_mtc; 
 d_kk_a1_cg =  kk_a1_g_into_cg -  kk_a1_cg_into_g -  kk_a1_cg_into_mtc;
 d_dd_a1_cg =  dd_a1_g_into_cg -  dd_a1_cg_into_g -  dd_a1_cg_into_mtc;

   d_nb1_cg =     b1_g_into_cg -     b1_cg_into_g -     b1_cg_into_mtc; 
 d_xx_b1_cg =  xx_b1_g_into_cg -  xx_b1_cg_into_g -  xx_b1_cg_into_mtc;
 d_uu_b1_cg =  uu_b1_g_into_cg -  uu_b1_cg_into_g -  uu_b1_cg_into_mtc;
 d_yy_b1_cg =  yy_b1_g_into_cg -  yy_b1_cg_into_g -  yy_b1_cg_into_mtc;  
 d_vv_b1_cg =  vv_b1_g_into_cg -  vv_b1_cg_into_g -  vv_b1_cg_into_mtc; 
d_cc1_b1_cg = cc1_b1_g_into_cg - cc1_b1_cg_into_g - cc1_b1_cg_into_mtc; 
d_cc2_b1_cg = cc2_b1_g_into_cg - cc2_b1_cg_into_g - cc2_b1_cg_into_mtc; 
 d_kk_b1_cg =  kk_b1_g_into_cg -  kk_b1_cg_into_g -  kk_b1_cg_into_mtc;
 d_dd_b1_cg =  dd_b1_g_into_cg -  dd_b1_cg_into_g -  dd_b1_cg_into_mtc;

   d_na2_cg =     a2_mtc_into_cg -     a2_cg_into_g; 
 d_xx_a2_cg =  xx_a2_mtc_into_cg -  xx_a2_cg_into_g; 
 d_uu_a2_cg =  uu_a2_mtc_into_cg -  uu_a2_cg_into_g; 
 d_yy_a2_cg =  yy_a2_mtc_into_cg -  yy_a2_cg_into_g; 
 d_vv_a2_cg =  vv_a2_mtc_into_cg -  vv_a2_cg_into_g;
d_cc1_a2_cg = cc1_a2_mtc_into_cg - cc1_a2_cg_into_g; 
d_cc2_a2_cg = cc2_a2_mtc_into_cg - cc2_a2_cg_into_g; 
 d_kk_a2_cg =  kk_a2_mtc_into_cg -  kk_a2_cg_into_g; 
 d_dd_a2_cg =  dd_a2_mtc_into_cg -  dd_a2_cg_into_g;

   d_nb2_cg =     b2_mtc_into_cg -     b2_cg_into_g; 
 d_xx_b2_cg =  xx_b2_mtc_into_cg -  xx_b2_cg_into_g; 
 d_uu_b2_cg =  uu_b2_mtc_into_cg -  uu_b2_cg_into_g; 
 d_yy_b2_cg =  yy_b2_mtc_into_cg -  yy_b2_cg_into_g; 
 d_vv_b2_cg =  vv_b2_mtc_into_cg -  vv_b2_cg_into_g;
d_cc1_b2_cg = cc1_b2_mtc_into_cg - cc1_b2_cg_into_g;
d_cc2_b2_cg = cc2_b2_mtc_into_cg - cc2_b2_cg_into_g;
 d_kk_b2_cg =  kk_b2_mtc_into_cg -  kk_b2_cg_into_g; 
 d_dd_b2_cg =  dd_b2_mtc_into_cg -  dd_b2_cg_into_g;

%Delta MTC
   d_na1_mtc =     a1_cg_into_mtc -     a1_mtc_into_cpm;
 d_xx_a1_mtc =  xx_a1_cg_into_mtc -  xx_a1_mtc_into_cpm; 
 d_uu_a1_mtc =  uu_a1_cg_into_mtc -  uu_a1_mtc_into_cpm; 
 d_yy_a1_mtc =  yy_a1_cg_into_mtc -  yy_a1_mtc_into_cpm; 
 d_vv_a1_mtc =  vv_a1_cg_into_mtc -  vv_a1_mtc_into_cpm;   
d_cc1_a1_mtc = cc1_a1_cg_into_mtc - cc1_a1_mtc_into_cpm; 
d_cc2_a1_mtc = cc2_a1_cg_into_mtc - cc2_a1_mtc_into_cpm;
 d_kk_a1_mtc =  kk_a1_cg_into_mtc -  kk_a1_mtc_into_cpm;
 d_dd_a1_mtc =  dd_a1_cg_into_mtc -  dd_a1_mtc_into_cpm;

   d_nb1_mtc =     b1_cg_into_mtc -     b1_mtc_into_cpm; 
 d_xx_b1_mtc =  xx_b1_cg_into_mtc -  xx_b1_mtc_into_cpm; 
 d_uu_b1_mtc =  uu_b1_cg_into_mtc -  uu_b1_mtc_into_cpm;  
 d_yy_b1_mtc =  yy_b1_cg_into_mtc -  yy_b1_mtc_into_cpm; 
 d_vv_b1_mtc =  vv_b1_cg_into_mtc -  vv_b1_mtc_into_cpm; 
d_cc1_b1_mtc = cc1_b1_cg_into_mtc - cc1_b1_mtc_into_cpm;
d_cc2_b1_mtc = cc2_b1_cg_into_mtc - cc2_b1_mtc_into_cpm;
 d_kk_b1_mtc =  kk_b1_cg_into_mtc -  kk_b1_mtc_into_cpm;   
 d_dd_b1_mtc =  dd_b1_cg_into_mtc -  dd_b1_mtc_into_cpm;   

   d_na2_mtc =     a2_cpm_into_mtc -     a2_mtc_into_cg;
 d_xx_a2_mtc =  xx_a2_cpm_into_mtc -  xx_a2_mtc_into_cg;
 d_uu_a2_mtc =  uu_a2_cpm_into_mtc -  uu_a2_mtc_into_cg;
 d_yy_a2_mtc =  yy_a2_cpm_into_mtc -  yy_a2_mtc_into_cg; 
 d_vv_a2_mtc =  vv_a2_cpm_into_mtc -  vv_a2_mtc_into_cg;
d_cc1_a2_mtc = cc1_a2_cpm_into_mtc - cc1_a2_mtc_into_cg;
d_cc2_a2_mtc = cc2_a2_cpm_into_mtc - cc2_a2_mtc_into_cg;
 d_kk_a2_mtc =  kk_a2_cpm_into_mtc -  kk_a2_mtc_into_cg;
 d_dd_a2_mtc =  dd_a2_cpm_into_mtc -  dd_a2_mtc_into_cg;

   d_nb2_mtc =     b2_cpm_into_mtc -     b2_mtc_into_cg; 
 d_xx_b2_mtc =  xx_b2_cpm_into_mtc -  xx_b2_mtc_into_cg; 
 d_uu_b2_mtc =  uu_b2_cpm_into_mtc -  uu_b2_mtc_into_cg; 
 d_yy_b2_mtc =  yy_b2_cpm_into_mtc -  yy_b2_mtc_into_cg; 
 d_vv_b2_mtc =  vv_b2_cpm_into_mtc -  vv_b2_mtc_into_cg;
d_cc2_b2_mtc = cc2_b2_cpm_into_mtc - cc2_b2_mtc_into_cg;          
d_cc1_b2_mtc = cc1_b2_cpm_into_mtc - cc1_b2_mtc_into_cg;          
 d_dd_b2_mtc =  dd_b2_cpm_into_mtc -  dd_b2_mtc_into_cg;
 d_kk_b2_mtc =  kk_b2_cpm_into_mtc -  kk_b2_mtc_into_cg;
 
%Delta cpm
  d_na1_cpm  =     a1_mtc_into_cpm -     a1_cpm_into_pm;
d_xx_a1_cpm  =  xx_a1_mtc_into_cpm -  xx_a1_cpm_into_pm;
d_uu_a1_cpm  =  uu_a1_mtc_into_cpm -  uu_a1_cpm_into_pm;
d_yy_a1_cpm  =  yy_a1_mtc_into_cpm -  yy_a1_cpm_into_pm;
d_vv_a1_cpm  =  vv_a1_mtc_into_cpm -  vv_a1_cpm_into_pm;
d_cc1_a1_cpm = cc1_a1_mtc_into_cpm - cc1_a1_cpm_into_pm;
d_cc2_a1_cpm = cc2_a1_mtc_into_cpm - cc2_a1_cpm_into_pm;
d_kk_a1_cpm  =  kk_a1_mtc_into_cpm -  kk_a1_cpm_into_pm;
d_dd_a1_cpm  =  dd_a1_mtc_into_cpm -  dd_a1_cpm_into_pm;

  d_nb1_cpm  =     b1_mtc_into_cpm -     b1_cpm_into_pm;
d_xx_b1_cpm  =  xx_b1_mtc_into_cpm -  xx_b1_cpm_into_pm;
d_uu_b1_cpm  =  uu_b1_mtc_into_cpm -  uu_b1_cpm_into_pm;
d_yy_b1_cpm  =  yy_b1_mtc_into_cpm -  yy_b1_cpm_into_pm;
d_vv_b1_cpm  =  vv_b1_mtc_into_cpm -  vv_b1_cpm_into_pm;
d_cc1_b1_cpm = cc1_b1_mtc_into_cpm - cc1_b1_cpm_into_pm;
d_cc2_b1_cpm = cc2_b1_mtc_into_cpm - cc2_b1_cpm_into_pm;
d_kk_b1_cpm  =  kk_b1_mtc_into_cpm -  kk_b1_cpm_into_pm;
d_dd_b1_cpm  =  dd_b1_mtc_into_cpm -  dd_b1_cpm_into_pm;

   d_na2_cpm  =     a2_pm_into_cpm  -     a2_cpm_into_pm -     a2_cpm_into_mtc;
 d_xx_a2_cpm  =  xx_a2_pm_into_cpm  -  xx_a2_cpm_into_pm -  xx_a2_cpm_into_mtc;
 d_uu_a2_cpm  =  uu_a2_pm_into_cpm  -  uu_a2_cpm_into_pm -  uu_a2_cpm_into_mtc;
 d_yy_a2_cpm  =  yy_a2_pm_into_cpm  -  yy_a2_cpm_into_pm -  yy_a2_cpm_into_mtc;
 d_vv_a2_cpm  =  vv_a2_pm_into_cpm  -  vv_a2_cpm_into_pm -  vv_a2_cpm_into_mtc;
d_cc1_a2_cpm  =  cc1_a2_pm_into_cpm - cc1_a2_cpm_into_pm - cc1_a2_cpm_into_mtc;
d_cc2_a2_cpm  =  cc2_a2_pm_into_cpm - cc2_a2_cpm_into_pm - cc2_a2_cpm_into_mtc;
 d_kk_a2_cpm  =  kk_a2_pm_into_cpm  -  kk_a2_cpm_into_pm -  kk_a2_cpm_into_mtc;
 d_dd_a2_cpm  =  dd_a2_pm_into_cpm  -  dd_a2_cpm_into_pm -  dd_a2_cpm_into_mtc;

  d_nb2_cpm  =      b2_pm_into_cpm -     b2_cpm_into_pm -     b2_cpm_into_mtc;
d_xx_b2_cpm  =   xx_b2_pm_into_cpm -  xx_b2_cpm_into_pm -  xx_b2_cpm_into_mtc;
d_uu_b2_cpm  =   uu_b2_pm_into_cpm -  uu_b2_cpm_into_pm -  uu_b2_cpm_into_mtc;
d_yy_b2_cpm  =   yy_b2_pm_into_cpm -  yy_b2_cpm_into_pm -  yy_b2_cpm_into_mtc; 
d_vv_b2_cpm  =   vv_b2_pm_into_cpm -  vv_b2_cpm_into_pm -  vv_b2_cpm_into_mtc;
d_cc1_b2_cpm =  cc1_b2_pm_into_cpm - cc1_b2_cpm_into_pm - cc1_b2_cpm_into_mtc;
d_cc2_b2_cpm =  cc2_b2_pm_into_cpm - cc2_b2_cpm_into_pm - cc2_b2_cpm_into_mtc;
d_kk_b2_cpm  =   kk_b2_pm_into_cpm -  kk_b2_cpm_into_pm -  kk_b2_cpm_into_mtc;
d_dd_b2_cpm  =   dd_b2_pm_into_cpm -  dd_b2_cpm_into_pm -  dd_b2_cpm_into_mtc;




%***********************
   B = [   a1_g_into_cg,       a1_cg_into_mtc,      a1_mtc_into_cpm,     a1_cpm_into_pm,...%4
           b1_g_into_cg,       b1_cg_into_mtc,      b1_mtc_into_cpm,     b1_cpm_into_pm,...%8
           a2_cg_into_g,       a2_mtc_into_cg,      a2_cpm_into_mtc,     a2_pm_into_cpm,...%12
           b2_cg_into_g,       b2_mtc_into_cg,      b2_cpm_into_mtc,     b2_pm_into_cpm,...%12          
           xx_a1_g_into_cg,    xx_a1_cg_into_mtc,   xx_a1_mtc_into_cpm,  xx_a1_cpm_into_pm,...%20
           xx_b1_g_into_cg,    xx_b1_cg_into_mtc,   xx_b1_mtc_into_cpm,  xx_b1_cpm_into_pm,...%24
           xx_a2_cg_into_g,    xx_a2_mtc_into_cg,   xx_a2_cpm_into_mtc,  xx_a2_pm_into_cpm,...%28 
           xx_b2_cg_into_g,    xx_b2_mtc_into_cg,   xx_b2_cpm_into_mtc,  xx_b2_pm_into_cpm,...%32                   
           uu_a1_g_into_cg,    uu_a1_cg_into_mtc,   uu_a1_mtc_into_cpm,  uu_a1_cpm_into_pm,...%36
           uu_b1_g_into_cg,    uu_b1_cg_into_mtc,   uu_b1_mtc_into_cpm,  uu_b1_cpm_into_pm,...%40
           uu_a2_cg_into_g,    uu_a2_mtc_into_cg,   uu_a2_cpm_into_mtc,  uu_a2_pm_into_cpm,...%44
           uu_b2_cg_into_g,    uu_b2_mtc_into_cg,   uu_b2_cpm_into_mtc,  uu_b2_pm_into_cpm,...%48                               
           yy_a1_g_into_cg,    yy_a1_cg_into_mtc,   yy_a1_mtc_into_cpm,  yy_a1_cpm_into_pm,...%52
           yy_b1_g_into_cg,    yy_b1_cg_into_mtc,   yy_b1_mtc_into_cpm,  yy_b1_cpm_into_pm,...%56          
           yy_a2_cg_into_g,    yy_a2_mtc_into_cg,   yy_a2_cpm_into_mtc,  yy_a2_pm_into_cpm,...%60
           yy_b2_cg_into_g,    yy_b2_mtc_into_cg,   yy_b2_cpm_into_mtc,  yy_b2_pm_into_cpm,...%64                      
           vv_a1_g_into_cg,    vv_a1_cg_into_mtc,   vv_a1_mtc_into_cpm,  vv_a1_cpm_into_pm,...%68
           vv_b1_g_into_cg,    vv_b1_cg_into_mtc,   vv_b1_mtc_into_cpm,  vv_b1_cpm_into_pm,...%72           
           vv_a2_cg_into_g,    vv_a2_mtc_into_cg,   vv_a2_cpm_into_mtc,  vv_a2_pm_into_cpm,...%76
           vv_b2_cg_into_g,    vv_b2_mtc_into_cg,   vv_b2_cpm_into_mtc,  vv_b2_pm_into_cpm,...%80                             
           cc1_a1_g_into_cg,   cc1_a1_cg_into_mtc,  cc1_a1_mtc_into_cpm, cc1_a1_cpm_into_pm,...%84
           cc1_b1_g_into_cg,   cc1_b1_cg_into_mtc,  cc1_b1_mtc_into_cpm, cc1_b1_cpm_into_pm,...%88           
           cc1_a2_cg_into_g,    cc1_a2_mtc_into_cg,   cc1_a2_cpm_into_mtc,  cc1_a2_pm_into_cpm,...%92
           cc1_b2_cg_into_g,    cc1_b2_mtc_into_cg,   cc1_b2_cpm_into_mtc,  cc1_b2_pm_into_cpm,...%96  
           cc2_a1_g_into_cg,   cc2_a1_cg_into_mtc,  cc2_a1_mtc_into_cpm, cc2_a1_cpm_into_pm,...%100
           cc2_b1_g_into_cg,   cc2_b1_cg_into_mtc,  cc2_b1_mtc_into_cpm, cc2_b1_cpm_into_pm,...%104           
           cc2_a2_cg_into_g,    cc2_a2_mtc_into_cg,   cc2_a2_cpm_into_mtc,  cc2_a2_pm_into_cpm,...%108
           cc2_b2_cg_into_g,    cc2_b2_mtc_into_cg,   cc2_b2_cpm_into_mtc,  cc2_b2_pm_into_cpm,...%112  
           kk_a1_g_into_cg,    kk_a1_cg_into_mtc,   kk_a1_mtc_into_cpm,  kk_a1_cpm_into_pm,...%116
           kk_b1_g_into_cg,    kk_b1_cg_into_mtc,   kk_b1_mtc_into_cpm,  kk_b1_cpm_into_pm,...%120
           kk_a2_cg_into_g,    kk_a2_mtc_into_cg,   kk_a2_cpm_into_mtc,  kk_a2_pm_into_cpm,...%124
           kk_b2_cg_into_g,    kk_b2_mtc_into_cg,   kk_b2_cpm_into_mtc,  kk_b2_pm_into_cpm,...%128           
           dd_a1_g_into_cg,    dd_a1_cg_into_mtc,   dd_a1_mtc_into_cpm,  dd_a1_cpm_into_pm,...%132
           dd_b1_g_into_cg,    dd_b1_cg_into_mtc,   dd_b1_mtc_into_cpm,  dd_b1_cpm_into_pm,...%136
           dd_a2_cg_into_g,    dd_a2_mtc_into_cg,   dd_a2_cpm_into_mtc,  dd_a2_pm_into_cpm,...%140
           dd_b2_cg_into_g,    dd_b2_mtc_into_cg,   dd_b2_cpm_into_mtc,  dd_b2_pm_into_cpm,...%144                      
           k_per_vesicle_a1_cg,        k_per_vesicle_a1_mtc,        k_per_vesicle_a1_cpm,...%147
           k_per_vesicle_b1_cg,        k_per_vesicle_b1_mtc,        k_per_vesicle_b1_cpm,...%150
           d_per_vesicle_a2_cg,        d_per_vesicle_a2_mtc,        d_per_vesicle_a2_cpm,...%153
           d_per_vesicle_b2_cg,        d_per_vesicle_b2_mtc,        d_per_vesicle_b2_cpm,...%156
           fraction_bound_kk_a1b1_mtc, fraction_bound_na1_mtc,      fraction_bound_nb1_mtc,...%159
           fraction_bound_dd_a2b2_mtc, fraction_bound_na2_mtc,      fraction_bound_nb2_mtc,...%162
           fraction_bound_kk_a1b1_cg,  fraction_bound_na1_cg,       fraction_bound_nb1_cg,...%165
           fraction_bound_dd_a2b2_cpm, fraction_bound_na2_cg,       fraction_bound_nb2_cg,...%168
           fraction_bound_kk_a1b1_cpm, fraction_bound_na1_cpm,      fraction_bound_nb1_cpm,...%171
           fraction_bound_dd_a2b2_cpm, fraction_bound_na2_cpm,      fraction_bound_nb2_cpm,...%173
           d_s3];%,...
           %snareYVcomplexes_b1_cpm_pm,snareXUcomplexes_b1_cm_pm,snareYVcomplexes_a2_cpm_pm,snareXUcomplexes_a2_cpm_pm,snareYVcomplexes_a2_cg_g,snareXUcomplexes_a2_cg_g];%,...
%            dyn_MTs_length,stbl_MTs_length, MTU_length];%, velocity_b1_mtc_to_cpm, velocity_a1_mtc_to_cpm, velocity_a2_mtc_to_cg, velocity_b2_mtc_to_cg];

         %  fraction_bound_na1, fraction_bound_nb1, fraction_bound_na2, fraction_bound_nb2,...
       
Output_fluxes = vertcat(Output_fluxes,B); 
Output_time   = vertcat(Output_time,t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
d_statevar = [ 
 
%Membranes
d_sg;
d_nb1_cg;     
d_nb1_mtc;     
d_nb1_cpm;     
d_spm;     
d_na1_cg;
d_na1_mtc;     
d_na1_cpm;     
d_nb2_cg;     
d_nb2_mtc;     
d_nb2_cpm;     
d_na2_cg;     
d_na2_mtc;     
d_na2_cpm;     
d_s3;     
%Snares YY
d_yy_g;     
d_yy_b1_cg;     
d_yy_b1_mtc;     
d_yy_b1_cpm;     
d_yy_pm;     
d_yy_a1_cg;
d_yy_a1_mtc;     
d_yy_a1_cpm;     
d_yy_b2_cg;     
d_yy_b2_mtc;     
d_yy_b2_cpm;     
d_yy_a2_cg;     
d_yy_a2_mtc;     
d_yy_a2_cpm;     
%Snares VV
d_vv_g;     
d_vv_b1_cg;     
d_vv_b1_mtc;     
d_vv_b1_cpm;     
d_vv_pm;     
d_vv_a1_cg;
d_vv_a1_mtc;     
d_vv_a1_cpm;     
d_vv_b2_cg;     
d_vv_b2_mtc;     
d_vv_b2_cpm;     
d_vv_a2_cg;     
d_vv_a2_mtc;     
d_vv_a2_cpm;     
%Snares XX
d_xx_g;     
d_xx_b1_cg;     
d_xx_b1_mtc;     
d_xx_b1_cpm;     
d_xx_pm;     
d_xx_a1_cg;
d_xx_a1_mtc;     
d_xx_a1_cpm;     
d_xx_b2_cg;     
d_xx_b2_mtc;     
d_xx_b2_cpm;     
d_xx_a2_cg;     
d_xx_a2_mtc;     
d_xx_a2_cpm;     
%Snares UU
d_uu_g;     
d_uu_b1_cg;     
d_uu_b1_mtc;     
d_uu_b1_cpm;     
d_uu_pm;     
d_uu_a1_cg;
d_uu_a1_mtc;     
d_uu_a1_cpm;     
d_uu_b2_cg;     
d_uu_b2_mtc;     
d_uu_b2_cpm;     
d_uu_a2_cg;     
d_uu_a2_mtc;     
d_uu_a2_cpm;     
%Kinesin-Receptor
d_kk_g;     
d_kk_b1_cg;     
d_kk_b1_mtc;     
d_kk_b1_cpm;     
d_kk_pm;     
d_kk_a1_cg;
d_kk_a1_mtc;     
d_kk_a1_cpm;     
d_kk_b2_cg;     
d_kk_b2_mtc;     
d_kk_b2_cpm;     
d_kk_a2_cg;     
d_kk_a2_mtc;     
d_kk_a2_cpm;     

%Dynein-Receptor
d_dd_g;     
d_dd_b1_cg;     
d_dd_b1_mtc;     
d_dd_b1_cpm;     
d_dd_pm;     
d_dd_a1_cg;
d_dd_a1_mtc;     
d_dd_a1_cpm;     
d_dd_b2_cg;     
d_dd_b2_mtc;     
d_dd_b2_cpm;     
d_dd_a2_cg;     
d_dd_a2_mtc;     
d_dd_a2_cpm;     

%Recruitment factor cc1-Receptor
d_cc1_g;     
d_cc1_b1_cg;     
d_cc1_b1_mtc;     
d_cc1_b1_cpm;     
d_cc1_pm;     
d_cc1_a1_cg;
d_cc1_a1_mtc;     
d_cc1_a1_cpm;     
d_cc1_b2_cg;     
d_cc1_b2_mtc;     
d_cc1_b2_cpm;     
d_cc1_a2_cg;     
d_cc1_a2_mtc;     
d_cc1_a2_cpm;     

%Recruitment factor cc2
d_cc2_g;     
d_cc2_b1_cg;     
d_cc2_b1_mtc;     
d_cc2_b1_cpm;     
d_cc2_pm;     
d_cc2_a1_cg;
d_cc2_a1_mtc;     
d_cc2_a1_cpm;     
d_cc2_b2_cg;     
d_cc2_b2_mtc;     
d_cc2_b2_cpm;     
d_cc2_a2_cg;     
d_cc2_a2_mtc;     
d_cc2_a2_cpm;     

%Neurite shaft plasma membrane
d_effective_tubulin;
d_dyn_MTs;
d_average_dyn_MTs_length;
d_stbl_MTs_length;
d_total_membrane;

 ];

length_d_statevar = length(d_statevar);

for (indexState = 1:length_d_statevar)
   if (statevar_buffer(indexState))
      d_statevar(indexState) = 0; 
   end
end

end
 


