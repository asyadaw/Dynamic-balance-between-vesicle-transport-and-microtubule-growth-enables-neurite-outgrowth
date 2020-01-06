%% parameters related to sensitivity analysis and parameter estimation
index = 0;
max_parameters = size(parameters,1);

index = index + 1;
Max_size_spm = parameters(index);

index = index + 1;
radius_neurite = parameters(index);

index = index +1;
growth_cone_length = parameters(index);

index = index + 1;
cg_length = parameters(index);

index = index + 1;
distance_mtc_growthConeTip = parameters(index);

index = index + 1;
MTC_length_at_start = parameters(index);

index = index + 1;
MTs_per_crosssection = parameters(index);

index = index + 1;
with_MTC_growth = parameters(index);

index = index + 1;
hydrolysis_rate = parameters(index);

index = index + 1;
p00 = parameters(index);

index = index + 1;
p10 = parameters(index);

index = index + 1;
p01 = parameters(index);

index = index + 1;
p20 = parameters(index);

index = index + 1;
p11 = parameters(index);

index = index + 1;
p02 = parameters(index);

index = index + 1;
p30 = parameters(index);

index = index + 1;
p21 = parameters(index);

index = index + 1;
p12 = parameters(index);

index = index + 1;
p03 = parameters(index);

index = index + 1;
d00 = parameters(index);

index = index + 1;
d10 = parameters(index);

index = index + 1;
d01 = parameters(index);

index = index + 1;
d20 = parameters(index);

index = index + 1;
d11 = parameters(index);

index = index + 1;
d02 = parameters(index);

index = index + 1;
d30 = parameters(index);

index = index + 1;
d21 = parameters(index);

index = index + 1;
d12 = parameters(index);

index = index + 1;
d03 = parameters(index);

% Constant Kinesin and dynein velocities
index = index + 1;
velocity_k = parameters(index);

index = index + 1;
velocity_d = parameters(index);

% Constant vesicle surface areas
index = index + 1;
antero_vesicle_surface_area = parameters(index);

index = index + 1;
retro_vesicle_surface_area = parameters(index);

% parameters for SNARE dissociation from coat proteins
index = index + 1;
kxa = parameters(index);

index = index + 1;
kua = parameters(index);

index = index + 1;
kxb = parameters(index);

index = index + 1;
kub = parameters(index);

index = index + 1;
kya = parameters(index);

index = index + 1;
kva = parameters(index);

index = index + 1;
kyb = parameters(index);

index = index + 1;
kvb = parameters(index);

index = index + 1;
snare_binding_spots_per_vesicle_area = parameters(index);

% parameters for cargo dissociation from coat proteins
index = index + 1;
kc1a = parameters(index);

index = index + 1;
kc1b = parameters(index);

index = index + 1;
kc2a = parameters(index);

index = index + 1;
kc2b = parameters(index);
   
index = index + 1;
cargo_binding_spots_per_vesicle_area = parameters(index);

% parameters for motor protein dissociation from coat proteins
index = index + 1;
kkb = parameters(index);

index = index + 1;
kda = parameters(index);

index = index + 1;
kka = parameters(index);

index = index + 1;
kdb = parameters(index);

index = index + 1;
motor_binding_spots_per_vesicle_area = parameters(index);

% Transmembrane protein production rates
index = index + 1;
k_yy_production = parameters(index);

index = index + 1;
k_vv_production = parameters(index);

index = index + 1;
k_xx_production = parameters(index);

index = index + 1;
k_uu_production = parameters(index);

index = index + 1;
k_kk_production = parameters(index);

index = index + 1;
k_dd_production = parameters(index);

index = index + 1;
k_cc1_production = parameters(index);

index = index + 1;
k_cc2_production = parameters(index);

% Budding rate constants
                
index = index + 1;
wa_g = parameters(index);

index = index + 1;
wa_pm = parameters(index);

index = index + 1;
wb_g = parameters(index);

index = index + 1;
wb_pm = parameters(index);

%Fraction of bound kinesin molecules
index = index + 1;
fraction_bound_kk_a1b1_cg = parameters(index);

index = index + 1;
fraction_bound_kk_a1b1_mtc = parameters(index);

index = index + 1;
fraction_bound_kk_a1b1_cpm = parameters(index);

%Fraction of bound dynein molecules
index = index + 1;
fraction_bound_dd_a2b2_cpm = parameters(index);

index = index + 1;
fraction_bound_dd_a2b2_mtc = parameters(index);

index = index + 1;
fraction_bound_dd_a2b2_cg = parameters(index);

% SNARE complex formation rates
index = index + 1;
kappaXU_g = parameters(index);

index = index + 1;
kappaXU_pm = parameters(index);

index = index + 1;
kappaYV_g = parameters(index);

index = index + 1;
kappaYV_pm = parameters(index);

index = index + 1;
snare_complexes_per_vesicle_fusion = parameters(index);

%%%%%%%%%%% Define special parameters

index = index + 1;
k_membrane_production = parameters(index);

index = index + 1;
nucleation_rate = parameters(index);

index = index + 1;
stabilization_rate = parameters(index);

if (index~=max_parameters)
    ME = MException('see above' );
    throw(ME)
end
