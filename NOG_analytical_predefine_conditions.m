%Set fixed rates
NOG_parameters_set_general;

MTC_length_at_start = 20;
cycling_rate = 0.5;
anticipated_fraction_of_bound_b1_vesicles_in_mtc = 0.1;
anticipated_fraction_of_fusing_b1_vesicles_in_cpm = 0.1;
anticipated_fraction_of_bound_a2_vesicles_in_mtc = 0.9;
anticipated_fraction_of_fusing_a2_vesicles_in_cg = 0.9;
%anticipated_fraction_of_bound_b1_vesicles_in_cg = 0.95;
%anticipated_fraction_of_bound_a2_vesicles_in_cpm = 0.95;

nb1_cg = 0.03;%initial_forward_transport_rate / anticipated_fraction_of_bound_b1_vesicles_in_cg;
na2_cpm = 0.14;%initial_backtransport_rate / anticipated_fraction_of_bound_a2_vesicles_in_cpm;

effective_tubulin = 9;
effective_dyn_MTs_length = MTC_length_at_start;
max_effective_tubulin = 10.05;
hydrolysis_rate = 0.675;
% %###################

% scale_initial_a = 3.146e-12; %(0.74 GTP hydrolysis) % 0.00016757; %(0.675 GTP hydrolysis) %
% scale_exp_a = 1.0311; %(0.675 GTP hydrolysis) %0; %(0.74; GTP hydrolysis) %
% scale_initial_b = 8.7342e-19; %(0.675 GTP hydrolysis) %12.02; %(0.74 GTP hydrolysis) %
% scale_exp_b = 4.2122; %(0.675 GTP hydrolysis) %0; %(0.74; GTP hydrolysis) %
% dynMT_degradation_exp_b = -12.78; %(0.675 GTP hydrolysis) %5.63e09; %(0.74 GTP hydrolysis) %
% dynMT_degradation_multiplier_a = 2.93e10; %(0.675 GTP hydrolysis) %-9.311; %(0.74 GTP hydrolysis) %
% shape_m = 0.02784; %(0.74 GTP hydrolysis) %0.02784; %(0.74 GTP hydrolysis) %0.089898; %(0.675 GTP hydrolysis) %
% shape_b = 0.15547; %(0.675 GTP hydrolysis) %0.7; %(0.74 GTP hydrolysis) %
%  

% ##### Average dyn MT length Parameters #######
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
% ##### degradation rate Parameters #######
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


anterograde_vesicle_surface_area = 0.05;
SNARE_complexes_per_vesicle_fusion = 5;
spm = 50;
sg = 50;
s3 = MTC_length_at_start * 2 * pi * radius_neurite;
xx_g_start = 20000;%1.9908e+04;
yy_pm_start = 20000;%2.0097e+04;
with_MTC_growth = true;
fraction_bound_dd_a2b2_mtc = 0.84;
fraction_bound_kk_a1b1_mtc = 0.0815;


max_target_snares_at_one_compartment = 1e20000;
max_vesicle_snares_at_one_compartment = 2e6;
max_total_vesicle_snares_V_for_figures = 2e4;

%Set varying values
cc1_g_start = 100;
cc2_pm_start = 100;
kappaYV_pm_start = 5e-06; %8.5e-07;
kappaXU_g = 8e-06; %7.73e-06;
velocities_per_hour = [0 2.5 5 7.5 10 12.5 15 17.5 20];%[0 2.5 5 7.5 10 12.5 15 17.5 20];
kappaYV_decrements = [0.01e-7 0.01e-7 0.01e-7 0.005e-7 0.005e-7 0.005e-7 0.005e-7 0.005e-7 0.005e-7];
%cc1_gs = [10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 53 55 57 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200];

%Set values for single run
velocity_per_hour = 5;
kappaYV_pm = 2e-06; %2e-06 is standard
xx_g = xx_g_start;
yy_pm = yy_pm_start;
cc1_g = cc1_g_start;
cc2_pm = cc2_pm_start;
