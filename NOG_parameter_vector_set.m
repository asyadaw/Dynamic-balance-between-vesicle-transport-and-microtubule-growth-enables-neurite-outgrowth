%% parameters related to sensitivity analysis and parameter estimation

max_parameters = 78;
parameters = zeros(max_parameters,1);
parameter_names = cell(max_parameters,1);
parameter_explanation = cell(max_parameters,1);

parameters_plotIndexes = zeros(max_parameters,1);

plotRowIndex  = -1;
plots_per_row = 5;


% Define constants parameters

index = 0;

index = index + 1;
index_max_size_spm = index;
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = Max_size_spm; % = parameters(index);
parameter_names{index} = 'Max_size_spm';
parameter_explanation{index} = 'Maximum size of Growth Cone Plasma Membrane [\mum{^2}]';


index = index + 1;
index_radius_neurite = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = radius_neurite; % = parameters(index);
parameter_names{index} = 'radius_neurite';
parameter_explanation{index} = 'Radius of neurite [\mum]';

index = index +1;
index_growth_cone_length = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = growth_cone_length; % = parameters(index);
parameter_names{index} = 'growth_cone_length';
parameter_explanation{index} = 'Growth cone length [\mum]';

index = index + 1;
index_cg_length = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = cg_length; % = parameters(index);
parameter_names{index} = 'cg_length';
parameter_explanation{index} = 'Cell body cytoplasm length [\mum]';

index = index + 1;
index_distance_mtc_growthConeTip = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = distance_mtc_growthConeTip; % = parameters(index);
parameter_names{index} = 'distance_mtc_growthConeTip';
parameter_explanation{index} = 'Distance between MTC  and growth cone tip [\mum]';

index = index + 1;
index_MTC_length_at_start = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = MTC_length_at_start; % = parameters(index);
parameter_names{index} = 'MTC_length_at_start';
parameter_explanation{index} = 'Microtubule length at start [\mum]';

index = index + 1;
index_MTs_per_crosssection =  index;
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = MTs_per_crosssection; % = parameters(index);
parameter_names{index} = 'MTs_per_crosssection';
parameter_explanation{index} = '# microtubules in neurite crosssection ';


index = index + 1;
index_with_MTC_growth =  index;
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = with_MTC_growth; % = parameters(index);
parameter_names{index} = 'with_MTC_growth';
% parameter_explanation{index} = '# microtubules in neurite crosssection ';

index = index + 1;
index_hydrolysis_rate  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = hydrolysis_rate; % = parameters(index);
parameter_names{index} = 'hydrolysis_rate';
parameter_explanation{index} = 'GTP tubulin hydrolysis rate in dynamic MT';

index = index + 1;
index_p00  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p00; % = parameters(index);
parameter_names{index} = 'p00';
parameter_explanation{index} = 'Average dynMT length parameter - p00';

index = index + 1;
index_p10  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p10; % = parameters(index);
parameter_names{index} = 'p10';
parameter_explanation{index} = 'Average dynMT length parameter - p10';

index = index + 1;
index_p01  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p01; % = parameters(index);
parameter_names{index} = 'p01';
parameter_explanation{index} = 'Average dynMT length parameter - p01';

index = index + 1;
index_p20  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p20; % = parameters(index);
parameter_names{index} = 'p20';
parameter_explanation{index} = 'Average dynMT length parameter - p20';

index = index + 1;
index_p11  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p11; % = parameters(index);
parameter_names{index} = 'p11';
parameter_explanation{index} = 'Average dynMT length parameter - p11';

index = index + 1;
index_p02  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p02; % = parameters(index);
parameter_names{index} = 'p02';
parameter_explanation{index} = 'Average dynMT length parameter - p02';

index = index + 1;
index_p30  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p30; % = parameters(index);
parameter_names{index} = 'p30';
parameter_explanation{index} = 'Average dynMT length parameter - p30';

index = index + 1;
index_p21  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p21; % = parameters(index);
parameter_names{index} = 'p21';
parameter_explanation{index} = 'Average dynMT length parameter - p21';

index = index + 1;
index_p12  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p12; % = parameters(index);
parameter_names{index} = 'p12';
parameter_explanation{index} = 'Average dynMT length parameter - p12';

index = index + 1;
index_p03  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = p03; % = parameters(index);
parameter_names{index} = 'p03';
parameter_explanation{index} = 'Average dynMT length parameter - p03';

index = index + 1;
index_d00  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d00; % = parameters(index);
parameter_names{index} = 'd00';
parameter_explanation{index} = 'dynMT degradation parameter - d00';

index = index + 1;
index_d10  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d10; % = parameters(index);
parameter_names{index} = 'd10';
parameter_explanation{index} = 'dynMT degradation parameter - d10';

index = index + 1;
index_d01  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d01; % = parameters(index);
parameter_names{index} = 'd01';
parameter_explanation{index} = 'dynMT degradation parameter - d01';

index = index + 1;
index_d20  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d20; % = parameters(index);
parameter_names{index} = 'd20';
parameter_explanation{index} = 'dynMT degradation parameter - d20';

index = index + 1;
index_d11  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d11; % = parameters(index);
parameter_names{index} = 'd11';
parameter_explanation{index} = 'dynMT degradation parameter - d11';

index = index + 1;
index_d02  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d02; % = parameters(index);
parameter_names{index} = 'd02';
parameter_explanation{index} = 'dynMT degradation parameter - d02';

index = index + 1;
index_d30  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d30; % = parameters(index);
parameter_names{index} = 'd30';
parameter_explanation{index} = 'dynMT degradation parameter - d30';

index = index + 1;
index_d21  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d21; % = parameters(index);
parameter_names{index} = 'd21';
parameter_explanation{index} = 'dynMT degradation parameter - d21';

index = index + 1;
index_d12  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d12; % = parameters(index);
parameter_names{index} = 'd12';
parameter_explanation{index} = 'dynMT degradation parameter - d12';

index = index + 1;
index_d03  = index;
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameters(index) = d03; % = parameters(index);
parameter_names{index} = 'd03';
parameter_explanation{index} = 'dynMT degradation parameter -  d03';

% Constant Kinesin and dynein velocities
index = index + 1;
index_velocity_k = 1;
parameters(index) = velocity_k; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'velocity_k';
parameter_explanation{index} = 'Kinesin motor velocity in [\mum] ';

index = index + 1;
index_velocity_d = index;
parameters(index) = velocity_d; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'velocity_d';
parameter_explanation{index} = 'Dynein motor velocity in [\mum] ';

% Constant vesicle surface areas
index = index + 1;
index_antero_vesicle_surface_area = index;
parameters(index) = antero_vesicle_surface_area; % = parameters(index);
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'antero_vesicle_surface_area';
parameter_explanation{index} = 'Anterograde vesicle surface area in [\mum^{2}] ';

index = index + 1;
index_retro_vesicle_surface_area = index;
parameters(index) = retro_vesicle_surface_area; % = parameters(index);
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'retro_vesicle_surface_area';
parameter_explanation{index} = 'Retrograde vesicle surface area in [\mum^{2}] ';

% parameters for SNARE dissociation from coat proteins
index = index + 1;
index_kxa = index;
parameters(index) = kxa; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kxa';
parameter_explanation{index} = 'Dissociation constant of SNARE x with coat A ';

index = index + 1;
index_kua = index;
parameters(index) = kua; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kua';
parameter_explanation{index} = 'Dissociation constant of SNARE U with coat A ';

index = index + 1;
index_kxb = index;
parameters(index) = kxb; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kxb';
parameter_explanation{index} = 'Dissociation constant of SNARE x with coat B ';

index = index + 1;
index_kub = index;
parameters(index) = kub; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kub';
parameter_explanation{index} = 'Dissociation constant of SNARE U with coat B ';

index = index + 1;
index_kya = index;
parameters(index) = kya; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kya';
parameter_explanation{index} = 'Dissociation constant of SNARE Y with coat A ';

index = index + 1;
index_kva = index;
parameters(index) = kva; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kva';
parameter_explanation{index} = 'Dissociation constant of SNARE V with coat A ';

index = index + 1;
index_kyb = index;
parameters(index) = kyb; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kyb';
parameter_explanation{index} = 'Dissociation constant of SNARE Y with coat B ';

index = index + 1;
index_kvb = index;
parameters(index) = kvb; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kvb';
parameter_explanation{index} = 'Dissociation constant of SNARE V with coat B ';

index = index + 1;
index_snare_binding_spots_per_vesicle_area = index;
parameters(index) = snare_binding_spots_per_vesicle_area; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'snare_binding_spots_per_vesicle_area';
parameter_explanation{index} = '# of SNARE binding spots per vesicles surface area ';

% parameters for cargo dissociation from coat proteins
index = index + 1;
index_kc1a = index;
parameters(index) = kc1a; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kc1a';
parameter_explanation{index} = 'Dissociation constant of Recruitment factor 1 with coat A ';

index = index + 1;
index_kc1b = index;
parameters(index) = kc1b; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kc1b';
parameter_explanation{index} = 'Dissociation constant of Recruitment factor 1 with coat B ';

index = index + 1;
index_kc2a = index;
parameters(index) = kc2a; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kc2a';
parameter_explanation{index} = 'Dissociation constant of Recruitment factor 2 with coat A ';

index = index + 1;
index_kc2b = index;
parameters(index) = kc2b; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kc2b';
parameter_explanation{index} = 'Dissociation constant of Recruitment factor 2 with coat B ';
   
index = index + 1;
index_cargo_binding_spots_per_vesicle_area = index;
parameters(index) = cargo_binding_spots_per_vesicle_area; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'cargo_binding_spots_per_vesicle_area';
parameter_explanation{index} = '# of Cargo binding spots per vesicles surface area ';

% parameters for motor protein dissociation from coat proteins
index = index + 1;
index_kkb = index;
parameters(index) = kkb; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kkb';
parameter_explanation{index} = 'Dissociation constant of Kinesin with coat B ';

index = index + 1;
index_kda = index;
parameters(index) = kda; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kda';
parameter_explanation{index} = 'Dissociation constant of Dynein with coat A ';

index = index + 1;
index_kka = index;
parameters(index) = kka; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kka';
parameter_explanation{index} = 'Dissociation constant of Kinesin with coat A ';

index = index + 1;
index_kdb = index;
parameters(index) = kdb; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kdb';
parameter_explanation{index} = 'Dissociation constant of Dynein with coat B ';

index = index + 1;
index_motor_binding_spots_per_vesicle_area = index;
parameters(index) = motor_binding_spots_per_vesicle_area; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'motor_binding_spots_per_vesicle_area';
parameter_explanation{index} = '# of motor binding spots per vesicles surface area ';

% Transmembrane protein production rates
index = index + 1;
index_k_yy_production = index;
parameters(index) = k_yy_production; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_yy_production';
parameter_explanation{index} = 'SNARE YY production rate at Golgi ';

index = index + 1;
index_k_vv_production = index;
parameters(index) = k_vv_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_vv_production';
parameter_explanation{index} = 'SNARE VV production rate at Golgi ';

index = index + 1;
index_k_xx_production = index;
parameters(index) = k_xx_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_xx_production';
parameter_explanation{index} = 'SNARE XX production rate at Golgi ';

index = index + 1;
index_k_uu_production = index;
parameters(index) = k_uu_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_uu_production';
parameter_explanation{index} = 'SNARE UU production rate at Golgi ';

index = index + 1;
index_k_kk_production = index;
parameters(index) = k_kk_production; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_kk_production';
parameter_explanation{index} = 'SNARE KK production rate at Golgi ';

index = index + 1;
index_k_dd_production = index;
parameters(index) = k_dd_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_dd_production';
parameter_explanation{index} = 'SNARE DD production rate at Golgi ';

index = index + 1;
index_k_cc1_production = index;
parameters(index) = k_cc1_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_cc1_production';
parameter_explanation{index} = 'SNARE CC1 production rate at Golgi ';

index = index + 1;
index_k_cc2_production = index;
parameters(index) = k_cc2_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_cc2_production';
parameter_explanation{index} = 'SNARE CC2 production rate at Golgi ';

% Budding rate constants
                
index = index + 1;
index_wa_g = index;
parameters(index) = wa_g; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'wa_g';
parameter_explanation{index} = 'Budding rate with coat A at Golgi ';

index = index + 1;
index_wa_pm = index;
parameters(index) = wa_pm; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'wa_pm';
parameter_explanation{index} = 'Budding rate with coat A at Plasma Membrane ';

index = index + 1;
index_wb_g = index;
parameters(index) = wb_g; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'wb_g';
parameter_explanation{index} = 'Budding rate with coat B at Golgi ';

index = index + 1;
index_wb_pm = index;
parameters(index) = wb_pm; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'wb_pm';
parameter_explanation{index} = 'Budding rate with coat B at Plasma Membrane ';

%Fraction of bound kinesin molecules
index = index + 1;
index_fraction_bound_kk_a1b1_cg = index;
parameters(index) = fraction_bound_kk_a1b1_cg; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'fraction_bound_kk_a1b1_cg';
parameter_explanation{index} = 'Fraction of kinesin bound to MT in Cell Body Cytoplasm   ';

index = index + 1;
index_fraction_bound_kk_a1b1_mtc = index;
parameters(index) = fraction_bound_kk_a1b1_mtc; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'fraction_bound_kk_a1b1_mtc';
parameter_explanation{index} = 'Fraction of kinesin bound to MT in Motor Transport Unit   ';

index = index + 1;
index_fraction_bound_kk_a1b1_cpm = index;
parameters(index) = fraction_bound_kk_a1b1_cpm; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'fraction_bound_kk_a1b1_cpm';
parameter_explanation{index} = 'Fraction of kinesin bound to MT in Growth Cone Cytoplasm   ';

%Fraction of bound dynein molecules
index = index + 1;
index_fraction_bound_dd_a2b2_cpm = index;
parameters(index) = fraction_bound_dd_a2b2_cpm; % = parameters(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'fraction_bound_dd_a2b2_cpm';
parameter_explanation{index} = 'Fraction of Dynein bound to MT in Growth Cone Cytoplasm   ';

index = index + 1;
index_fraction_bound_dd_a2b2_mtc = index;
parameters(index) = fraction_bound_dd_a2b2_mtc; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'fraction_bound_dd_a2b2_mtc';
parameter_explanation{index} = 'Fraction of Dynein bound to MT in Motor Transport Unit  ';

index = index + 1;
index_fraction_bound_dd_a2b2_cg = index;
parameters(index) = fraction_bound_dd_a2b2_cg; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'fraction_bound_dd_a2b2_cg';
parameter_explanation{index} = 'Fraction of Dynein bound to MT in Cell Body Cytoplasm   ';

% SNARE complex formation rates
index = index + 1;
index_kappaXU_g = index;
parameters(index) = kappaXU_g; % = parameters(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kappaXU_g';
parameter_explanation{index} = 'Thedering rate of SNAREs X and U at Golgi  ';

index = index + 1;
index_kappaXU_pm = index;
parameters(index) = kappaXU_pm; % = parameters(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kappaXU_pm';
parameter_explanation{index} = 'Thedering rate of SNAREs X and U at Plasma Membrane  ';

index = index + 1;
index_kappaYV_g = index;
parameters(index) = kappaYV_g; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kappaYV_g';
parameter_explanation{index} = 'Thedering rate of SNAREs Y and V at Golgi  ';

index = index + 1;
index_kappaYV_pm = index;
parameters(index) = kappaYV_pm; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'kappaYV_pm';
parameter_explanation{index} = 'Thedering rate of SNAREs Y and V at Plasma Membrane  ';

index = index + 1;
index_snare_complexes_per_vesicle_fusion = index;
parameters(index) = snare_complexes_per_vesicle_fusion; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'snare_complexes_per_vesicle_fusion';
parameter_explanation{index} = 'Required SNAREs complexes per vesicle fusion  ';

%%%%%%%%%%% Define special parameters

index = index + 1;
index_k_membrane_production = index;
parameters(index) = k_membrane_production; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'k_membrane_production';
parameter_explanation{index} = 'Membrane production rate at Trans Golgi Network  ';

index = index + 1;
index_nucleation_rate = index;
parameters(index) = nucleation_rate; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'nucleation_rate';
parameter_explanation{index} = 'Nucleation rate of dynamic microtubules ';

index = index + 1;
index_stabilization_rate = index;
parameters(index) = stabilization_rate; % = parameters(index);
plotIndex = plotIndex + 1;
parameters_plotIndexes(index) = plotIndex;
parameter_names{index} = 'stabilization_rate';
parameter_explanation{index} = 'Stabilization rate of dynamic microtubules  ';

if (index~=max_parameters)
    ME = MException('see above' );
    throw(ME)
end
