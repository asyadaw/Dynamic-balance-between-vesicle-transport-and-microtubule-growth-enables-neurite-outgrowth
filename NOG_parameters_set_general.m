%Factors for site specific events
factor_for_site_specific_budding = 0.1;
factor_for_site_specific_SNARE_complex_formation = 0.1;

%% parameters related to sensitivity analysis and parameter estimation

Max_size_spm = 50; %um^2
radius_neurite = 0.5; %um
growth_cone_length = 10; %um
cg_length = 1;
distance_mtc_growthConeTip = 2; %um
MTs_per_crosssection = 20; % # number of MTs
%mtBlock_length = 60; 
%mtBlock_tubulinDimers = (mtBlock_length * MTs_per_crosssection) * 13/8; %8nm is the length of 1 tubulin dimer, 13 protofilaments per MT
% scale_initial_a = 0.00016757; 
% scale_exp_a = 1.0311; 
% scale_initial_b = 8.7342e-19; 
% scale_exp_b = 4.2122; 
% dynMT_degradation_exp_b = -12.78;
% dynMT_degradation_multiplier_a = 2.93e10;
% shape_m = 0.089898; 
% shape_b = 0.15547; 

% % ##### Average dyn MT length Parameters #######
p00 =      -93.85; 
p10 =       92.94;
p01 =        -752 ;
p20 =      -10.17;
p11 =      -13.45;
p02 =        1159 ;
p30 =      0.9806;
p21 =      -21.02; 
p12 =       260.1; 
p03 =       -1588;
 
%###################
% % ##### degradation rate Parameters #######
d00 =      0.1521;
d10 =    -0.08605;
d01 =      0.5545;
d20 =     0.01416;
d11 =     -0.1517;
d02 =      0.2859;
d30 =  -0.000649; 
d21 =    0.007209;
d12 =    0.004233;
d03 =     -0.1453;
%###################

with_MTC_growth = false;
MTC_length_at_start = 10;

% Constant Kinesin and dynein velocities
velocity_k = 60;%60; % known from litrature, um/min
velocity_d = 39;%39; % known from litrature, um/min

% Constant vesicle surface areas
antero_vesicle_surface_area = 0.05;%um2
retro_vesicle_surface_area = 0.05;%um2

% parameters for SNARE dissociation from coat proteins
kxa  = 1; 
kua = 1; 
kxb = 10000; 
kub = 100; 
kya = 10000; 
kva = 100; 
kyb = 1; 
kvb = 1; 
snare_binding_spots_per_vesicle_area = 70 / antero_vesicle_surface_area;

% parameters for cargo dissociation from coat proteins
kc1a = 1; 
kc1b = 100000; 
kc2a = 100000; 
kc2b = 1; 
cargo_binding_spots_per_vesicle_area = 0.1 / antero_vesicle_surface_area;

% parameters for motor protein dissociation from coat proteins
kkb = 0.1;% 0.001;%0.1; 
kda = 0.1;% 0.001;%0.1; 
kka = 10;% 0.5;%100 * kkb; 
kdb = 10;% 0.5;%100 * kda; 
motor_binding_spots_per_vesicle_area = 7 / antero_vesicle_surface_area;

% Transmembrane protein production rates
k_yy_production = 0;
k_vv_production = 0;
k_xx_production = 0;
k_uu_production = 0;
k_kk_production = 0;
k_dd_production = 0;
k_cc1_production = 0;
k_cc2_production = 0;

% Budding rate constants
wa_pm =  0.5/5000;%0.83;% 
wa_g =  wa_pm * factor_for_site_specific_budding;%0.83;% 
wb_g =  0.5/5000;%0.2
wb_pm =  wb_g * factor_for_site_specific_budding;%0.83;% 

%Fraction of bound kinesin molecules
fraction_bound_kk_a1b1_cg = 0.95;   % evaluate diffusion distance to define cg_length
fraction_bound_kk_a1b1_mtc = 0.08;
fraction_bound_kk_a1b1_cpm = 0;%0.01;

%Fraction of bound dynein molecules
fraction_bound_dd_a2b2_cpm = fraction_bound_kk_a1b1_cg;
fraction_bound_dd_a2b2_mtc = 0.84;
fraction_bound_dd_a2b2_cg = fraction_bound_kk_a1b1_cpm;

% SNARE complex formation rates
kappaXU_g = 0.773*1e-5; % 40 gestimated
kappaXU_pm = kappaXU_g * factor_for_site_specific_SNARE_complex_formation;%0; % 40 gestimated

kappaYV_pm = 0.85*1e-6; %% 40 gestimated
kappaYV_g = kappaYV_pm * factor_for_site_specific_SNARE_complex_formation;%0; %% 40 gestimated
snare_complexes_per_vesicle_fusion = 5; %not considered
%%%%%%%%%%% Define special parameters

k_membrane_production = 0;%.25; % 
nucleation_rate = 0.2; 
stabilization_rate = 0.01; 
