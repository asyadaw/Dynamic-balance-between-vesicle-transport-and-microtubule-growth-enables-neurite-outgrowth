clc;
clear;
close all;

%Set fixed rates
NOG_parameters_set_general;
MTC_length_at_start = 5;
cycling_rate = 0.5;
figure_set = 1; %figure set 1: 0.5 %%% figure set 2: 1
a2_pm_into_cpm = cycling_rate;
anticipated_fraction_of_bound_b1_vesicles_in_mtc = 0.1;
anticipated_fraction_of_bound_a2_vesicles_in_mtc = 0.9;
anterograde_vesicle_surface_area = 0.05;
SNARE_complexes_per_vesicle_fusion = 5;
spm = 50;
sg = 50;
s3 = MTC_length_at_start * 2 * pi * radius_neurite;
xx_pm = 0.4;%8.7579;
xx_g = 20000;%1.9908e+04;
yy_pm = 20000;%2.0097e+04;
yy_g = 0.4;%0.4573;
kappaYV_pm = 8.1e-07; %8.5e-07;
kappaXU_g = 8.1e-06; %7.73e-06;
with_MTC_growth = true;
fraction_bound_dd_a2b2_mtc = 0.84;
fraction_bound_kk_a1b1_mtc = 0.0815;

effective_dyn_MTs_length = 20;
max_effective_tubulin = 10;

%Set varying values
velocities_per_hour = [0 2.5 5 7.5 10 12.5 15 17.5 20];
%factor_kappaYV_pms = [1 1.26 1.52 1.78 2.04 2.3 2.56 2.82 15];
factor_kappaYV_pms = [10 10 10 10 10 10 10 10 10];
%factor_kappaYV_pms = [50 50 50 50 200 200 200 200 200];

vv_increasements = [5e0 5e0 5e0 5e0 5e0 5e0 5e0 5e0 5e0];
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
k_membrane_productions = zeros(max_combinations*length_velocities,1);
fraction_bound_kk_a1b1_mtcs = zeros(max_combinations*length_velocities,1);
kappaXU_gs = zeros(max_combinations*length_velocities,1);
kappaYV_pms = zeros(max_combinations*length_velocities,1);
max_target_snares_at_one_compartment = 1e40000;
max_vesicle_snares_at_one_compartment = 2e40000;

fraction_bound_kk_a1b1_mtcs_for_velocities = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
length_fraction_bound_kk_a1b1_mtcs_for_velocities = length(fraction_bound_kk_a1b1_mtcs_for_velocities);

effective_tubulin = 9;
effective_dyn_MT_length = 20;

indexCombination = 0;

%Print figures
if (figure_set==1)
    figure_label = 'Fig 3A';
    suppl_figure_label = {'Suppl Fig 5A' 'Suppl Fig 5C' 'Suppl Fig 5E' 'Suppl Fig 5G' 'Suppl Fig 5I'};
else
    figure_label = 'Fig 3B';
    suppl_figure_label = {'Suppl Fig 5B' 'Suppl Fig 5D' 'Suppl Fig 5F' 'Suppl Fig 5H' 'Suppl Fig 5J'};
end
indexSupplFigureLabel = 0;


fraction_bound_kk_a1b1_mtc_initial = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];

for indexV = 1:length_velocities
    current_velocity_per_hour = velocities_per_hour(indexV);
    kappaYV_pm = 3.5e-6;%8.5e-07;
    kappaXU_g = 8.1e-06;%7.73e-06;
    accepted_combination = true;
    increment = 0.01;
    kappaXU_g_initial = kappaXU_g;
    fraction_bound_kk_a1b1_mtc_input = fraction_bound_kk_a1b1_mtc_initial(indexV) - increment;
    while (  (accepted_combination)...
           &&(fraction_bound_kk_a1b1_mtc_input + increment<=1))
        NOG_analytical_predefine_conditions;        
        fraction_bound_kk_a1b1_mtc_input = fraction_bound_kk_a1b1_mtc_input + increment;
        fraction_bound_kk_a1b1_mtc = fraction_bound_kk_a1b1_mtc_input;
        velocity_per_hour = current_velocity_per_hour;
        
        %cc1_g = cc1_g_start;
        %cc2_pm = cc2_pm_start;
        xx_pm = 0.4;%8.7579;
        xx_g = 20000;%1.9908e+04;
        yy_pm = 20000;%2.0097e+04;
        yy_g = 0.4;%0.4573;
        
        NOG_analytical_predict_concentrations_and_parameter;
        if (accepted_combination)
            indexCombination = indexCombination + 1;
            velocities_per_hour_of_combination(indexCombination) = current_velocity_per_hour;
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
            fraction_bound_kk_a1b1_mtcs(indexCombination) = fraction_bound_kk_a1b1_mtc;
%             if (indexCombination>1)
%                 a0 = kappaYV_pms(indexCombination-1);
%                 a1 = kappaYV_pms(indexCombination);
%                 b0 = start_total_vvs(indexCombination);
%                 db = vv_increasements(indexV);
%                 da = a1 - (a0 * b0 / (b0 - db));
%                 if (da > kappaYV_decrements(indexV))
%                    da = kappaYV_decrements(indexV); 
%                 end
%                 decrement = da;
%             end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - kinesin receptor vs fraction of bound kinesin -START
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
figure_label = 'Arjun_kinesinR_vs_fraction';

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

distance_for_selection = 1;
for indexV = 1:length_velocities
   index_current_velocity = find(velocities_per_hour_of_combination==velocities_per_hour(indexV));
   plot(start_total_kks(index_current_velocity),fraction_bound_kk_a1b1_mtcs(index_current_velocity),'color',velocity_colors(indexV,:),'LineWidth',lineWidth);
   hold on;
end

xlabel({'Kinesin recruitment to vesicle';'(Kinesin receptors [molecules])'},'FontSize',axis_label_font_size);
ylabel({'Kinesin mediated vesicle';'transport along MT';'(Fraction bound kinesin)'},'FontSize',axis_label_font_size);
set(gca,'FontSize',axis_scale_font_size);
xlim([0 800]);
ylim([0.1 0.5]);

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.35*figureColumns 2*figureRows])
print(figure_label,'-dpng','-r600');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - kinesin receptor vs fraction of bound kinesin - END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - kinesin receptor vs fraction of bound kinesin - production rates - START
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
figure_label = 'Arjun_kinesinR_production_rate';
plotIndex_of_subfigure = 1;
figureColumns = 1;%plots_per_row; %set NOG_statevar_set
figureRows = 1;


k_kk_productions_for_plot = zeros(length_fraction_bound_kk_a1b1_mtcs_for_velocities,length_velocities);
for indexV = 1:length_velocities
   current_velocity = velocities_per_hour(indexV);
   indexes_current_velocity = find(velocities_per_hour_of_combination==current_velocity);
   fraction_bound_kk_a1b1_mtcs_current_velocity = fraction_bound_kk_a1b1_mtcs(indexes_current_velocity);
   current_k_kk_productions = k_kk_productions(indexes_current_velocity);
   indexesMatch = zeros(length_fraction_bound_kk_a1b1_mtcs_for_velocities,1);
   for indexKYV = 1:length_fraction_bound_kk_a1b1_mtcs_for_velocities
       current_fraction_bound_kk_a1b1_mtcs_for_velocities = fraction_bound_kk_a1b1_mtcs_for_velocities(indexKYV);
       indexMatch = find(       abs(fraction_bound_kk_a1b1_mtcs_current_velocity - current_fraction_bound_kk_a1b1_mtcs_for_velocities) ...
                         == min(abs(fraction_bound_kk_a1b1_mtcs_current_velocity - current_fraction_bound_kk_a1b1_mtcs_for_velocities)));
       indexesMatch(indexKYV) = indexMatch;
       if (round( current_fraction_bound_kk_a1b1_mtcs_for_velocities / fraction_bound_kk_a1b1_mtcs_current_velocity(indexMatch))~=1)
           ME = MException('see above' ); throw(ME)
       end
   end
   k_kk_productions_for_plot(:,indexV) = current_k_kk_productions(indexesMatch); 
end

%Plot velocities vs production rate

kappaKYV_colors = zeros(length_fraction_bound_kk_a1b1_mtcs_for_velocities,3);
for indexColor = 1:length_fraction_bound_kk_a1b1_mtcs_for_velocities
    red = (150 - (indexColor-1) * (150/(length_fraction_bound_kk_a1b1_mtcs_for_velocities-1)))/255;
    green = (50 + (indexColor-1) * 50/(length_fraction_bound_kk_a1b1_mtcs_for_velocities-1))/255;
    blue = (250 - (indexColor-1) * 250/length_fraction_bound_kk_a1b1_mtcs_for_velocities)/255;
    kappaKYV_colors(indexColor,:) = [ red green blue];
end

for indexKYV = 1:length_fraction_bound_kk_a1b1_mtcs_for_velocities
    current_k_kk_productions_for_plot = k_kk_productions_for_plot(indexKYV,:);
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
        plot(velocities_per_hour(former_indexV:indexV),current_k_kk_productions_for_plot(former_indexV:indexV),'Color',velocity_colors(indexV,:),'LineWidth',lineWidth);
        hold on;
    end
end

ylabel({'Kinesin receptor synthesis';'[molecules/min]'},'FontSize',axis_label_font_size);
xlabel('NOG velocity [\mum/h]','FontSize',axis_label_font_size);
ylim([0 2.5]);
set(gca,'FontSize',axis_scale_font_size);

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.3*figureColumns 2*figureRows])
print(figure_label,'-dpng','-r600');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot main figure - kinesin receptor vs fraction of bound kinesin - production rates - END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
