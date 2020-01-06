clc;
clear;
close all;


%Set fixed rates
%factor_kappaYV_pms = [1 1.26 1.52 1.78 2.04 2.3 2.56 2.82 15];
%factor_kappaYV_pms = [ 10 10 10 10 10 10 10 10 10];
%factor_kappaYV_pms = [50 50 50 50 200 200 200 200 200];
%vv_increasements = [ 5e0 5e0 5e0 5e0 5e0 5e0 5e0 5e0 5e0];

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
wb_gs = zeros(max_combinations*length_velocities,1);
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

kappaYV_pm_selected_for_velocities = [2.5e-6 2.5e-6 3e-6 3.5e-6 4e-6 4.5e-6 5e-6 ];
length_kappaYV_pm_selected_for_velocities = length(kappaYV_pm_selected_for_velocities);

indexCombination = 0;

max_wb_g_for_figures = 0.5*1E-3;

cc1_gs = 10:1:200;

%Print figures
% else
%     figure_label = 'Fig 3B';
%     suppl_figure_label = {'Suppl Fig 5B' 'Suppl Fig 5D' 'Suppl Fig 5F' 'Suppl Fig 5H' 'Suppl Fig 5J'};
% end
indexSupplFigureLabel = 0;


%Figure 3A: Modify recruitment factor 1 at TGN
for indexV = 1:length_velocities
    current_velocity_per_hour = velocities_per_hour(indexV);
    accepted_combination = true;

    length_cc1_gs = length(cc1_gs);
    for indexCC1_g = 1:length_cc1_gs
        NOG_analytical_predefine_conditions;        

        cc1_g = cc1_gs(indexCC1_g);
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
            indexCombination = indexCombination + 1;
            %if (wb_g <= max_wb_g_for_figures)
                velocities_per_hour_of_combination(indexCombination) = velocity_per_hour;
                start_total_xxs(indexCombination) = xx_g + xx_b1_cg + xx_b1_mtc + xx_b1_cpm + xx_pm + xx_a2_cpm + xx_a2_mtc + xx_a2_cg;
                start_total_yys(indexCombination) = yy_g + yy_b1_cg + yy_b1_mtc + yy_b1_cpm + yy_pm + yy_a2_cpm + yy_a2_mtc + yy_a2_cg;
                start_total_uus(indexCombination) = uu_g + uu_b1_cg + uu_b1_mtc + uu_b1_cpm + uu_pm + uu_a2_cpm + uu_a2_mtc + uu_a2_cg;
                start_total_vvs(indexCombination) = vv_g + vv_b1_cg + vv_b1_mtc + vv_b1_cpm + vv_pm + vv_a2_cpm + vv_a2_mtc + vv_a2_cg;
                start_total_cc1s(indexCombination) = cc1_g + cc1_b1_cg + cc1_b1_mtc + cc1_b1_cpm + cc1_pm + cc1_a2_cpm + cc1_a2_mtc + cc1_a2_cg;
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
                wb_gs(indexCombination) = wb_g;
            %end  
        end 
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - cc1 vs wb_G -START
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
figure_label = 'Arjun_cc1_vs_wb_g';

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
   plot(start_total_cc1s(index_current_velocity),wb_gs(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);
   hold on;
end

max_total_cc1s_for_figures = max(start_total_cc1s);

xlabel({'(Recruitment factor 1 [molecules])';'Coat recruitment and formation at TGN'},'FontSize',axis_label_font_size);
ylabel({'Vesicle invagination';'and scission at TGN';'(Budding rate at TGN)'},'FontSize',axis_label_font_size);
xlim([0 max_total_cc1s_for_figures]);
ylim([0 max_wb_g_for_figures]);
set(gca,'FontSize',axis_scale_font_size);

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.35*figureColumns 2*figureRows])
print(figure_label,'-dpng','-r600');

