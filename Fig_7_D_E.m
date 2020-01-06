clc;
clear;
close all;

% Change hydrolysis rate 0.65/0.72 to create figure 7D & 7E

%Set fixed rates
NOG_analytical_predefine_conditions;

max_combinations = 20000;
length_velocities = length(velocities_per_hour);
effective_tubulins = zeros(max_combinations*length_velocities,1);
  nucleation_rates = zeros(max_combinations*length_velocities,1);
 degradation_rates = zeros(max_combinations*length_velocities,1);
       mtb_lengths = zeros(max_combinations*length_velocities,1);
   dyn_MTs_lengths = zeros(max_combinations*length_velocities,1);
         dyn_MTies = zeros(max_combinations*length_velocities,1);
stabilization_rates = zeros(max_combinations*length_velocities,1);
velocities_per_hour_of_combination = repmat(-1,max_combinations*length_velocities,1);  

indexCombination = 0;

%Print figures
figure_label = ['Fig 5D_hydrolysis_' num2str(hydrolysis_rate) '.png'];

fraction_bound_kk_a1b1_mtc_initial = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];

for indexV = 1:length_velocities
    velocity_per_hour = velocities_per_hour(indexV);
    kappaYV_pm = 3.5e-6;%8.5e-07;
    kappaXU_g = 8.1e-06;%7.73e-06;
    accepted_combination = true;
    decrement = 0.01;
    effective_tubulin = 8 - decrement;
    hydrolysis_rate = 0.675;%0.72;

    while (  (accepted_combination)...
           &&(effective_tubulin + decrement <= max_effective_tubulin))
        effective_tubulin = effective_tubulin + decrement;

     
        xx_g = xx_g_start ;%1.9908e+04;
        yy_pm = yy_pm_start;%2.0097e+04;
        
        
        NOG_analytical_predict_concentrations_and_parameter;
        if (accepted_combination)
            indexCombination = indexCombination + 1;
            velocities_per_hour_of_combination(indexCombination) = velocity_per_hour;
            effective_tubulins(indexCombination) = effective_tubulin;
            nucleation_rates(indexCombination) = nucleation_rate;
            degradation_rates(indexCombination) = degradation_rate;
            mtb_lengths(indexCombination) = mtb_length;
            dyn_MTs_lengths(indexCombination) = dyn_MTs_length;
            dyn_MTies(indexCombination) = dyn_MTs;
            stabilization_rates(indexCombination) =  stabilization_rate;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - v-SNARE vs velocity and kappaYV_pm -START
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figureColumns = 1;%plots_per_row; %set NOG_statevar_set
figureRows = 1;
title_font_size = 13;
axis_label_font_size = 10;
axis_scale_font_size = 9;
lineWidth = 0.4;
velocity_colors = zeros(length_velocities,3);
for indexColor = 1:length_velocities
    red = ((indexColor-1) * (255/length_velocities))/255;
    green = ((indexColor-1) * 90/length_velocities)/255;
    blue = (255 - (indexColor-1) * 255/length_velocities)/255;
    velocity_colors(indexColor,:) = [ red green blue];
end

plotIndex_of_subfigure = 1;

subplot(figureRows,figureColumns,plotIndex_of_subfigure);

minimum_velocity = 0;
maximum_kappaYV_pm = 5e-6;

distance_for_selection = 1;
for indexV = 1:length_velocities
   index_current_velocity = find(velocities_per_hour_of_combination==velocities_per_hour(indexV));
   %indexesMatch(indexV) = allIndexes_current_velocity(nextIndexMatch);
   plot(effective_tubulins(index_current_velocity),nucleation_rates(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);
%    plot3(effective_tubulins(index_current_velocity),nucleation_rates(index_current_velocity),stabilization_rates(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);
%plot3(effective_tubulins(index_current_velocity),nucleation_rates(index_current_velocity),degradation_rates(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);

% plot(effective_tubulins(index_current_velocity),nucleation_rates(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);
  

   hold on;
%    kappaYV_pm_selected_of_current_velocity = kappaYV_pm_selected_for_valdiation_of_analytical_prediction{indexV};
%    length_kappaYV_pm_selected_of_current_velocity = length(kappaYV_pm_selected_of_current_velocity);
%    
%    last_start_total_vvs = start_total_vvs(index_current_velocity(1));
%    last_kappaYV_pm = kappaYV_pms(index_current_velocity(1));
%    indexKappaYV_pms = index_current_velocity(1);
%    euclidian_distance = 1e1000;
% 
%    indexSelection = 0;
%    while (  (any(index_current_velocity==indexKappaYV_pms+1))) 
%        minimum_euclidian_distance = 1;
%        while (  (any(index_current_velocity==indexKappaYV_pms+1))...
%               &&(euclidian_distance < minimum_euclidian_distance))
%            indexKappaYV_pms = indexKappaYV_pms + 1;
%            x = (last_start_total_vvs-start_total_vvs(indexKappaYV_pms))/1e4;
%            y = (last_kappaYV_pm-kappaYV_pms(indexKappaYV_pms))/1e-6;
%            euclidian_distance = sqrt(x^2 + y^2);
%        end
%        selected_start_total_vvs = start_total_vvs(indexKappaYV_pms);
%        selected_kappaYV_pms = kappaYV_pms(indexKappaYV_pms);
%        indexSelection = indexSelection + 1;
%        selected_kappaYV_pms_for_validation(indexV,indexSelection) = selected_kappaYV_pms;
%        plot(selected_start_total_vvs,selected_kappaYV_pms,'.','color',velocity_colors(indexV,:));
%        last_kappaYV_pm = selected_kappaYV_pms;
%        last_start_total_vvs = selected_start_total_vvs;
%        euclidian_distance = -1;
%    end
end

xlabel({'Tubulin sequestration';'(Efective tubulin [\muM])'},'FontSize',axis_label_font_size);
ylabel({'Dynamic MT nucleation';'(MT nucleation rate [/min])'},'FontSize',axis_label_font_size);
zlabel('Stabilization rate','FontSize',axis_label_font_size);
%legend('0.00 \mum/h','2.50 \mum/h','5.00 \mum/h','7.50 \mum/h','10.00 \mum/h','12.50 \mum/h','15.00 \mum/h','17.50 \mum/h','20.00 \mum/h')
set(gca,'FontSize',axis_scale_font_size);
xlim([8 10]);
% ylim([0 50]);

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.35*figureColumns 2*figureRows])
print(figure_label,'-dpng','-r600');



% plot(k_vv_productions(indexesMatch),kappaYV_pms(indexesMatch),'.r','markers',20);
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - v-SNARE vs velocity and kappaYV_pm - END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

