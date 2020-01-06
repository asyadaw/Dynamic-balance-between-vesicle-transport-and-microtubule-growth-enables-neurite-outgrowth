clc;
clear;
close all;
tic;

% Main simulation file
% This is the main file of simulation where one run simulation of neurite
% outgrowth of a given outgrowth velocity and change the time span
% accordingly, We have calculated parameters values analytically by using
% top down approach for any give outgrowth velocity                        
% Arjun Singh Yadaw and Jens Hansen, New York, 03-12-2019.

global Output_fluxes Output_time

tspan = [0 1440]; % simulation for 24hrs

NOG_analytical_predefine_conditions; 
NOG_initialConc;
NOG_analytical_predefine_conditions;

velocity_per_hour = 10; % Neurite out growth velocity

NOG_analytical_predict_concentrations_and_parameter; %  
if (~accepted_combination)
   ME = MException('see above');
   throw(ME);
end

%% V_snare related changes 
% frac = 1.0;%0.25;
% k_vv_production = frac* k_vv_production;
% vv_g = frac*vv_g;
% vv_b1_cg = frac*vv_b1_cg;
% vv_b1_mtc = frac*vv_b1_mtc;
% vv_b1_cpm = frac*vv_b1_cpm;
% vv_pm = frac*vv_pm;
% 
% %% MT dynamics Related changes
% stabilization_rate = 1*stabilization_rate;


%%

NOG_parameter_vector_set;
NOG_statevar_set;
statevar_input = statevar;
 
Output_fluxes = [];
Output_time = [];
timepoint_of_last_common_nucleation1 = 0;
[t,statevar_timelines] = ode15s(@(t,statevar)NOG_function1(t,statevar,parameters,statevar_input,statevar_buffer),tspan, statevar_input);
statevar_last_timepoints = statevar_timelines(end,:)';

NOG_define_expVSpredic;
NOG_plot_statevar_vs_time;
NOG_plot_selectedValues_vs_statevar_paper_figure;
NOG_plot_fluxes_vs_time;
% % 
% % Print_concentration_parameter;

% Collect predicted and aimed values
bar_width = 0.5;
reference_xlims = 5;
indexStatevarTime = 1;
indexFluxTime = 1;

%%%%%%%Define reference time and indexes
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

reference_time_period = t(indexStatevarTime) - t(tstart_index);


length_predictions = 8;
indexPredictedValue = 0;
predictedValue_barlabels = cell(length_predictions,1);
predictedValue_titels = cell(length_predictions,1);
predictedValue_ylabels = cell(length_predictions,1);
predictedValue_unit = cell(length_predictions,1);
predictedValue_sum = zeros(length_predictions,1);
predictedValue_new_subplot = zeros(length_predictions,1);
predictedValue_barcolors = zeros(length_predictions,3);
predictedValue_barWidths = zeros(length_predictions,3);
predictedValue_sdcolors = zeros(length_predictions,3);
predictedValue_sumOfSquares = zeros(length_predictions,1);
predictedValue_targetOutputs = zeros(length_predictions,1);
predictedValue_upper_ylims = zeros(length_predictions,1);
predictedValue_left_xlims = zeros(length_predictions,1);

indexPredictedValue = indexPredictedValue + 1;
predicted_s3_change = statevar_timelines(indexStatevarTime,indexS_s3) - statevar_timelines(tstart_index,indexS_s3);
predictedValue_barlabels{indexPredictedValue} = {''};
predictedValue_titles{indexPredictedValue} = {'Neurite Shaft'};
predictedValue_ylabels{indexPredictedValue} = {'Growth velocity';'[\mum/h]'};
predictedValue_unit{indexPredictedValue} = '[\mum/h]';
predictedValue_barcolors(indexPredictedValue,:) = [0 155/255 0];
predictedValue_sdcolors(indexPredictedValue,:) = [0 55/255 0];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = (60 * predicted_s3_change/(2*pi*radius_neurite)) / reference_time_period;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = velocity_per_hour;
predictedValue_upper_ylims(indexPredictedValue) = max(velocities_per_hour) * 1.2;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

indexPredictedValue = indexPredictedValue + 1;
predictedValue_barlabels{indexPredictedValue} = {''};
predictedValue_titles{indexPredictedValue} = {'Trans-Golgi';'Network (TGN)'};
predictedValue_ylabels{indexPredictedValue} = {'Surface area';'[\mum^2]'};
predictedValue_unit{indexPredictedValue} = '[\mum^2]';
predicted_sg = statevar_timelines(indexStatevarTime,indexS_sg);
predictedValue_barcolors(indexPredictedValue,:) = [0 155/255 0];    
predictedValue_sdcolors(indexPredictedValue,:) = [0 55/255 0];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = predicted_sg;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = 50;
predictedValue_upper_ylims(indexPredictedValue) = 105;%predictedValue_targetOutputs(indexPredictedValue) * 1.2;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

indexPredictedValue = indexPredictedValue + 1;
predictedValue_barlabels{indexPredictedValue} = {''};
predictedValue_titles{indexPredictedValue} = {'Growth Cone'; 'Plasma Membrane'; '(GC-PM)'};
predictedValue_ylabels{indexPredictedValue} = {'Surface area';'[\mum^2]'};
predictedValue_unit{indexPredictedValue} = '[\mum^2]';
predicted_sg = statevar_timelines(indexStatevarTime,indexS_spm);
predictedValue_barcolors(indexPredictedValue,:) = [0 155/255 0];    
predictedValue_sdcolors(indexPredictedValue,:) = [0 55/255 0];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = predicted_sg;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = 50;
predictedValue_upper_ylims(indexPredictedValue) = 105;%predictedValue_targetOutputs(indexPredictedValue) * 1.2;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

indexPredictedValue = indexPredictedValue + 1;
predicted_cycling_membrane = Output_fluxes(indexFluxTime,12);
predictedValue_barlabels{indexPredictedValue} = {''};
predictedValue_titles{indexPredictedValue} = {'Membrane cycling';'between';'TGN and GC-PM'};
predictedValue_ylabels{indexPredictedValue} = {'Surface area';'[\mum^2/min]'};
predictedValue_unit{indexPredictedValue} = '[\mum/min]';
predictedValue_barcolors(indexPredictedValue,:) = [0 155/255 0];
predictedValue_sdcolors(indexPredictedValue,:) = [0 55/255 0];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = predicted_cycling_membrane;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = cycling_rate;
predictedValue_upper_ylims(indexPredictedValue) = 0.7;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

indexPredictedValue = indexPredictedValue + 1;
fraction_bound_nb1_mtc = Output_fluxes(indexFluxTime,159);
predictedValue_barlabels{indexPredictedValue} = {'Neurite Shaft'; 'Cytoplasm'};%'Percent of moving b1 vesicles in MTC';
predictedValue_titles{indexPredictedValue} = {'B_G vesicles';'transported';'along microtubules'};
predictedValue_ylabels{indexPredictedValue} = {'Percent';'[%]'};
predictedValue_unit{indexPredictedValue} = '[%]';
predictedValue_barcolors(indexPredictedValue,:) = [255/255 130/255 0];
predictedValue_sdcolors(indexPredictedValue,:) = [200/255 100/255 0];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = fraction_bound_nb1_mtc * 100;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = anticipated_fraction_of_bound_b1_vesicles_in_mtc * 100;
predictedValue_upper_ylims(indexPredictedValue) = 16;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

fraction_of_fusing_vesicles_b1_cpm_pm = Output_fluxes(indexFluxTime,8) / statevar_timelines(indexStatevarTime,indexS_nb1_cpm);
indexPredictedValue = indexPredictedValue + 1;
predictedValue_barlabels{indexPredictedValue} = {'Growth Cone';'Cytoplasm'};%'Percent of fusing b1 vesicles in growth cone';
predictedValue_titles{indexPredictedValue} = {'B_G vesicles';'fusing with';'Growth cone PM' };
predictedValue_ylabels{indexPredictedValue} = {'Percent','[%]'};
predictedValue_unit{indexPredictedValue} = '[%]';
predictedValue_barcolors(indexPredictedValue,:) = [255/255 130/255 0];
predictedValue_sdcolors(indexPredictedValue,:) = [200/255 100/255 0];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = fraction_of_fusing_vesicles_b1_cpm_pm * 110;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = anticipated_fraction_of_bound_b1_vesicles_in_mtc * 100;
predictedValue_upper_ylims(indexPredictedValue) = 16;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

fraction_bound_na2_mtc = Output_fluxes(indexFluxTime,161);
indexPredictedValue = indexPredictedValue + 1;
predictedValue_barlabels{indexPredictedValue} = {'Neurite Shaft'; 'Cytoplasm'};%'Percent of moving b1 vesicles in MTC';
predictedValue_titles{indexPredictedValue} = {'A_P_M vesicles';'transported';'along microtubules'};
predictedValue_ylabels{indexPredictedValue} = {'Percent';'[%]'};
predictedValue_unit{indexPredictedValue} = '[%]';
predictedValue_barcolors(indexPredictedValue,:) = [0/255 100/255 200/255];
predictedValue_sdcolors(indexPredictedValue,:) = [0/255 0/255 200/255];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = fraction_bound_na2_mtc * 100;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = anticipated_fraction_of_bound_a2_vesicles_in_mtc * 100;
predictedValue_upper_ylims(indexPredictedValue) = 120;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);

fraction_of_fusing_vesicles_a2_cg_g = Output_fluxes(indexFluxTime,9) / statevar_timelines(indexStatevarTime,indexS_na2_cg);
indexPredictedValue = indexPredictedValue + 1;
predictedValue_barlabels{indexPredictedValue} = {'Cell Body';'Cytoplasm'};%'Percent of fusing b1 vesicles in growth cone';
predictedValue_titles{indexPredictedValue} = {'A_P_M vesicles';'fusing with';'TGN' };
predictedValue_ylabels{indexPredictedValue} = {'Percent','[%]'};
predictedValue_unit{indexPredictedValue} = '[%]';
predictedValue_barcolors(indexPredictedValue,:) = [0/255 100/255 200/255];
predictedValue_sdcolors(indexPredictedValue,:) = [0/255 0/255 200/255];
predictedValue_new_subplot(indexPredictedValue) = true;
predValue = fraction_of_fusing_vesicles_a2_cg_g * 100;
predictedValue_sum(indexPredictedValue) = predictedValue_sum(indexPredictedValue) + predValue;
predictedValue_sumOfSquares(indexPredictedValue) = predictedValue_sumOfSquares(indexPredictedValue) + predValue^2;
predictedValue_targetOutputs(indexPredictedValue) = anticipated_fraction_of_bound_a2_vesicles_in_mtc * 100;
predictedValue_upper_ylims(indexPredictedValue) = 120;
predictedValue_left_xlims(indexPredictedValue) = 2;
predictedValue_barWidths(indexPredictedValue) = reference_xlims * bar_width/(2*predictedValue_left_xlims(indexPredictedValue)+1);


predictedValue_means = predictedValue_sum / 1;

figure;
subplots_count = 0;
for indexPredicted = 1:length_predictions 
   if (predictedValue_new_subplot(indexPredicted))
      subplots_count = subplots_count + 1;
   end
end

subplot_rows = 2;
subplot_cols = 4;%subplots_count;
title_font_size = 9;
xaxis_label_font_size = 9;
yaxis_label_font_size = 9;
yaxis_scale_font_size = 9;
plotIndex_of_subfigure = 0;
errorbar_width = 2;
referenceLineWidth = 1;

for indexPredicted = 1:length_predictions 
   if (predictedValue_new_subplot(indexPredicted))
       firstIndexPredicted = indexPredicted;
       color = predictedValue_barcolors(indexPredicted,:);
   end
   if (  (indexPredicted==length_predictions)...
       ||(predictedValue_new_subplot(indexPredicted+1)))
       plotIndex_of_subfigure = plotIndex_of_subfigure + 1;
       subplot(subplot_rows,subplot_cols,plotIndex_of_subfigure);
       means = predictedValue_means(firstIndexPredicted:indexPredicted);
       bar_width = predictedValue_barWidths(firstIndexPredicted);
       b = bar(means,'FaceColor',predictedValue_barcolors(firstIndexPredicted,:),'EdgeColor',predictedValue_barcolors(firstIndexPredicted,:),'BarWidth',bar_width);
       hold on;
       hline = refline([0 predictedValue_targetOutputs(indexPredicted)]);%,'LineWidth',referenceLineWidth);%,'Color',predictedValue_sdcolors(firstIndexPredicted,:));
       set(hline,'Color',predictedValue_sdcolors(firstIndexPredicted,:));
       set(hline,'LineWidth',referenceLineWidth);
       %hline_upper = refline([0 predictedValue_targetOutputs(indexPredicted)*1.1]);%,'LineWidth',referenceLineWidth);%,'Color',predictedValue_sdcolors(firstIndexPredicted,:));
       %set(hline_upper,'Color',predictedValue_sdcolors(firstIndexPredicted,:));
       %set(hline_upper,'LineWidth',referenceLineWidth);
       %hline_lower = refline([0 predictedValue_targetOutputs(indexPredicted)*0.9]);%,'LineWidth',referenceLineWidth);%,'Color',predictedValue_sdcolors(firstIndexPredicted,:));
       %set(hline_lower,'Color',predictedValue_sdcolors(firstIndexPredicted,:));
       %set(hline_lower,'LineWidth',referenceLineWidth);
       ylim([0 predictedValue_upper_ylims(firstIndexPredicted)]);
       xlim([0 predictedValue_left_xlims(firstIndexPredicted)]);

      % for indexBar = 1:(indexPredicted-firstIndexPredicted+1)
      %     x = get(get(b,'Area'),'xdata'); 
      %     barsx = mean(x,1);
      %     h1 = errorbar(barsx(indexBar)',means(indexBar),sds(indexBar),'Color',predictedValue_sdcolors(firstIndexPredicted,:),'LineWidth',errorbar_width);
      % end
       %errorbar(b,means,predictedValue_sample_sds(firstIndexPredicted:indexPredicted));
       set(gca,'XTickLabel','','FontSize',xaxis_label_font_size);
       xlabel(predictedValue_barlabels{firstIndexPredicted},'FontSize',xaxis_label_font_size);
       title(predictedValue_titles{firstIndexPredicted},'FontSize',title_font_size);
       ylabel(predictedValue_ylabels{firstIndexPredicted},'FontSize',yaxis_label_font_size);
       %plot(targetOutputs(1),[30 30]');
       %errorbar(means,sample_sds);
   end
end

subplot_cols = 3;
subplot_rows = 2;
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 2*subplot_cols 2*subplot_rows])
print('Fig 4d.png','-dpng','-r600');





%% Growth Velocity, effective dynamic MT length, 
% dyn_MTs = statevar_timelines(:,indexS_dyn_MTs);
% effective_tubulin = statevar_timelines(:,indexS_effective_tubulin);
% x = effective_tubulin;
% scale = scale_initial_a * exp(scale_exp_a*x) + scale_initial_b * exp(scale_exp_b*x);
% shape = shape_m * x + shape_b;
% 
% average_dynMT_length = scale .* shape;
% dynMT_length = average_dynMT_length .* dyn_MTs / MTs_per_crosssection;
% stbl_MTs_length = statevar_timelines(:,indexS_stbl_MTs_length) / MTs_per_crosssection;
% 
% effective_dyn_MT_length = dyn_MTs(end)*average_dynMT_length(end);
% MTB_length_start = dynMT_length(1) + stbl_MTs_length(1);
% MTB_length_end = dynMT_length(end) + stbl_MTs_length(end);
% growth_velocity = 60*(MTB_length_end-MTB_length_start)/1500;



toc;

