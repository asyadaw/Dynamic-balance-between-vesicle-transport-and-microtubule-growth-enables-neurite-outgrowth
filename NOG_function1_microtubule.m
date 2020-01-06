
%If run without MTs to speed up the simulation time
%d_effective_tubulin = 0;
%d_stbl_MTs_length = 0;
%d_dyn_MTs = 0;

%otherwise
 x = effective_tubulin;
 y = hydrolysis_rate;
 
 average_dynMT_length = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y + p12*x*y^2 + p03*y^3;
 degradation_rate = d00 + d10*x + d01*y + d20*x^2 + d11*x*y + d02*y^2 + d30*x^3 + d21*x^2*y + d12*x*y^2 + d03*y^3;
 
 
 d_effective_tubulin = 0;
 d_average_dyn_MTs_length = 0;
 
 d_stbl_MTs_length = stabilization_rate * dyn_MTs * average_dynMT_length;
 
 d_dyn_MTs = nucleation_rate - stabilization_rate * dyn_MTs - degradation_rate * dyn_MTs; 
 dyn_MTs_length = dyn_MTs * average_dynMT_length;
 MTU_length = (stbl_MTs_length + dyn_MTs_length)/MTs_per_crosssection;

neurite_shaft_length = s3 / (2 * pi * radius_neurite);

% if (  ((MTU_length/neurite_shaft_length) > 1.05)...
%     ||((MTU_length/neurite_shaft_length) < 0.97))
%     ME = MException('see above' ); throw(ME)
% end

if with_MTC_growth
    MTU_length_app = neurite_shaft_length; 
else
    MTU_length_app = MTC_length_at_start; 
end

MTU_in_cpm_length = growth_cone_length;
MTU_in_cg_length = cg_length;
