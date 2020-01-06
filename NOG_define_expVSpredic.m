
%global Output_fluxes Output_time;


%%%%%%%Define reference time and indexes
reference_time_period = 500;
tend = t(end);
tstart = tend - reference_time_period;
tstart_index = -1;
%log2_tolerance_deviation_for_steady_test = log2(0.01);

length_t = length(t);
for indexT = 1:length_t
    if t(indexT)>=tstart
        if (tstart_index == -1)
            tstart_index = indexT;
        end
        break;
    end
end

if (tstart_index == length_t)
    tstart_index = length_t -1;
end

reference_time_period = t(end) - t(tstart_index);

%% Get parameter
antero_vesicle_surface_area = parameters(index_antero_vesicle_surface_area);

%%%%%%%Initialize arrays for experimental predicted statevar data
expPreDataStatevar_length = 3;
expPreDataStatevar_names = cell(expPreDataStatevar_length,1);
expPreDataStatevar_colors = zeros(expPreDataStatevar_length,3);
expPreDataStatevar_add_to_previous_figure = zeros(expPreDataStatevar_length,1);
expPreDataStatevar_ylables = cell(expPreDataStatevar_length,1);
expPreDataStatevar_means = zeros(expPreDataStatevar_length,1);
expPreDataStatevar_sds = zeros(expPreDataStatevar_length,1);
expPreDataStatevar_consider = zeros(expPreDataStatevar_length,1);
expPreDataStatevar_preValue = zeros(length(t),expPreDataStatevar_length);
expPreDataStatevar_max_y = zeros(length(t),expPreDataStatevar_length);

indexPDStatevar = 0;

%%%%%%%%%%%%

% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_sg = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = ['TGN [um^2]'];
% expPreDataStatevar_means(indexPDStatevar) = 50;
% expPreDataStatevar_sds(indexPDStatevar) = 1.25;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = statevar_timelines(:,indexS_sg);
% 
%%%%%%%%%%%%

% nb1_cg = statevar_timelines(:,indexS_nb1_cg);
% nb2_cg = statevar_timelines(:,indexS_nb2_cg);
% na1_cg = statevar_timelines(:,indexS_na1_cg);
% na2_cg = statevar_timelines(:,indexS_na2_cg);
% vesicles_cg = (nb1_cg + nb2_cg + na1_cg + na2_cg) / antero_vesicle_surface_area;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_vesicles_cg = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = '# vesicles CBC';
% expPreDataStatevar_means(indexPDStatevar) = 5.555;
% expPreDataStatevar_sds(indexPDStatevar) = 1;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = vesicles_cg;



%%%%%%%%%%%%

% nb1_cpm = statevar_timelines(:,indexS_nb1_cpm);
% nb2_cpm = statevar_timelines(:,indexS_nb2_cpm);
% na1_cpm = statevar_timelines(:,indexS_na1_cpm);
% na2_cpm = statevar_timelines(:,indexS_na2_cpm);
% vesicles_cpm = (nb1_cpm + nb2_cpm + na1_cpm + na2_cpm) / antero_vesicle_surface_area;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_vesicles_cpm = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = '# vesicles GCC';
% expPreDataStatevar_means(indexPDStatevar) = 105;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = vesicles_cpm;

%%%%%%%%%%%%

% spm = statevar_timelines(:,indexS_spm);
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_spm = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'growth cone [um^2]';
% expPreDataStatevar_means(indexPDStatevar) = 50;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = spm;

%%%%%%%%%%%%

s3 = statevar_timelines(:,indexS_s3);
 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_s3 = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = {'Neurite shaft surface'};
% expPreDataStatevar_ylabels{indexPDStatevar} = 'surface area [\mum^2]';
% expPreDataStatevar_colors(indexPDStatevar,:) = [0 0 0];
% expPreDataStatevar_add_to_previous_figure(indexPDStatevar) = false;
% expPreDataStatevar_means(indexPDStatevar) = 50;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = s3;
% expPreDataStatevar_max_y(indexPDStatevar) = 500;

%%%%%%%%%%%%

indexPDStatevar = indexPDStatevar + 1;
indexPDStatevarEPD_s3_length = indexPDStatevar;
expPreDataStatevar_names{indexPDStatevar} = {'Neurite shaft length'};
expPreDataStatevar_ylabels{indexPDStatevar} = 'length [\mum]';
expPreDataStatevar_colors(indexPDStatevar,:) = [0 0 0];
expPreDataStatevar_add_to_previous_figure(indexPDStatevar) = false;
expPreDataStatevar_means(indexPDStatevar) = 50;
expPreDataStatevar_sds(indexPDStatevar) = 5;
expPreDataStatevar_consider(indexPDStatevar) = true;
expPreDataStatevar_preValue(:,indexPDStatevar) = s3 / (2*pi*radius_neurite);
expPreDataStatevar_max_y(indexPDStatevar) = 200;

%%%%%%%%%%%%

dyn_MTs = statevar_timelines(:,indexS_dyn_MTs);
effective_tubulin = statevar_timelines(:,indexS_effective_tubulin);
x = effective_tubulin;

average_dynMT_length = statevar_timelines(:,indexS_average_dyn_MTs_length);
dynMT_length = average_dynMT_length .* dyn_MTs / MTs_per_crosssection;
stbl_MTs_length = statevar_timelines(:,indexS_stbl_MTs_length) / MTs_per_crosssection;

indexPDStatevar = indexPDStatevar + 1;
indexPDStatevarEPD_microtubule_length = indexPDStatevar;
expPreDataStatevar_names{indexPDStatevar} = {'Microtubule bundle length'};
expPreDataStatevar_ylabels{indexPDStatevar} = 'length [\mum]';
expPreDataStatevar_colors(indexPDStatevar,:) = [0 0 0];
expPreDataStatevar_add_to_previous_figure(indexPDStatevar) = false;
expPreDataStatevar_means(indexPDStatevar) = 50;
expPreDataStatevar_sds(indexPDStatevar) = 5;
expPreDataStatevar_consider(indexPDStatevar) = true;
expPreDataStatevar_preValue(:,indexPDStatevar) = dynMT_length + stbl_MTs_length - cg_length - growth_cone_length;
expPreDataStatevar_max_y(indexPDStatevar) = 200;

nb1_mtc = statevar_timelines(:,indexS_nb1_mtc);
nb2_mtc = statevar_timelines(:,indexS_nb2_mtc);
na1_mtc = statevar_timelines(:,indexS_na1_mtc);
na2_mtc = statevar_timelines(:,indexS_na2_mtc);
vesicles_mtc = (nb1_mtc + nb2_mtc + na1_mtc + na2_mtc) / antero_vesicle_surface_area;

indexPDStatevar = indexPDStatevar + 1;
indexPDStatevarEPD_vesicles_cpm = indexPDStatevar;
expPreDataStatevar_names{indexPDStatevar} = {'Vesicles in';'Neurite Shaft Cytoplasm'};
expPreDataStatevar_ylabels{indexPDStatevar} = {'';'# vesicles'};
expPreDataStatevar_colors(indexPDStatevar,:) = [ 0 0 0 ];
expPreDataStatevar_add_to_previous_figure(indexPDStatevar) = false;
expPreDataStatevar_means(indexPDStatevar) = 105;
expPreDataStatevar_sds(indexPDStatevar) = 5;
expPreDataStatevar_consider(indexPDStatevar) = true;
expPreDataStatevar_preValue(:,indexPDStatevar) = vesicles_mtc;
expPreDataStatevar_max_y(indexPDStatevar) = 500;

%%%%%%%%%%%%



% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_microtubule_length = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = {'add to previous'};
% expPreDataStatevar_ylabels{indexPDStatevar} = 'add to previous';
% expPreDataStatevar_colors(indexPDStatevar,:) = [255/255 140/255 0];
% expPreDataStatevar_add_to_previous_figure(indexPDStatevar) = true;
% expPreDataStatevar_means(indexPDStatevar) = 50;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = dynMT_length;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_microtubule_length = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = {'add to previous'};
% expPreDataStatevar_ylabels{indexPDStatevar} = 'add to previous';
% expPreDataStatevar_colors(indexPDStatevar,:) = [0 128/255 0];
% expPreDataStatevar_add_to_previous_figure(indexPDStatevar) = true;
% expPreDataStatevar_means(indexPDStatevar) = 50;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = stbl_MTs_length;

%%%%%%%%%%%%


% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_b1_vesicles_cpm = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'b1 vesicles cpm';
% expPreDataStatevar_means(indexPDStatevar) = 100;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = nb1_cpm / antero_vesicle_surface_area;

%%%%%%%%%%%%

% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_a2_vesicles_cpm = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'a2 vesicles cpm';
% expPreDataStatevar_means(indexPDStatevar) = 2.8;
% expPreDataStatevar_sds(indexPDStatevar) = 1.25;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = na2_cpm / antero_vesicle_surface_area;

%%%%%%%%%%%%

% nb1_mtc = statevar_timelines(:, indexS_nb1_mtc);
% snares_b1_mtc =  statevar_timelines(:, indexS_xx_b1_mtc)+ statevar_timelines(:, indexS_uu_b1_mtc)...
%                 +statevar_timelines(:, indexS_yy_b1_mtc)+ statevar_timelines(:, indexS_vv_b1_mtc);
% vnb1_mtc = nb1_mtc / antero_vesicle_surface_area;
% snares_per_b1_mtc_vesicle = snares_b1_mtc ./ vnb1_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_snares_per_b1_mtc_vesicle = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'snares_per_b1_mtc_vesicle';
% expPreDataStatevar_means(indexPDStatevar) = 60;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = false;
% expPreDataStatevar_preValue(:,indexPDStatevar) = snares_per_b1_mtc_vesicle;

%%%%%%%%%%%%

% nb1_mtc = statevar_timelines(:, indexS_nb1_mtc);
% snaresYYVV_b1_mtc =  statevar_timelines(:, indexS_yy_b1_mtc)+ statevar_timelines(:, indexS_vv_b1_mtc);
% vnb1_mtc = nb1_mtc / antero_vesicle_surface_area;
% snaresYYVV_per_b1_mtc_vesicle = snaresYYVV_b1_mtc ./ vnb1_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_snaresYYVV_per_b1_mtc_vesicle = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'snaresYYVV_per_b1_mtc_vesicle';
% expPreDataStatevar_means(indexPDStatevar) = 30;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = false;
% expPreDataStatevar_preValue(:,indexPDStatevar) = snaresYYVV_per_b1_mtc_vesicle;

%%%%%%%%%%%%

% nb1_mtc = statevar_timelines(:, indexS_nb1_mtc);
% snaresXXUU_b1_mtc =  statevar_timelines(:, indexS_xx_b1_mtc)+ statevar_timelines(:, indexS_uu_b1_mtc);
% vnb1_mtc = nb1_mtc / antero_vesicle_surface_area;
% snaresXXUU_per_b1_mtc_vesicle = snaresXXUU_b1_mtc ./ vnb1_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_snaresXXUU_per_b1_mtc_vesicle = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'snaresXXUU_per_b1_mtc_vesicle';
% expPreDataStatevar_means(indexPDStatevar) = 30;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = false;
% expPreDataStatevar_preValue(:,indexPDStatevar) = snaresXXUU_per_b1_mtc_vesicle;

%%%%%%%%%%%%

% na2_mtc = statevar_timelines(:, indexS_na2_mtc);
% snares_a2_mtc =  statevar_timelines(:, indexS_xx_a2_mtc)+ statevar_timelines(:, indexS_uu_a2_mtc)...
%                 +statevar_timelines(:, indexS_yy_a2_mtc)+ statevar_timelines(:, indexS_vv_a2_mtc);
% vna2_mtc = na2_mtc / antero_vesicle_surface_area;
% snares_per_a2_mtc_vesicle = snares_a2_mtc ./ vna2_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_snares_per_a2_mtc_vesicle = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'snares_per_a2_mtc_vesicle';
% expPreDataStatevar_means(indexPDStatevar) = 60;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = false;
% expPreDataStatevar_preValue(:,indexPDStatevar) = snares_per_a2_mtc_vesicle;

%%%%%%%%%%%%

% na2_mtc = statevar_timelines(:, indexS_na2_mtc);
% snaresYYVV_a2_mtc =  statevar_timelines(:, indexS_yy_a2_mtc)+ statevar_timelines(:, indexS_vv_a2_mtc);
% vna2_mtc = na2_mtc / antero_vesicle_surface_area;
% snaresYYVV_per_a2_mtc_vesicle = snaresYYVV_a2_mtc ./ vna2_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_snaresYYVV_per_a2_mtc_vesicle = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'snaresYYVV_per_a2_mtc_vesicle';
% expPreDataStatevar_means(indexPDStatevar) = 30;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = false;
% expPreDataStatevar_preValue(:,indexPDStatevar) = snaresYYVV_per_a2_mtc_vesicle;
% 
%%%%%%%%%%%%

% na2_mtc = statevar_timelines(:, indexS_na2_mtc);
% snaresXXUU_a2_mtc =  statevar_timelines(:, indexS_xx_a2_mtc)+ statevar_timelines(:, indexS_uu_a2_mtc);
% vna2_mtc = na2_mtc / antero_vesicle_surface_area;
% snaresXXUU_per_a2_mtc_vesicle = snaresXXUU_a2_mtc ./ vna2_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_snaresXXUU_per_a2_mtc_vesicle = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'snaresXXUU_per_a2_mtc_vesicle';
% expPreDataStatevar_means(indexPDStatevar) = 30;
% expPreDataStatevar_sds(indexPDStatevar) = 5;
% expPreDataStatevar_consider(indexPDStatevar) = false;
% expPreDataStatevar_preValue(:,indexPDStatevar) = snaresXXUU_per_a2_mtc_vesicle;

%%%%%%%%%%%%

% na2_mtc = statevar_timelines(:, indexS_na2_mtc);
% vna2_mtc = na2_mtc / antero_vesicle_surface_area;
% kk_a2_mtc = statevar_timelines(:, indexS_kk_a2_mtc);
% kk_per_vesicle_a2_mtc =  kk_a2_mtc ./ vna2_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_kk_per_vesicle_a2_mtc = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'kk_per_vesicle_a2_mtc';
% expPreDataStatevar_means(indexPDStatevar) = 1.25;
% expPreDataStatevar_sds(indexPDStatevar) = 0.05;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = kk_per_vesicle_a2_mtc;

%%%%%%%%%%%%

% dd_a2_mtc = statevar_timelines(:, indexS_dd_a2_mtc);
% dd_per_vesicle_a2_mtc =  dd_a2_mtc ./ vna2_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_dd_per_vesicle_a2_mtc = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'dd_per_vesicle_a2_mtc';
% expPreDataStatevar_means(indexPDStatevar) = 1.25;
% expPreDataStatevar_sds(indexPDStatevar) = 0.05;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = dd_per_vesicle_a2_mtc;

%%%%%%%%%%%%

% dd_b1_mtc = statevar_timelines(:, indexS_dd_b1_mtc);
% dd_per_vesicle_b1_mtc =  dd_b1_mtc ./ vnb1_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_dd_per_vesicle_b1_mtc = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'dd_per_vesicle_b1_mtc';
% expPreDataStatevar_means(indexPDStatevar) = 1.25;
% expPreDataStatevar_sds(indexPDStatevar) = 0.05;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = dd_per_vesicle_b1_mtc;

%%%%%%%%%%%%

% kk_b1_mtc = statevar_timelines(:, indexS_kk_b1_mtc);
% kk_per_vesicle_b1_mtc =  kk_b1_mtc ./ vnb1_mtc;
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_kk_per_vesicle_b1_mtc = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'kk_per_vesicle_b1_mtc';
% expPreDataStatevar_means(indexPDStatevar) = 1.25;
% expPreDataStatevar_sds(indexPDStatevar) = 0.05;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = kk_per_vesicle_b1_mtc;

%%%%%%%%%%%%

% sum_of_vv_snares =   statevar_timelines(:, indexS_vv_g)...
%                    + statevar_timelines(:, indexS_vv_b1_cg)...
%                    + statevar_timelines(:, indexS_vv_a1_cg)...
%                    + statevar_timelines(:, indexS_vv_b2_cg)...
%                    + statevar_timelines(:, indexS_vv_a2_cg)...
%                    + statevar_timelines(:, indexS_vv_b1_mtc)...
%                    + statevar_timelines(:, indexS_vv_a1_mtc)...
%                    + statevar_timelines(:, indexS_vv_b2_mtc)...
%                    + statevar_timelines(:, indexS_vv_a2_mtc)...
%                    + statevar_timelines(:, indexS_vv_b1_cpm)...
%                    + statevar_timelines(:, indexS_vv_a1_cpm)...
%                    + statevar_timelines(:, indexS_vv_b2_cpm)...
%                    + statevar_timelines(:, indexS_vv_a2_cpm)...
%                    + statevar_timelines(:, indexS_vv_pm);
% 
% indexPDStatevar = indexPDStatevar + 1;
% indexPDStatevarEPD_sum_of_vv_snares = indexPDStatevar;
% expPreDataStatevar_names{indexPDStatevar} = 'sum of vv SNAREs';
% expPreDataStatevar_means(indexPDStatevar) = 1.25;
% expPreDataStatevar_sds(indexPDStatevar) = 0.05;
% expPreDataStatevar_consider(indexPDStatevar) = true;
% expPreDataStatevar_preValue(:,indexPDStatevar) = sum_of_vv_snares;
% 
 if (indexPDStatevar~=expPreDataStatevar_length)
     ME = MException('see above' );
     throw(ME)
 end
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%Initialize arrays for experimental predicted fluxes
% output_t = Output_time;
% expPreDataFluxes_length = 5;
% expPreDataFluxes_names = cell(expPreDataFluxes_length,1);
% expPreDataFluxes_means = zeros(expPreDataFluxes_length,1);
% expPreDataFluxes_sds = zeros(expPreDataFluxes_length,1);
% expPreDataFluxes_consider = zeros(expPreDataFluxes_length,1);
% expPreDataFluxes_preValue = zeros(length(output_t),expPreDataFluxes_length);
% 
% indexPDFluxes = 0;

%%%%%%%%%%%%

% fraction_bound_nb1_mtc = Output_fluxes(:,195);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_fraction_bound_nb1_mtc = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'fraction_bound_nb1_mtc';
% expPreDataFluxes_means(indexPDFluxes) = anticipated_fraction_bound_nb1_mtc;
% expPreDataFluxes_sds(indexPDFluxes) = 0.01;
% expPreDataFluxes_consider(indexPDFluxes) = true;
% expPreDataFluxes_preValue(:,indexPDFluxes) = fraction_bound_nb1_mtc;
% fraction_bound_nb1_mtc = Output_fluxes(:,195);

%%%%%%%%%%%%

% fraction_bound_na2_mtc = Output_fluxes(:,197);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_fraction_bound_na2_mtc = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'fraction_bound_na2_mtc';
% expPreDataFluxes_means(indexPDFluxes) = 0.9;
% expPreDataFluxes_sds(indexPDFluxes) = 0.01;
% expPreDataFluxes_consider(indexPDFluxes) = true;
% expPreDataFluxes_preValue(:,indexPDFluxes) = fraction_bound_na2_mtc;

%%%%%%%%%%%%

% a2_mtc_into_cg = Output_fluxes(:,14);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_a2_mtc_into_cg = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'a2_mtc_into_cg';
% expPreDataFluxes_means(indexPDFluxes) = anticipated_backwardFlux_a2_mtc_into_cg;
% expPreDataFluxes_sds(indexPDFluxes) = 0.05;
% expPreDataFluxes_consider(indexPDFluxes) = true;
% expPreDataFluxes_preValue(:,indexPDFluxes) = a2_mtc_into_cg;
% 
%%%%%%%%%%%%

% a2_cpm_into_pm = Output_fluxes(:,12);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_a2_cpm_into_pm = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'a2_cpm_into_pm';
% expPreDataFluxes_means(indexPDFluxes) = 0.4;
% expPreDataFluxes_sds(indexPDFluxes) = 0.05;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = a2_cpm_into_pm;

%%%%%%%%%%%%

% a2_cpm_into_mtc = Output_fluxes(:,13);
% a2_cpm_into_pm = Output_fluxes(:,12);
% ratio_a2_cpm_into_mtc_vs_a2_cpm_into_pm = a2_cpm_into_mtc ./ a2_cpm_into_pm;
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_ratio_a2_cpm_into_mtc_vs_a2_cpm_into_pm = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'ratio_a2_cpm_into_mtc_vs_a2_cpm_into_pm';
% expPreDataFluxes_means(indexPDFluxes) = 60/40;
% expPreDataFluxes_sds(indexPDFluxes) = 0.33;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = ratio_a2_cpm_into_mtc_vs_a2_cpm_into_pm;
% 
% %%%%%%%%%%%%
% 
% b1_cg_into_mtc = Output_fluxes(:,8);
% b1_cg_into_g = Output_fluxes(:,7);
% ratio_b1_cg_into_mtc_vs_b1_cg_into_g = b1_cg_into_mtc ./ b1_cg_into_g;
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_ratio_b1_cg_into_mtc_vs_b1_cg_into_g = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'ratio_b1_cg_into_mtc_vs_b1_cg_into_g';
% expPreDataFluxes_means(indexPDFluxes) = 1e6;
% expPreDataFluxes_sds(indexPDFluxes) = 0.5e6;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = ratio_b1_cg_into_mtc_vs_b1_cg_into_g;

%%%%%%%%%%%%

% b1_cpm_into_pm = Output_fluxes(:,10);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_b1_cpm_into_pm = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'b1_cpm_into_pm';
% expPreDataFluxes_means(indexPDFluxes) = 0.5;
% expPreDataFluxes_sds(indexPDFluxes) = 0.05;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = b1_cpm_into_pm;

%%%%%%%%%%%%

% a2_cg_into_g = Output_fluxes(:,15);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_a2_cg_into_g = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'a2_cg_into_g';
% expPreDataFluxes_means(indexPDFluxes) = 0.5;
% expPreDataFluxes_sds(indexPDFluxes) = 0.05;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = a2_cg_into_g;

%%%%%%%%%%%%

% snareYVcomplexes_b1_cpm_pm = Output_fluxes(:,211);
% snareYV_complexes_per_fused_vesicle_b1_cpm_pm = snareYVcomplexes_b1_cpm_pm ./ (b1_cpm_into_pm/antero_vesicle_surface_area);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_snareYVcomplexes_b1_cpm_pm = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'YVcompl_b1_cpm_pm_per_vesicle';
% expPreDataFluxes_means(indexPDFluxes) = 5;
% expPreDataFluxes_sds(indexPDFluxes) = 1;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = snareYV_complexes_per_fused_vesicle_b1_cpm_pm;

%%%%%%%%%%%%

% snareXUcomplexes_a2_cg_g = Output_fluxes(:,215);
% snareXU_complexes_per_fused_vesicle_a2_cg_g = snareXUcomplexes_a2_cg_g ./ (a2_cg_into_g/antero_vesicle_surface_area);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_snareXUcomplexes_a2_cg_g = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'XUcompl_a2_cg_g_per_vesicle';
% expPreDataFluxes_means(indexPDFluxes) = 5;
% expPreDataFluxes_sds(indexPDFluxes) = 1;
% expPreDataFluxes_consider(indexPDFluxes) = false;
% expPreDataFluxes_preValue(:,indexPDFluxes) = snareXU_complexes_per_fused_vesicle_a2_cg_g;

%%%%%%%%%%%%

% fraction_of_fusing_vesicles_b1_cpm_pm = Output_fluxes(:,10) / statevar_timelines(end,indexS_nb1_cpm);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_fraction_of_fusing_vesicles_b1_cpm_pm = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'fraction fusing nb1 cpm';
% expPreDataFluxes_means(indexPDFluxes) = anticipated_fraction_bound_nb1_mtc;;
% expPreDataFluxes_sds(indexPDFluxes) = 0.01;
% expPreDataFluxes_consider(indexPDFluxes) = true;
% expPreDataFluxes_preValue(:,indexPDFluxes) = fraction_of_fusing_vesicles_b1_cpm_pm;

%%%%%%%%%%%%

% fraction_of_fusing_vesicles_a2_cg_g = Output_fluxes(:,15) / statevar_timelines(end,indexS_na2_cg);
% 
% indexPDFluxes = indexPDFluxes + 1;
% indexPDFluxesEPD_fraction_of_fusing_vesicles_a2_cg_g = indexPDFluxes;
% expPreDataFluxes_names{indexPDFluxes} = 'fraction fusing na2 cg g';
% expPreDataFluxes_means(indexPDFluxes) = 0.9;%expPreDataFluxes_means(indexPDFluxesEPD_fraction_bound_na2_mtc);
% expPreDataFluxes_sds(indexPDFluxes) = 0.1;%expPreDataFluxes_sds(indexPDFluxesEPD_fraction_bound_na2_mtc);
% expPreDataFluxes_consider(indexPDFluxes) = true;
% expPreDataFluxes_preValue(:,indexPDFluxes) = fraction_of_fusing_vesicles_a2_cg_g;

%if (indexPDFluxes~=expPreDataFluxes_length)
%    ME = MException('see above' );
%    throw(ME)
%end

%%%%%%%%%%%%






%Calculate growth velocity
s3_start = statevar_timelines(tstart_index,indexS_s3);
s3_end = statevar_timelines(end,indexS_s3);
neurite_shaft_length = s3 / (2 * pi * radius_neurite);
neurite_shaft_length_start = s3_start / (2 * pi * radius_neurite);
neurite_shaft_length_end = s3_end / (2 * pi * radius_neurite);
growth_velocity = (neurite_shaft_length_end - neurite_shaft_length_start) / reference_time_period;
