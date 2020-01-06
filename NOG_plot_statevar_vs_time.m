

%% Plot Compartment sizes.....



length_statevar = length(statevar_timelines(1,:)); 
statevar_timelines_normalized = statevar_timelines;
statevar_names_normalized = statevar_names;
 
for indexStatevar = 1:length_statevar
   statevar_name = char(statevar_names(indexStatevar));
   if (  (contains(statevar_name,'n'))||(~isempty(strfind(statevar_name,'s')==1)))
       membrane_label = ['_' statevar_name(2:length(statevar_name))];
       charCount_membrane_label = length(membrane_label);
       for indexInnerStatevar = (lastStatevarIndex_of_membraneVariable+1):length_statevar
          inner_statevar_name = char(statevar_names(indexInnerStatevar));
          charCount_inner_statevar_name = length(inner_statevar_name);
          if (contains(inner_statevar_name,membrane_label))
             if (strfind(statevar_name,'n')==1)
                %statevar_timelines_normalized(:,indexInnerStatevar) = statevar_timelines(:,indexInnerStatevar) ./ (statevar_timelines(:,indexStatevar) / antero_vesicle_surface_area);
                %statevar_names_normalized(indexInnerStatevar) = {[inner_statevar_name ' per vesicle (' membrane_label ')']};
             end
             if (strfind(statevar_name,'s')==1)
                %statevar_timelines_normalized(:,indexInnerStatevar) = statevar_timelines(:,indexInnerStatevar) ./ statevar_timelines(:,indexStatevar);
                %statevar_names_normalized(indexInnerStatevar) = {[inner_statevar_name(2:length(inner_statevar_name))]};
             end
          end
       end
   end
end

statevar_timelines_normalized(:,indexS_stbl_MTs_length) = statevar_timelines_normalized(:,indexS_stbl_MTs_length) / MTs_per_crosssection;


figure(1);

axis_fontSize = 20;
axis_scale_font_size = 15;

figureColumns = plots_per_row; %set NOG_statevar_set
figureRows = 4;
first_index_current_figure = 1;xlabel_text = 'time [min]';
ylabel_text = '';

title_font_size = 12;
LineWidth = 2.5;

indexSubfigure = 0;
figure_label = 'Suppl Fig 3';
figure_sublabels = 'A':'Z';

for indexStatevar = 1:length_statevar
    current_timeline = statevar_timelines_normalized(:,indexStatevar);
    if (statevar_plotIndexes(indexStatevar) - first_index_current_figure + 1 > figureColumns * figureRows)
       first_index_current_figure = first_index_current_figure + figureColumns * figureRows;
       figure;
    end
    
    plotIndex_of_subfigure = statevar_plotIndexes(indexStatevar) - first_index_current_figure + 1;
    subplot(figureRows,figureColumns,plotIndex_of_subfigure);
    plot(t,current_timeline,'LineWidth',LineWidth,'Color',statevar_figure_colors(indexStatevar,:),'LineStyle',char(statevar_figure_lineStyles(indexStatevar)));
    set(gca,'fontsize',axis_scale_font_size)
    ylim([0 1.5*max(current_timeline)]);
    xlim(tspan);
    %title(strrep(statevar_names_normalized(indexStatevar),'_',' '),'FontSize',title_font_size);
    %title(strrep(statevar_figure_names{indexStatevar},'_',' '),'FontSize',title_font_size);
    title(statevar_figure_names{indexStatevar},'FontSize',title_font_size);
    
    
    
    if (  (indexStatevar == length_statevar)...
        ||(statevar_plotIndexes(indexStatevar+1) - first_index_current_figure + 1 > figureColumns * figureRows))
        
      %  cor_factor = figureColumns * figureRows - (statevar_plotIndexes(indexStatevar) - first_index_current_figure + 1);
        
      %  text('units','pixels','position',[-31 -12],'fontsize',30,'string','time [min]');
      %  text('units','pixels','position',[-70-cor_factor*20 21],'fontsize',25,'string',{'surface [\mum^2]   or   vesicles [#]'},'rotation',90);
    
        indexSubfigure = indexSubfigure + 1;
        set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.3*figureColumns 2*figureRows])
        print([figure_label figure_sublabels(indexSubfigure)],'-dpng','-r600');
    end
end

% total_membrane = statevar_timelines_normalized(:,index_total_membrane);
% 
% sum_membrane = zeros(length(statevar_timelines(:,1)),1);
% 
% for indexStatevar = 1:lastStatevarIndex_of_membraneVariable
%     sum_membrane(:,1) = sum_membrane(:,1) + statevar_timelines(:,indexStatevar);
% end
% 
% 
% 
% if (statevar_plotIndexes(index_total_membrane) - first_index_current_figure + 1 > figureColumns * figureRows)
%    first_index_current_figure = first_index_current_figure + figureColumns * figureRows;
%    figure;
% end
% 
% plotIndex_of_subfigure = plotIndex_of_subfigure + 1;
% subplot(figureRows,figureColumns,plotIndex_of_subfigure);
% plot(t,(total_membrane - sum_membrane)');
% title([strrep(statevar_names_normalized(index_total_membrane),'_',' ') ' - sum membrane'],'FontSize',title_font_size);