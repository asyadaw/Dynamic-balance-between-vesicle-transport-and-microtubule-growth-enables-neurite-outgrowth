clc;
clear;
close all;


NOG_analytical_predefine_conditions;


b1_color = [255/255 130/255 0]; % orange
a1_color = [255/255 130/255 0]; % orange
b2_color = [0/255 100/255 200/255]; % blue
a2_color = [0/255 100/255 200/255]; % blue
b1_lineStyle = '-';
a1_lineStyle = '--';
a2_lineStyle = '-';
b2_lineStyle = '--';

max_combinations = 200000;
length_velocities = length(velocities_per_hour);
velocities_per_hour_of_combination = repmat(-1,max_combinations*length_velocities,1);
start_total_xxs = zeros(max_combinations*length_velocities,1);
start_total_yys = zeros(max_combinations*length_velocities,1);
start_total_uus = zeros(max_combinations*length_velocities,1);
start_total_vvs = zeros(max_combinations*length_velocities,1);
vv_b1_cpms = zeros(max_combinations*length_velocities,1);
yy_b1_cpms = zeros(max_combinations*length_velocities,1);
xx_b1_cpms = zeros(max_combinations*length_velocities,1);
uu_b1_cpms = zeros(max_combinations*length_velocities,1);
nb1_cpms = zeros(max_combinations*length_velocities,1);
v_forwards = zeros(max_combinations*length_velocities,1);
v_backwards = zeros(max_combinations*length_velocities,1);
u_forwards = zeros(max_combinations*length_velocities,1);
u_backwards = zeros(max_combinations*length_velocities,1);
start_total_kks = zeros(max_combinations*length_velocities,1);
start_total_dds = zeros(max_combinations*length_velocities,1);
start_total_cc1s = zeros(max_combinations*length_velocities,1);
start_total_cc2s = zeros(max_combinations*length_velocities,1);
k_vv_productions = zeros(max_combinations*length_velocities,1);
k_uu_productions = zeros(max_combinations*length_velocities,1);
k_xx_productions = zeros(max_combinations*length_velocities,1);
k_yy_productions = zeros(max_combinations*length_velocities,1);
k_dd_productions = zeros(max_combinations*length_velocities,1);
k_kk_productions = zeros(max_combinations*length_velocities,1);
k_cc1_productions = zeros(max_combinations*length_velocities,1);
k_cc2_productions = zeros(max_combinations*length_velocities,1);
initial_forward_transport_rates = zeros(max_combinations*length_velocities,1);
initial_backward_transport_rates = zeros(max_combinations*length_velocities,1);
final_forward_transport_rates = zeros(max_combinations*length_velocities,1);
final_backward_transport_rates = zeros(max_combinations*length_velocities,1);
k_membrane_productions = zeros(max_combinations*length_velocities,1);
kappaXU_gs = zeros(max_combinations*length_velocities,1);
kappaYV_pms = zeros(max_combinations*length_velocities,1);

kappaYV_pm_selected_for_valdiation_of_analytical_prediction = { [5e-6 4e-6 3e-6 2e-6 1e-6 0.75e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 1.75e-6 1.5e-6 1.25e-6 1e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 1.75e-6 1.5e-6 1.25e-6 1e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 1.75e-6 1.5e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 1.75e-6 1.5e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 1.75e-6 1.5e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 1.75e-6],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 ],...
                                 [5e-6 4.5e-6 4e-6 3.5e-6 3e-6 2.5e-6 2e-6 ] };

kappaYV_pm_selected_for_velocities = [2.5e-6 3e-6 3.5e-6 4e-6 4.5e-6 5e-6 ];
length_kappaYV_pm_selected_for_velocities = length(kappaYV_pm_selected_for_velocities);

indexCombination = 0;

%Print figures
% else
%     figure_label = 'Fig 3B';
%     suppl_figure_label = {'Suppl Fig 5B' 'Suppl Fig 5D' 'Suppl Fig 5F' 'Suppl Fig 5H' 'Suppl Fig 5J'};
% end
indexSupplFigureLabel = 0;

for indexV = 1:length_velocities
    current_velocity_per_hour = velocities_per_hour(indexV);
    accepted_combination = true;
    
    decrement = kappaYV_decrements(indexV);
    kappaYV_pm_current = kappaYV_pm_start + decrement;
    while (accepted_combination)
        NOG_analytical_predefine_conditions;        
        
        kappaYV_pm_current = kappaYV_pm_current - decrement;
        kappaYV_pm = kappaYV_pm_current;
        velocity_per_hour = current_velocity_per_hour;
        
        xx_g = xx_g_start;%1.9908e+04;
        yy_pm = yy_pm_start;%2.0097e+04;
        
        NOG_analytical_predict_concentrations_and_parameter;
        if (indexCombination==4139)
           hallo = 0; 
        end
        if ((~accepted_combination))%&(kappaYV_pm<3e-6))
           hallo = 0; 
        end
        if (accepted_combination)
            total_xxs = xx_g + xx_b1_cg + xx_b1_mtc + xx_b1_cpm + xx_pm + xx_a2_cpm + xx_a2_mtc + xx_a2_cg;
            total_yys = yy_g + yy_b1_cg + yy_b1_mtc + yy_b1_cpm + yy_pm + yy_a2_cpm + yy_a2_mtc + yy_a2_cg;
            total_vvs = vv_g + vv_b1_cg + vv_b1_mtc + vv_b1_cpm + vv_pm + vv_a2_cpm + vv_a2_mtc + vv_a2_cg;
            total_uus = uu_g + uu_b1_cg + uu_b1_mtc + uu_b1_cpm + uu_pm + uu_a2_cpm + uu_a2_mtc + uu_a2_cg;
            if (  (total_vvs<=max_total_vesicle_snares_V_for_figures))...
                indexCombination = indexCombination + 1;
                velocities_per_hour_of_combination(indexCombination) = velocity_per_hour;
                start_total_xxs(indexCombination) = xx_g + xx_b1_cg + xx_b1_mtc + xx_b1_cpm + xx_pm + xx_a2_cpm + xx_a2_mtc + xx_a2_cg;
                start_total_yys(indexCombination) = yy_g + yy_b1_cg + yy_b1_mtc + yy_b1_cpm + yy_pm + yy_a2_cpm + yy_a2_mtc + yy_a2_cg;
                start_total_uus(indexCombination) = uu_g + uu_b1_cg + uu_b1_mtc + uu_b1_cpm + uu_pm + uu_a2_cpm + uu_a2_mtc + uu_a2_cg;
                start_total_vvs(indexCombination) = vv_g + vv_b1_cg + vv_b1_mtc + vv_b1_cpm + vv_pm + vv_a2_cpm + vv_a2_mtc + vv_a2_cg;
                vv_b1_cpms(indexCombination) = vv_b1_cpm;
                yy_b1_cpms(indexCombination) = yy_b1_cpm;
                xx_b1_cpms(indexCombination) = xx_b1_cpm;
                uu_b1_cpms(indexCombination) = uu_b1_cpm;
                nb1_cpms(indexCombination) = nb1_cpm;
                v_forwards(indexCombination) = v_forward;
                v_backwards(indexCombination) = v_backward;
                uu_b1_cpms(indexCombination) = uu_b1_cpm;
                u_forwards(indexCombination) = u_forward;
                u_backwards(indexCombination) = u_backward;
                start_total_kks(indexCombination) = kk_g + kk_b1_cg + kk_b1_mtc + kk_b1_cpm + kk_pm + kk_a2_cpm + kk_a2_mtc + kk_a2_cg;
                start_total_dds(indexCombination) = dd_g + dd_b1_cg + dd_b1_mtc + dd_b1_cpm + dd_pm + dd_a2_cpm + dd_a2_mtc + dd_a2_cg;
                start_total_cc1s(indexCombination) = cc1_g + cc1_b1_cg + cc1_b1_mtc + cc1_b1_cpm + cc1_pm + cc1_a2_cpm + cc1_a2_mtc + cc1_a2_cg;
                start_total_cc2s(indexCombination) = cc2_g + cc2_b1_cg + cc2_b1_mtc + cc2_b1_cpm + cc2_pm + cc2_a2_cpm + cc2_a2_mtc + cc2_a2_cg;
                k_xx_productions(indexCombination) = k_xx_production;
                k_uu_productions(indexCombination) = k_uu_production;
                k_vv_productions(indexCombination) = k_vv_production;
                k_yy_productions(indexCombination) = k_yy_production;
                k_kk_productions(indexCombination) = k_kk_production;
                k_dd_productions(indexCombination) = k_dd_production;
                k_cc1_productions(indexCombination) = k_cc1_production;
                k_cc2_productions(indexCombination) = k_cc2_production;
                k_membrane_productions(indexCombination) = k_membrane_production;
                initial_forward_transport_rates(indexCombination) = initial_forward_transport_rate;
                initial_backward_transport_rates(indexCombination) = initial_backtransport_rate;
                final_forward_transport_rates(indexCombination) = final_forward_transport_rate;
                final_backward_transport_rates(indexCombination) = final_backtransport_rate;
                kappaXU_gs(indexCombination) = kappaXU_g;
                kappaYV_pms(indexCombination) = kappaYV_pm;
            end 
        end
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - v-SNARE vs velocity and kappaYV_pm -START
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
figure_label = 'Arjun_SNARE_V_vs_tethering';

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

SNAREs_b1_cpms_per_vesicle = (vv_b1_cpms + yy_b1_cpms + xx_b1_cpms + uu_b1_cpms) ./ (nb1_cpms/anterograde_vesicle_surface_area);
allIndexes = 1:length(SNAREs_b1_cpms_per_vesicle);
indexesMatch = zeros(length_velocities,1);

selected_kappaYV_pms_for_validation = zeros(length_velocities,8);

distance_for_selection = 1;
for indexV = 1:length_velocities
   index_current_velocity = find(velocities_per_hour_of_combination==velocities_per_hour(indexV));
   SNAREs_b1_cpms_per_vesicle_current_velocity = SNAREs_b1_cpms_per_vesicle(index_current_velocity);
   allIndexes_current_velocity = allIndexes(index_current_velocity);
   nextIndexMatch = find(       abs(SNAREs_b1_cpms_per_vesicle_current_velocity-60) ...
                         == min(abs(SNAREs_b1_cpms_per_vesicle_current_velocity-60)));
   indexesMatch(indexV) = allIndexes_current_velocity(nextIndexMatch);
   plot(start_total_vvs(index_current_velocity),kappaYV_pms(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);
   hold on;
   kappaYV_pm_selected_of_current_velocity = kappaYV_pm_selected_for_valdiation_of_analytical_prediction{indexV};
   length_kappaYV_pm_selected_of_current_velocity = length(kappaYV_pm_selected_of_current_velocity);
   
   last_start_total_vvs = start_total_vvs(index_current_velocity(1));
   last_kappaYV_pm = kappaYV_pms(index_current_velocity(1));
   indexKappaYV_pms = index_current_velocity(1);
   euclidian_distance = 1e1000;

   indexSelection = 0;
   minimum_euclidian_distances = [1 0.95 0.90 0.85 0.80 0.75 0.70 0.65 0.60];
   while (  (any(index_current_velocity==indexKappaYV_pms+1))) 
       minimum_euclidian_distance = minimum_euclidian_distances(indexV);
       while (  (any(index_current_velocity==indexKappaYV_pms+1))...
              &&(euclidian_distance < minimum_euclidian_distance))
           indexKappaYV_pms = indexKappaYV_pms + 1;
           x = (last_start_total_vvs-start_total_vvs(indexKappaYV_pms))/1e4;
           y = (last_kappaYV_pm-kappaYV_pms(indexKappaYV_pms))/1e-6;
           euclidian_distance = sqrt(x^2 + y^2);
       end
       selected_start_total_vvs = start_total_vvs(indexKappaYV_pms);
       selected_kappaYV_pms = kappaYV_pms(indexKappaYV_pms);
       last_kappaYV_pm = selected_kappaYV_pms;
       last_start_total_vvs = selected_start_total_vvs;
       euclidian_distance = -1;
       if (any(index_current_velocity==indexKappaYV_pms+1))
          indexSelection = indexSelection + 1;
          selected_kappaYV_pms_for_validation(indexV,indexSelection) = selected_kappaYV_pms;
          %plot(selected_start_total_vvs,selected_kappaYV_pms,'.','color',velocity_colors(indexV,:));
       end
   end
end

dlmwrite('selected_kappaYV_pms_for_validation.tab',selected_kappaYV_pms_for_validation);
dlmwrite('velocities_for_selected_kappaYV_pms.tab',velocities_per_hour);


xlabel({'(v-SNARE V [molecules])';'Vesicle fusion with GC-PM'},'FontSize',axis_label_font_size);
ylabel({'Vesicle tethering';'at GC-PM (Tethering';'rate for YV at GC)'},'FontSize',axis_label_font_size);
xlim([0 max_total_vesicle_snares_V_for_figures]);
ylim([0 maximum_kappaYV_pm]);
set(gca,'FontSize',axis_scale_font_size);

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.35*figureColumns 2*figureRows])
print(figure_label,'-dpng','-r500');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - v-SNARE vs velocity and kappaYV_pm - END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - v-SNARE production rate: v-SNARE vs velocity and kappaYV_pm - END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure;
figure_label = 'Arjun_SNARE_V_vs_tethering_production_rates';

plotIndex_of_subfigure = 0;
figureColumns = 1;%plots_per_row; %set NOG_statevar_set
figureRows = 1;

plotIndex_of_subfigure = plotIndex_of_subfigure + 1;
subplot(figureRows,figureColumns,plotIndex_of_subfigure);



k_vv_productions_for_plot = zeros(length_kappaYV_pm_selected_for_velocities,length_velocities);
for indexV = 1:length_velocities
   current_velocity = velocities_per_hour(indexV);
   indexes_current_velocity = find(velocities_per_hour_of_combination==current_velocity);
   kappaYV_pm_current_velocity = kappaYV_pms(indexes_current_velocity);
   current_k_vv_productions = k_vv_productions(indexes_current_velocity);
   indexesMatch = zeros(length_kappaYV_pm_selected_for_velocities,1);
   for indexKYV = 1:length_kappaYV_pm_selected_for_velocities
       current_kappaYV_pm_selected = kappaYV_pm_selected_for_velocities(indexKYV);
       indexMatch = find(       abs(kappaYV_pm_current_velocity-current_kappaYV_pm_selected) ...
                         == min(abs(kappaYV_pm_current_velocity-current_kappaYV_pm_selected)));
       indexesMatch(indexKYV) = indexMatch;
       if (round(current_kappaYV_pm_selected/kappaYV_pm_current_velocity(indexMatch))~=1)
           ME = MException('see above' ); throw(ME)
       end
   end
   k_vv_productions_for_plot(:,indexV) = current_k_vv_productions(indexesMatch); 
end



for indexKYV = 1:length_kappaYV_pm_selected_for_velocities
    current_k_vv_productions_for_plot = k_vv_productions_for_plot(indexKYV,:);
    length_velocities = length(velocities_per_hour);
    velocity_colors = zeros(length_velocities,3);
    for indexColor = 1:length_velocities
        red = ((indexColor-1) * (255/length_velocities))/255;
        green = ((indexColor-1) * 90/length_velocities)/255;
        blue = (255 - (indexColor-1) * 255/length_velocities)/255;
        velocity_colors(indexColor,:) = [ red green blue];
    end
    for indexV = 2:length_velocities
        former_indexV = indexV -1;
        plot(velocities_per_hour(former_indexV:indexV),current_k_vv_productions_for_plot(former_indexV:indexV),'Color',velocity_colors(indexV,:),'LineWidth',lineWidth);
        hold on;
    end
end

ylabel({'v-SNARE V synthesis';'[molecules/min]'},'FontSize',axis_label_font_size);
xlabel({'NOG velocity';'[\mum/h]'},'FontSize',axis_label_font_size);
ylim([0 20]);
set(gca,'FontSize',axis_scale_font_size);


set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.35*figureColumns 2*figureRows])
print(figure_label,'-dpng','-r600');

