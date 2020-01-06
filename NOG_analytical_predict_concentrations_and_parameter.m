%1)
growth_related_k_membrane_production = velocity_per_hour/60 * 2 * pi * radius_neurite;

accepted_combination = true;

%Calculate rate of lost surface area in MTC
final_backtransport_rate = cycling_rate;
a2_travel_time_new_MTC = velocity_per_hour / (velocity_d*60);
rate_lost_na2_mtc = final_backtransport_rate * a2_travel_time_new_MTC / anticipated_fraction_of_bound_a2_vesicles_in_mtc;
initial_backtransport_rate = final_backtransport_rate + rate_lost_na2_mtc;

final_forward_transport_rate = initial_backtransport_rate + growth_related_k_membrane_production;
b1_travel_time_new_MTC = velocity_per_hour / (velocity_k*60);
rate_lost_nb1_mtc = final_forward_transport_rate * b1_travel_time_new_MTC / anticipated_fraction_of_bound_b1_vesicles_in_mtc;
initial_forward_transport_rate = final_forward_transport_rate + rate_lost_nb1_mtc;

rate_lost_surface_area_in_mtc = rate_lost_nb1_mtc + rate_lost_na2_mtc;

%2) Calculate membrane production and budding rates
k_membrane_production = growth_related_k_membrane_production + rate_lost_surface_area_in_mtc;
wb_g = initial_forward_transport_rate/(cc1_g*sg);  %option to increase cargo is ignored
wa_pm = initial_backtransport_rate/(cc2_pm*spm);   %option to increase cargo is ignored
wb_pm = wb_g * factor_for_site_specific_budding;
wa_g = wa_pm * factor_for_site_specific_budding;

%3) Calculate initial vesicle surface areas in compartments
b1_travel_time_mtu_at_start = MTC_length_at_start/velocity_k;
nb1_mtc = final_forward_transport_rate * b1_travel_time_mtu_at_start / anticipated_fraction_of_bound_b1_vesicles_in_mtc;
nb1_cpm = final_forward_transport_rate / anticipated_fraction_of_fusing_b1_vesicles_in_cpm;

a2_travel_time_mtc_at_start = MTC_length_at_start/velocity_d;
na2_mtc = final_backtransport_rate * a2_travel_time_mtc_at_start / anticipated_fraction_of_bound_a2_vesicles_in_mtc;
na2_cg = final_backtransport_rate / anticipated_fraction_of_fusing_a2_vesicles_in_cg;

%4) Calculate needed vesicle SNAREs in cpm in dependence of Y-SNAREs at pm and kappa_YV_pm
kappaXU_pm = kappaXU_g * factor_for_site_specific_SNARE_complex_formation;
kappaYV_g = kappaYV_pm * factor_for_site_specific_SNARE_complex_formation;

YV_SNARE_complexes_cpm_pm = (final_forward_transport_rate / anterograde_vesicle_surface_area) * SNARE_complexes_per_vesicle_fusion;
vv_b1_cpm = YV_SNARE_complexes_cpm_pm / (kappaYV_pm * yy_pm); %not all SNAREs are available for SNARE complex formation
v_b1_cpm = vv_b1_cpm / nb1_cpm;

%5) Calculate v_forward
v_forward = v_b1_cpm;
vv_final_forward = v_forward * final_forward_transport_rate;
vv_initial_forward = v_forward * initial_forward_transport_rate;
vv_initial_backward = vv_final_forward;
v_backward = vv_initial_backward / initial_backtransport_rate;
rate_lost_vv_b1_mtc = rate_lost_nb1_mtc * v_forward;

%6) Calculate needed vesicle SNAREs in cg in dependence of X-SNAREs at g and kappa_XU_g
XU_SNARE_complexes_cg_g = (final_backtransport_rate / anterograde_vesicle_surface_area) * SNARE_complexes_per_vesicle_fusion;
uu_a2_cg = XU_SNARE_complexes_cg_g / (kappaXU_g * xx_g); %not all SNAREs are available for SNARE complex formation
u_a2_cg = uu_a2_cg / na2_cg;

% Calculate uu_backward and uu_forward flux
u_backward = u_a2_cg;%210;
uu_final_backward = u_backward * final_backtransport_rate;
uu_initial_backward = u_backward * initial_backtransport_rate;

uu_final_forward = uu_initial_backward;
u_forward = uu_final_forward / final_forward_transport_rate;
uu_initial_forward = initial_forward_transport_rate * u_forward;

%7) Calculate uu_pm and vv_pm
y_pm = yy_pm / spm;
x_pm = kxa * y_pm/kya;
const_pm = 1 + y_pm/kya + x_pm/kxa;
bs = initial_backtransport_rate * snare_binding_spots_per_vesicle_area;
% u_pm =     (uu_initial_backward * const_pm * kua * vv_initial_backward)...
%          / ((bs - vv_initial_backward) * (bs - uu_initial_backward) - vv_initial_backward * uu_initial_backward)...
%        +   (uu_initial_backward * const_pm * kua)...
%          / (   (bs - uu_initial_backward) -   (uu_initial_backward * vv_initial_backward)...
%                                             / (bs - vv_initial_backward));
%u_pm =   (uu_initial_backward * const_pm * kua * vv_initial_backward)...
%       / (bs - vv_initial_backward * uu_initial_backward);

u_pm = uu_initial_backward*const_pm * kua/(bs-(uu_initial_backward+vv_initial_backward));

uu_pm = u_pm * spm;                             
xx_pm = x_pm * spm;

v_pm =     vv_initial_backward * (u_pm/kua + const_pm) * kva...
         / (bs - vv_initial_backward);
vv_pm = v_pm * spm;

%8) Calculate backward y movements
snare_saturation_denom_2a = (1 + x_pm/kxa + u_pm/kua + y_pm/kya + v_pm/kva);

sya2 = snare_binding_spots_per_vesicle_area * (y_pm/kya) / snare_saturation_denom_2a;
yy_initial_backward = initial_backtransport_rate * sya2;
yy_final_backward = final_backtransport_rate * sya2;
y_backward = yy_initial_backward / initial_backtransport_rate;

%8) Calculate forward y movements
yy_final_forward = yy_initial_backward;
y_forward = yy_final_forward / final_forward_transport_rate;
yy_initial_forward = y_forward * initial_forward_transport_rate;

%9) Calculate production rates for v and y
k_vv_production = rate_lost_nb1_mtc * v_forward + rate_lost_na2_mtc * v_backward; 
k_yy_production = rate_lost_nb1_mtc * y_forward + rate_lost_na2_mtc * y_backward;

%10) Calclulate y at TGN
x_g = xx_g / sg;
yy_g = max(0,y_forward * (x_g/kxb) * kyb * sg - k_yy_production);

%11) Calculate uu_g and vv_g
y_g = yy_g / sg;
const_g = 1 + y_g/kyb + x_g/kxb;
fs = initial_forward_transport_rate * snare_binding_spots_per_vesicle_area;
u_g =     (uu_initial_forward * const_g * kub * vv_initial_forward)...
        / ((fs - vv_initial_forward) * (fs - uu_initial_forward) - vv_initial_forward * uu_initial_forward)...
      +   (uu_initial_forward * const_g * kub)...
        / ((fs - uu_initial_forward) -   (uu_initial_forward * vv_initial_forward)...
                               / (fs - vv_initial_forward));

uu_g = u_g * sg;

v_g =    vv_initial_forward * (u_g/kub + const_g) * kvb...
      / (fs - vv_initial_forward);
vv_g = v_g * sg;


%Calculate forward x movements
snare_saturation_denom_1b = (1 + x_g/kxb  + u_g/kub  + y_g/kyb  + v_g/kvb);

% syb1 = snare_binding_spots_per_vesicle_area * (y_g/kyb) / snare_saturation_denom_1b;
% yy_initial_forward = initial_forward_transport_rate * syb1;
% yy_final_forward = final_forward_transport_rate * syb1;
% y_forward = yy_initial_forward / initial_forward_transport_rate;

%12) Calculate x forward movements
sxb1 = snare_binding_spots_per_vesicle_area * (x_g/kxb) / snare_saturation_denom_1b;
x_forward = sxb1;
xx_initial_forward = initial_forward_transport_rate * x_forward;
xx_final_forward = final_forward_transport_rate * x_forward;

%Calculate x backward movements
%sxa2 = snare_binding_spots_per_vesicle_area * (x_pm/kxa) / snare_saturation_denom_2a;
xx_initial_backward = xx_final_forward;
x_backward = xx_initial_backward / initial_backtransport_rate;
xx_final_backward = final_backtransport_rate * x_backward;

%13) Calculate protein production rates for SNAREs and adopt SNARE amounts at TGN
k_uu_production = rate_lost_nb1_mtc * u_forward + rate_lost_na2_mtc * u_backward; 
k_xx_production = rate_lost_nb1_mtc * x_forward + rate_lost_na2_mtc * x_backward;

%14)Calculate u, x and v at TGN
uu_g = max([0 uu_g - k_uu_production]);
xx_g = max([0 xx_g - k_xx_production]);
vv_g = max([0 vv_g - k_vv_production]);

%15) Calculate missing variables for vesicular transport
vv_b1_cg = nb1_cg * v_forward;
vv_b1_mtc = nb1_mtc * v_forward;
vv_a2_cpm = na2_cpm * v_backward;
vv_a2_mtc = na2_mtc * v_backward;
vv_a2_cg = na2_cg * v_backward;

uu_b1_cg = nb1_cg * u_forward;
uu_b1_mtc = nb1_mtc * u_forward;
uu_b1_cpm = nb1_cpm * u_forward;
uu_a2_cpm = na2_cpm * u_backward;
uu_a2_mtc = na2_mtc * u_backward;

xx_b1_cg = nb1_cg * x_forward;
xx_b1_mtc = nb1_mtc * x_forward;
xx_b1_cpm = nb1_cpm * x_forward;
xx_a2_cpm = na2_cpm * x_backward;
xx_a2_mtc = na2_mtc * x_backward;
xx_a2_cg = na2_cg * x_backward;

yy_b1_cg = nb1_cg * y_forward;
yy_b1_mtc = nb1_mtc * y_forward;
yy_b1_cpm = nb1_cpm * y_forward;
yy_a2_cpm = na2_cpm * y_backward;
yy_a2_mtc = na2_mtc * y_backward;
yy_a2_cg = na2_cg * y_backward;

%16) Calculate kinesin 
k_per_vesicle_b1_mtc = log(1 - anticipated_fraction_of_bound_b1_vesicles_in_mtc) / log(1-fraction_bound_kk_a1b1_mtc);
k_b1_mtc = k_per_vesicle_b1_mtc / anterograde_vesicle_surface_area;
k_forward = k_b1_mtc;
kk_initial_forward = k_forward * initial_forward_transport_rate;
kk_final_forward = k_forward * final_forward_transport_rate;
kk_initial_backward = kk_final_forward;
k_backward = kk_initial_backward / initial_backtransport_rate;

k_g  = kkb * kk_initial_forward / (initial_forward_transport_rate * motor_binding_spots_per_vesicle_area - kk_initial_forward);
k_pm = kka * kk_initial_backward / (initial_backtransport_rate * motor_binding_spots_per_vesicle_area - kk_initial_backward);

kk_g = k_g * sg;
kk_pm = k_pm * spm;
kk_b1_cg = k_forward * nb1_cg;
kk_b1_mtc = k_forward * nb1_mtc;
kk_b1_cpm = k_forward * nb1_cpm;
kk_a2_cg = k_backward * na2_cg;
kk_a2_mtc = k_backward * na2_mtc;
kk_a2_cpm = k_backward * na2_cpm;

k_kk_production = rate_lost_nb1_mtc * k_forward + rate_lost_na2_mtc * k_backward; 

%16) Calculate dynein
d_per_vesicle_a2_mtc = log(1 - anticipated_fraction_of_bound_a2_vesicles_in_mtc) / log(1-fraction_bound_dd_a2b2_mtc);
d_a2_mtc = d_per_vesicle_a2_mtc / anterograde_vesicle_surface_area;
d_backward = d_a2_mtc;
dd_initial_backward = d_backward * initial_backtransport_rate;
dd_final_forward = dd_initial_backward;
d_forward = dd_final_forward / final_forward_transport_rate;
dd_initial_forward = d_forward * initial_forward_transport_rate;

d_g  = kdb * dd_initial_forward / (initial_forward_transport_rate * motor_binding_spots_per_vesicle_area - dd_initial_forward);
d_pm = kda * dd_initial_backward / (initial_backtransport_rate * motor_binding_spots_per_vesicle_area    - dd_initial_backward);

dd_g = d_g * sg;
dd_pm = d_pm * spm;
dd_b1_cg = d_forward * nb1_cg;
dd_b1_mtc = d_forward * nb1_mtc;
dd_b1_cpm = d_forward * nb1_cpm;
dd_a2_cg = d_backward * na2_cg;
dd_a2_mtc = d_backward * na2_mtc;
dd_a2_cpm = d_backward * na2_cpm;

k_dd_production = rate_lost_nb1_mtc * d_forward + rate_lost_na2_mtc * d_backward; 

%17) Calculate cargo
c1_g = cc1_g / sg;
sc1b1 = cargo_binding_spots_per_vesicle_area * (c1_g/kc1b) / (1+c1_g/kc1b);
c1_forward = sc1b1;
cc1_final_forward = final_forward_transport_rate * c1_forward;
cc1_initial_backward = cc1_final_forward;
c1_backward = cc1_initial_backward / initial_backtransport_rate;
c1_pm = kc1a * cc1_initial_backward / (initial_backtransport_rate * cargo_binding_spots_per_vesicle_area - cc1_initial_backward);

cc1_pm = c1_pm * spm;
cc1_b1_cg = c1_forward * nb1_cg;
cc1_b1_mtc = c1_forward * nb1_mtc;
cc1_b1_cpm = c1_forward * nb1_cpm;
cc1_a2_cg = c1_backward * na2_cg;
cc1_a2_mtc = c1_backward * na2_mtc;
cc1_a2_cpm = c1_backward * na2_cpm;

k_cc1_production = rate_lost_nb1_mtc * c1_forward + rate_lost_na2_mtc * c1_backward; 

c2_pm = cc2_pm / sg;
sc2a2 = cargo_binding_spots_per_vesicle_area * (c2_pm/kc2a) / (1+c2_pm/kc2a);
c2_backward = sc2a2;
cc2_initial_backward = initial_backtransport_rate * c2_backward;
cc2_final_forward = cc2_initial_backward;
c2_forward = cc2_final_forward / final_forward_transport_rate;
cc2_initial_forward = c2_forward * initial_forward_transport_rate;
c2_g = kc2b * cc2_initial_forward / (initial_forward_transport_rate * cargo_binding_spots_per_vesicle_area - cc2_initial_forward);

cc2_g = c2_g * sg;
cc2_b1_cg = c2_forward * nb1_cg;
cc2_b1_mtc = c2_forward * nb1_mtc;
cc2_b1_cpm = c2_forward * nb1_cpm;
cc2_a2_cg = c2_backward * na2_cg;
cc2_a2_mtc = c2_backward * na2_mtc;
cc2_a2_cpm = c2_backward * na2_cpm;

k_cc2_production = rate_lost_nb1_mtc * c2_forward + rate_lost_na2_mtc * c2_backward; 

%18) Calculate microtubule parameter - Arjun's paper
%input variables: effective_tubulin, effective_dynMTs_length
MT_growth_velocity = velocity_per_hour / 60;
x = effective_tubulin;
y = hydrolysis_rate;
 
average_dynMT_length = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y + p12*x*y^2 + p03*y^3;
degradation_rate = d00 + d10*x + d01*y + d20*x^2 + d11*x*y + d02*y^2 + d30*x^3 + d21*x^2*y + d12*x*y^2 + d03*y^3;
                  
% % x = effective_tubulin;
% % y = hydrolysis_rate;
% %  
% % average_dynMT_length = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y + p12*x*y^2 + p03*y^3;
% % degradation_rate = d00 + d10*x + d01*y + d20*x^2 + d11*x*y + d02*y^2 + d30*x^3 + d21*x^2*y + d12*x*y^2 + d03*y^3;
                  
dyn_MTs_length = effective_dyn_MTs_length * MTs_per_crosssection;
dyn_MTs = dyn_MTs_length / average_dynMT_length;
 
length_increase_of_stable_MTs = (MT_growth_velocity * MTs_per_crosssection);
stabilization_rate = length_increase_of_stable_MTs / (average_dynMT_length * dyn_MTs);
nucleation_rate = stabilization_rate * dyn_MTs + degradation_rate * dyn_MTs;
 
stbl_MTs_length = (MTC_length_at_start + cg_length + growth_cone_length)*MTs_per_crosssection - dyn_MTs_length;
mtb_length = stbl_MTs_length + dyn_MTs_length;

%Calculate microtubule parameter - Mustafa's paper
%input variables: effective_tubulin, degradation_rate
% MT_growth_velocity = velocity_per_hour /60;
% scale = scale_initial_a * exp(scale_exp_a*effective_tubulin) + scale_initial_b * exp(scale_exp_b*effective_tubulin);
% shape = shape_m * effective_tubulin + shape_b;
% average_dynMT_length = scale * shape;
% degradation_rate = dynMT_degradation_multiplier_a * effective_tubulin^dynMT_degradation_exp_b;
% 
% dyn_MTs_length = effective_dyn_MTs_length * MTs_per_crosssection;
% dyn_MTs = dyn_MTs_length / average_dynMT_length;
% 
% length_increase_of_stable_MTs = (MT_growth_velocity * MTs_per_crosssection)/(dyn_MTs_length);
% stabilization_rate = length_increase_of_stable_MTs / average_dynMT_length;
% nucleation_rate = stabilization_rate + degradation_rate;
% 
% stbl_MTs_length = (MTC_length_at_start + cg_length + growth_cone_length)*MTs_per_crosssection - dyn_MTs_length;
% mtb_length = stbl_MTs_length + dyn_MTs_length;


% stabiliztion_rate = nucleation_rate - degradation_rate;
% dyn_MTs = nucleation_rate / (stabilization_rate + degradation_rate);
% 
% dyn_MTs_length = dyn_MTs * average_dynMT_length;
% effective_dyn_MT_length = dyn_MTs_length / MTs_per_crosssection;

%Check for negative values
if (MTC_length_at_start<=0) 
    accepted_combination = false;
    reason_for_reject = 'MTC_length_at_start';
    %ME = MException('see above' ); throw(ME)
end
if (s3<0) 
    accepted_combination = false;
    reason_for_reject = 's3';
    %ME = MException('see above' ); throw(ME)
end
if (nb1_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'nb1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (nb1_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'nb1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (nb1_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'nb1_cpm';
end
if (na2_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'na2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (na2_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'na2_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (na2_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'na2_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (xx_g<0) || (xx_g>max_target_snares_at_one_compartment) 
   accepted_combination = false;
   reason_for_reject = 'xx_g';
   %ME = MException('see above' ); throw(ME)
end
if (yy_g<0) || (yy_g>max_target_snares_at_one_compartment) 
    accepted_combination = false;
    reason_for_reject = 'yy_g';
    %ME = MException('see above' ); throw(ME)
end
if (xx_pm<0) || (xx_pm>max_target_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'xx_pm';
    %ME = MException('see above' ); throw(ME)
end
if (yy_pm<0) || (yy_pm>max_target_snares_at_one_compartment) 
    accepted_combination = false;
    reason_for_reject = 'yy_pm';
    %ME = MException('see above' ); throw(ME)
end
if (vv_g<0) || (vv_g>max_vesicle_snares_at_one_compartment) 
    accepted_combination = false;
    reason_for_reject = 'vv_g';
    %ME = MException('see above' ); throw(ME)
end
if (vv_b1_cg<0) || (vv_b1_cg>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'vv_b1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (vv_b1_mtc<0) || (vv_b1_mtc>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'vv_b1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (vv_b1_cpm<0) || (vv_b1_cpm>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'vv_b1_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (vv_pm<0) || (vv_pm>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'vv_pm';
    %ME = MException('see above' ); throw(ME)
end
if (uu_b1_cg<0) || (uu_b1_cg>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'uu_b1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (uu_b1_mtc<0) || (uu_b1_mtc>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'uu_b1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (uu_b1_cpm<0) || (uu_b1_cpm>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'uu_b1_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (uu_g<0) || (uu_g>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'uu_g';
    %ME = MException('see above' ); throw(ME)
end
if (uu_a2_cg<0) || (uu_a2_cg>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'uu_a2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (uu_a2_mtc<0) || (uu_a2_mtc>max_vesicle_snares_at_one_compartment)
    accepted_combination = false;
    reason_for_reject = 'uu_a2_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (uu_a2_cpm<0) || (uu_a2_cpm>max_vesicle_snares_at_one_compartment) 
    accepted_combination = false;
    reason_for_reject = 'uu_a2_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (uu_pm<0) || (uu_pm>max_vesicle_snares_at_one_compartment) 
    accepted_combination = false;
    reason_for_reject = 'uu_pm';
    %ME = MException('see above' ); throw(ME)
end
if (kk_g<0)
    accepted_combination = false;
    reason_for_reject = 'kk_g';
    %ME = MException('see above' ); throw(ME)
end
if (kk_b1_cg<0)
    accepted_combination = false;
    reason_for_reject = 'kk_b1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (kk_b1_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'kk_b1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (kk_b1_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'kk_b1_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (kk_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'kk_pm';
    %ME = MException('see above' ); throw(ME)
end
if (kk_a2_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'kk_a2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (kk_a2_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'kk_a2_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (kk_a2_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'kk_a2_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (dd_g<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_g';
    %ME = MException('see above' ); throw(ME)
end
if (dd_b1_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_b1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (dd_b1_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_b1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (dd_b1_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_b1_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (dd_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_pm';
    %ME = MException('see above' ); throw(ME)
end
if (dd_a2_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_a2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (dd_a2_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_a2_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (dd_a2_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'dd_a2_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_g<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_g';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_b1_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_b1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_b1_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_b1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_b1_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_b1_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_pm';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_a2_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_a2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_a2_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_a2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (cc1_a2_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'cc1_a2_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_g<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_g';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_b1_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_b1_cg';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_b1_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_b1_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_b1_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_b1_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_pm';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_a2_cg<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_a2_cg';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_a2_mtc<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_a2_mtc';
    %ME = MException('see above' ); throw(ME)
end
if (cc2_a2_cpm<0) 
    accepted_combination = false;
    reason_for_reject = 'cc2_a2_cpm';
    %ME = MException('see above' ); throw(ME)
end
if (k_membrane_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_membrane_production';
    %ME = MException('see above' ); throw(ME)
end
if (k_vv_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_vv_production';
    %ME = MException('see above' ); throw(ME)
end
if (k_yy_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_yy_production';
    %ME = MException('see above' ); throw(ME)
end
if (k_xx_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_xx_production';
    %ME = MException('see above' ); throw(ME)
end
if (k_uu_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_uu_production';
    %ME = MException('see above' ); throw(ME)
end
if (k_kk_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_kk_production';
    %ME = MException('see above' ); throw(ME)
end
if (k_dd_production<0) 
    accepted_combination = false;
    reason_for_reject = 'k_dd_production';
    %ME = MException('see above' ); throw(ME)
end
if (wb_g<0) 
    accepted_combination = false;
    reason_for_reject = 'wb_g';
    %ME = MException('see above' ); throw(ME)
end
if (wa_g<0) 
    accepted_combination = false;
    reason_for_reject = 'wa_g';
    %ME = MException('see above' ); throw(ME)
end
if (wb_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'wb_pm';
    %ME = MException('see above' ); throw(ME)
end
if (wa_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'wa_pm';
    %ME = MException('see above' ); throw(ME)
end
if (kappaXU_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'kappaXU_pm';
    %ME = MException('see above' ); throw(ME)
end
if (kappaYV_pm<0) 
    accepted_combination = false;
    reason_for_reject = 'kappaYV_pm';
    %ME = MException('see above' ); throw(ME)
end
if (kappaXU_g<0) 
    accepted_combination = false;
    reason_for_reject = 'kappaXU_g';
    %ME = MException('see above' ); throw(ME)
end
if (kappaYV_g<0) 
    accepted_combination = false;
    reason_for_reject = 'kappaYV_g';
    %ME = MException('see above' ); throw(ME)
end
if (nucleation_rate<0) 
    accepted_combination = false;
    reason_for_reject = 'nucleation_rate';
    %ME = MException('see above' ); throw(ME)
end

if (degradation_rate<0) 
    accepted_combination = false;
    reason_for_reject = 'degradation_rate';
    %ME = MException('see above' ); throw(ME)
end

if (stabilization_rate<0) 
    accepted_combination = false;
    reason_for_reject = 'stabilization_rate';
    %ME = MException('see above' ); throw(ME)
end

if (mtb_length<0) 
    accepted_combination = false;
    reason_for_reject = 'mtb_length';
    %ME = MException('see above' ); throw(ME)
end

if ((effective_tubulin<0) ||(effective_tubulin>max_effective_tubulin))
    accepted_combination = false;
    reason_for_reject = 'effective_tubulin';
    %ME = MException('see above' ); throw(ME)
end

