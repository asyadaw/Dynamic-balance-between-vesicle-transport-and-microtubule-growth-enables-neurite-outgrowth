
figure;
figureColumns = 1;%plots_per_row; %set NOG_statevar_set
figureRows = 5;
title_font_size = 13;
axis_label_font_size = 10;
axis_scale_font_size = 9;

plotIndex_of_subfigure = 0;
LineWidth = 1;
color_consider = 'r';
color_not_consider = [0.2 0.4 0.2];

for indexEPD = 1:expPreDataStatevar_length
    plotIndex_of_subfigure = plotIndex_of_subfigure + 1;
    if expPreDataStatevar_consider(indexEPD)
       color = color_consider;
    else
       color = color_not_consider;
    end
    main_color = expPreDataStatevar_colors(indexEPD,:);
    if (~expPreDataStatevar_add_to_previous_figure(indexEPD))
        subplot(figureRows,figureColumns,plotIndex_of_subfigure);
    end
    yy = plot(t,expPreDataStatevar_preValue(:,indexEPD),'Color',main_color,'LineWidth',LineWidth);
    hold on;
    mean = expPreDataStatevar_means(indexEPD);
    sd = expPreDataStatevar_sds(indexEPD);
    plot([t(1) t(end)], mean,'-.','Color',color,'LineWidth',LineWidth);
    %plot([t(1) t(end)], [mean-sd mean-sd],'-.','Color',color,'LineWidth',LineWidth);
    %plot([t(1) t(end)], [mean+sd mean+sd],'-.','Color',color,'LineWidth',LineWidth);
%     min_y = 0;%min([mean-sd expPreDataStatevar_preValue(end,indexEPD)])-0.3*sd;
%     max_y = expPreDataStatevar_max_y(indexEPD); 
%     ylim([min_y max_y]);
    xlim([0 max(t)]);
    if (~expPreDataStatevar_add_to_previous_figure(indexEPD))
        set(gca,'fontsize',axis_scale_font_size)
        title(strrep(expPreDataStatevar_names{indexEPD},'_',' '),'FontSize',title_font_size);
        xlabel('time [min]','FontSize',axis_label_font_size);
        ylabel(strrep(expPreDataStatevar_ylabels{indexEPD},'_',' '),'FontSize',axis_label_font_size);
    end
end

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.3*figureColumns 2*figureRows])
print('Fig 4','-dpng','-r600');

% output_t = Output_time;
% 
% for indexEPD = 1:expPreDataFluxes_length
%     plotIndex_of_subfigure = plotIndex_of_subfigure + 1;
%     if expPreDataFluxes_consider(indexEPD)
%        color = color_consider;
%     else
%        color = color_not_consider;
%     end
% 
%     subplot(figureRows,figureColumns,plotIndex_of_subfigure);
%     plot(output_t,expPreDataFluxes_preValue(:,indexEPD),'b','LineWidth',LineWidth);
%     hold on;
%     mean = expPreDataFluxes_means(indexEPD);
%     sd = expPreDataFluxes_sds(indexEPD);
%     plot([output_t(1) output_t(end)], mean,'-.','Color',color);
%     plot([output_t(1) output_t(end)], [mean-sd mean-sd],'-.','Color',color,'LineWidth',LineWidth);
%     plot([output_t(1) output_t(end)], [mean+sd mean+sd],'-.','Color',color,'LineWidth',LineWidth);
%     min_y = min([mean-sd expPreDataFluxes_preValue(end,indexEPD)])-0.3*sd;
%     max_y = max([mean+sd expPreDataFluxes_preValue(end,indexEPD)])+0.3*sd;
%     ylim([min_y max_y]);
%     title(strrep(expPreDataFluxes_names{indexEPD},'_',' '));
% end




