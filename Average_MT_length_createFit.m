x1 = dlmread ('hydrolysis_rate_6_5.txt');
x2 = dlmread ('hydrolysis_rate_6_6.txt');
x3 = dlmread ('hydrolysis_rate_6_7.txt');
x4 = dlmread ('hydrolysis_rate_6_75.txt');
x5 = dlmread ('hydrolysis_rate_6_8.txt');
x6 = dlmread ('hydrolysis_rate_6_9.txt');
x7 = dlmread ('hydrolysis_rate_7_0.txt');
x8 = dlmread ('hydrolysis_rate_7_1.txt');
x9 = dlmread ('hydrolysis_rate_7_2.txt');
x10 = dlmread ('hydrolysis_rate_7_3.txt');
x11 = dlmread ('hydrolysis_rate_7_4.txt');
x12 = dlmread ('hydrolysis_rate_7_5.txt');


array_tubulin_concentration = x1(1,:);
array_lower_shape = [x1(2,:);x2(2,:);x3(2,:); x4(2,:); x5(2,:);x6(2,:);x7(2,:);x8(2,:);x9(2,:);x10(2,:);x11(2,:);x12(2,:)];
array_upper_scale = [x1(3,:);x2(3,:);x3(3,:);x4(3,:);x5(3,:);x6(3,:);x7(3,:);x8(3,:);x9(3,:);x10(3,:);x11(3,:);x12(3,:)];
array_average_MT_length = [x1(4,:);x2(4,:);x3(4,:);x4(4,:);x5(4,:);x6(4,:);x7(4,:);x8(4,:);x9(4,:);x10(4,:);x11(4,:);x12(4,:)];
array_degradation_rate = [x1(5,:);x2(5,:);x3(5,:);x4(5,:);x5(5,:);x6(5,:);x7(5,:);x8(5,:);x9(5,:);x10(5,:);x11(5,:);x12(5,:)];
array_hydrolysis =  [0.65 0.66 0.67 0.675 0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75];


% figure;

        



title_font_size = 10;
axis_label_font_size = 9;
axis_scale_font_size = 9;


[xData, yData, zData] = prepareSurfaceData( array_tubulin_concentration, array_hydrolysis, array_average_MT_length );

% Set up fittype and options.
ft = fittype( 'poly33' );

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft );

% Plot fit with data.
figure( 'Name', 'Average dynamic MT length' );
h = plot( fitresult, [xData, yData], zData );

set(gca,'fontsize',axis_scale_font_size)
        title('Average dynamic MT length','FontSize',title_font_size);
        xlabel({'(Effective tubulin [\mu M])';'Tubulin sequestration'},'FontSize',axis_label_font_size);
        ylabel({'(Hydrolysis rate [sec^{-1}])';'GTP hydrolysis'},'FontSize',axis_label_font_size);
        zlabel ({'Average dynamic'; 'MT length [\mu m]'},'FontSize',axis_label_font_size);
        xticks([ 8  8.2  8.4  8.6  8.8  9.0  9.2  9.4  9.6  9.8  10.0])
        yticks([0.65 0.66 0.67  0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75]) %0.675
        xtickangle(70)
        ytickangle(70)

hold on;
        
plot3(xData(4:12:end),yData(4:12:end),zData(4:12:end),'-','MarkerSize',1,'color',[255/255    255/255  109/255],'linewidth',3)

hold on

plot3(xData(9:12:end),yData(9:12:end),zData(9:12:end),'-','MarkerSize',1,'color',[1 0 1],'linewidth',3)



% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 3])%3.3*figureColumns 2*figureRows])
% print('Fig 7B','-dpng','-r600');

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 5 3])%3.3*figureColumns 2*figureRows])
print('Fig 7B','-dtiff','-r1200');
% % % #####
% % % figure;

title_font_size = 10;
axis_label_font_size = 9;
axis_scale_font_size = 9;


[xData, yData, zData] = prepareSurfaceData( array_tubulin_concentration, array_hydrolysis, array_degradation_rate );

% Set up fittype and options.
ft = fittype( 'poly33' );

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft );

% Plot fit with data.
figure( 'Name', 'Degradation Rate' );
h = plot( fitresult, [xData, yData], zData );

set(gca,'fontsize',axis_scale_font_size)
        title('Degradation rate','FontSize',title_font_size);
        xlabel({'(Effective tubulin [\mu M])';'Tubulin sequestration'},'FontSize',axis_label_font_size);
        ylabel({'(Hydrolysis rate [sec^{-1}])';'GTP hydrolysis'},'FontSize',axis_label_font_size);
        zlabel ({'Degradation'; 'rate [min^{-1}]'},'FontSize',axis_label_font_size);
        xticks([ 8  8.2  8.4  8.6  8.8  9.0  9.2  9.4  9.6  9.8  10.0])
        yticks([0.65 0.66 0.67  0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75])%0.675
        xtickangle(70)
        ytickangle(70)
hold on

plot3(xData(4:12:end),yData(4:12:end),zData(4:12:end),'-','MarkerSize',1,'color',[255/255    255/255  109/255],'linewidth',3)


hold on

plot3(xData(9:12:end),yData(9:12:end),zData(9:12:end),'-','MarkerSize',1,'color',[1 0 1],'linewidth',3)

% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 3])%3.3*figureColumns 2*figureRows])
% print('Fig 7C','-dpng','-r600');


set(gcf,'PaperUnits','inches','PaperPosition',[0 0 5 3])%3.3*figureColumns 2*figureRows])
print('Fig 7C','-dtiff','-r1200');

%% %%%%%%% Shape parameter fitting

% % title_font_size = 13;
% % axis_label_font_size = 14;
% % axis_scale_font_size = 9;
% % 
% % 
% % [xData, yData, zData] = prepareSurfaceData( array_tubulin_concentration, array_hydrolysis, array_lower_shape );
% % 
% % % Set up fittype and options.
% % ft = fittype( 'poly33' );
% % 
% % % Fit model to data.
% % [fitresult, gof] = fit( [xData, yData], zData, ft );
% % 
% % % Plot fit with data.
% % figure( 'Name', 'Shape parameter' );
% % h = plot( fitresult, [xData, yData], zData );
% % 
% % set(gca,'fontsize',axis_scale_font_size)
% %         title('Shape parameter','FontSize',title_font_size);
% %           xlabel({'(Effective tubulin [\mu M])';'Tubulin sequestration'},'FontSize',axis_label_font_size);
% %         ylabel({'(Hydrolysis rate [sec^{-1}])';'GTP hydrolysis'},'FontSize',axis_label_font_size);
% %         zlabel ({'Shape parameter'},'FontSize',axis_label_font_size);
% %         xticks([ 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0])
% %         yticks([0.65 0.66 0.67  0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75]) %0.675
% %         xtickangle(70)
% %         ytickangle(70)
% % 
% % 
% % set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 3])%3.3*figureColumns 2*figureRows])
% % print('figure','-dpng','-r600');
% %  


%% %%%%%%% Scale parameter fitting

% title_font_size = 13;
% axis_label_font_size = 14;
% axis_scale_font_size = 9;
% 
% 
% [xData, yData, zData] = prepareSurfaceData( array_tubulin_concentration, array_hydrolysis, array_upper_scale );
% 
% % Set up fittype and options.
% ft = fittype( 'poly33' );
% 
% % Fit model to data.
% [fitresult, gof] = fit( [xData, yData], zData, ft );
% 
% % Plot fit with data.
% figure( 'Name', 'Scale parameter' );
% h = plot( fitresult, [xData, yData], zData );
% 
% set(gca,'fontsize',axis_scale_font_size)
%         title('Scale parameter','FontSize',title_font_size);
%         xlabel({'(Effective tubulin [\mu M])';'Tubulin sequestration'},'FontSize',axis_label_font_size);
%         ylabel({'(Hydrolysis rate [sec^{-1}])';'GTP hydrolysis'},'FontSize',axis_label_font_size);
%         zlabel ({'Scale parameter'},'FontSize',axis_label_font_size);
%         xticks([ 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0])
%         yticks([0.65 0.66 0.67  0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75]) %0.675
%         xtickangle(70)
%         ytickangle(70)
% 
% 
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 3])%3.3*figureColumns 2*figureRows])
% print('figure','-dpng','-r600');
%  













%% ############  Hydrolysis rate 0.74 ######

% % figure;
% % 
% % title_font_size = 13;
% % axis_label_font_size = 10;
% % axis_scale_font_size = 9;
% % 
% % 
% % [xData, yData, zData] = prepareSurfaceData( array_tubulin_concentration, array_hydrolysis, array_average_MT_length );
% % 
% % % Set up fittype and options.
% % ft = fittype( 'poly55' );
% % 
% % % Fit model to data.
% % [fitresult, gof] = fit( [xData, yData], zData, ft );
% % 
% % % Plot fit with data.
% % figure( 'Name', 'Average MT Length' );
% % h = plot( fitresult, [xData, yData], zData );
% % 
% % set(gca,'fontsize',axis_scale_font_size)
% %         title('Average MT Length','FontSize',title_font_size);
% %         xlabel({'Tubulin ';'Concentration [\mu M]'},'FontSize',axis_label_font_size);
% %         ylabel({'Hydrolysis';'Rate [sec^{-1}]'},'FontSize',axis_label_font_size);
% %         zlabel ({'Average MT';' Length [\mu m]'},'FontSize',axis_label_font_size);
% %         xticks([ 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0])
% %         yticks([0.65 0.66 0.67  0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75]) %0.675
% %         xtickangle(70)
% %         ytickangle(70)
% %         
% % hold on
% % 
% % plot3(xData(11:12:end),yData(11:12:end),zData(11:12:end),'o-','MarkerSize',4,'color',[0.9100    0.4100    0.1700],'linewidth',3)
% % 
% % set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 3])%3.3*figureColumns 2*figureRows])
% % print('figure','-dpng','-r600');
% % 



% % figure;
% % 
% % title_font_size = 10;
% % axis_label_font_size = 8;
% % axis_scale_font_size = 7;
% % 
% % 
% % [xData, yData, zData] = prepareSurfaceData( array_tubulin_concentration, array_hydrolysis, array_degradation_rate );
% % 
% % % Set up fittype and options.
% % ft = fittype( 'poly55' );
% % 
% % % Fit model to data.
% % [fitresult, gof] = fit( [xData, yData], zData, ft );
% % 
% % % Plot fit with data.
% % figure( 'Name', 'Degradation Rate' );
% % h = plot( fitresult, [xData, yData], zData );
% % 
% % set(gca,'fontsize',axis_scale_font_size)
% %         title('Degradation Rate','FontSize',title_font_size);
% %         xlabel({'Tubulin ';'Concentration [\mu M]'},'FontSize',axis_label_font_size);
% %         ylabel({'Hydrolysis';'Rate [sec^{-1}]'},'FontSize',axis_label_font_size);
% %         zlabel ({'Degradation Rate [min^{-1}]'},'FontSize',axis_label_font_size);
% %         xticks([ 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0])
% %         yticks([0.65 0.66 0.67  0.68 0.69 0.70 0.71 0.72 0.73 0.74  0.75])%0.675
% %         xtickangle(70)
% %         ytickangle(70)
% % hold on
% % 
% % plot3(xData(11:12:end),yData(11:12:end),zData(11:12:end),'o-','MarkerSize',4,'color',[0.9100    0.4100    0.1700],'linewidth',3)
% % 
% % set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 3])%3.3*figureColumns 2*figureRows])
% % print('figure','-dpng','-r600');
% % 
% % 
% % 

















% 
% figure(1)
% axis_font_size = 20;
% surf(array_tubulin_concentration,array_hydrolysis,array_average_MT_length,'FaceColor','interp','EdgeColor','interp');
% xlabel('Tubulin Concentration [\mu M]','fontweight','bold','FontSize',axis_font_size) % x-axis label
% ylabel('Hydrolysis rate [1/sec]','fontweight','bold', 'FontSize',axis_font_size) % y-axis label
% zlabel('Average MT Length [\mu m]', 'fontweight','bold','FontSize',axis_font_size) % z-axis label
% set(gca,'FontSize',20);
% 
% figure(2)
% surf(array_tubulin_concentration,array_hydrolysis,array_upper_scale,'FaceColor','interp','EdgeColor','interp');
% xlabel('Tubulin Concentration [\mu M]','fontweight','bold','FontSize',axis_font_size) % x-axis label
% ylabel('Hydrolysis rate [1/sec]','fontweight','bold', 'FontSize',axis_font_size) % y-axis label
% zlabel('Scale Parameter', 'fontweight','bold','FontSize',axis_font_size) % z-axis label
% set(gca,'FontSize',20);
% 
% figure(3)
% surf(array_tubulin_concentration,array_hydrolysis,array_lower_shape,'FaceColor','interp','EdgeColor','interp');
% xlabel('Tubulin Concentration [\mu M]','fontweight','bold','FontSize',axis_font_size) % x-axis label
% ylabel('Hydrolysis rate [1/sec]','fontweight','bold', 'FontSize',axis_font_size) % y-axis label
% zlabel('Shape Parameter', 'fontweight','bold','FontSize',axis_font_size) % z-axis label
% set(gca,'FontSize',20);
% zlim([0.5 1.5])
% 
% 
% 
