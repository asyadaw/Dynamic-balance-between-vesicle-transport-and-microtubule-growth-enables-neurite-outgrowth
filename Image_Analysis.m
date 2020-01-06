%% Image analysis of neurite outgrowth

directory = 'C:\Users\yadawa01\Desktop\Pen_Drive\Cell_System_paper\Brightfield_image_analysis\';

data1 = xlsread(strcat(directory,'D_02_00000000'));
data2 = xlsread(strcat(directory,'D_02_21600000'));
data3 = xlsread(strcat(directory,'D_02_43200000'));
data4 = xlsread(strcat(directory,'D_02_64800000'));
data5 = xlsread(strcat(directory,'D_02_86400000'));
data6 = xlsread(strcat(directory,'D_02_108000000'));
data7 = xlsread(strcat(directory,'D_02_129600000'));
data8 = xlsread(strcat(directory,'D_02_151200000'));
data9 = xlsread(strcat(directory,'D_02_172800000'));
data10 = xlsread(strcat(directory,'D_02_194400000'));

index_of_interest = 4;

Neurite_0hr = data1(:,index_of_interest);
Neurite_6hr = data2(:,index_of_interest);
Neurite_12hr = data3(:,index_of_interest);
Neurite_18hr = data4(:,index_of_interest);
Neurite_24hr = data5(:,index_of_interest);
Neurite_30hr = data6(:,index_of_interest);
Neurite_36hr = data7(:,index_of_interest);
Neurite_42hr = data8(:,index_of_interest);
Neurite_48hr = data9(:,index_of_interest);
Neurite_54hr = data10(:,index_of_interest);


%% Top 5 % and Bottom 5% Neurite

Median_0hr = median(Neurite_0hr);
Median_6hr = median(Neurite_6hr);
Median_12hr = median(Neurite_12hr);
Median_18hr = median(Neurite_18hr);
Median_24hr = median(Neurite_24hr);
Median_30hr = median(Neurite_30hr);
Median_36hr = median(Neurite_36hr);
Median_42hr = median(Neurite_42hr);
Median_48hr = median(Neurite_48hr);
Median_54hr = median(Neurite_54hr);

timepoints = [16 22 28 34 40 46 52 58 64 70];

length_dataset = 10;
quantiles = [ 0.1 0.25 0.5 0.75 0.9 ];
length_quantiles = length(quantiles);
Quantiles = zeros(length_dataset,length_quantiles);




for indexQ = 1:length_quantiles
    current_quantile = quantiles(indexQ);
    Add_quantiles = zeros(length_dataset,1);
    Add_quantiles(1,1) = quantile(Neurite_0hr,current_quantile);
    Add_quantiles(2,1) = quantile(Neurite_6hr,current_quantile);
    Add_quantiles(3,1) = quantile(Neurite_12hr,current_quantile);
    Add_quantiles(4,1) = quantile(Neurite_18hr,current_quantile);
    Add_quantiles(5,1) = quantile(Neurite_24hr,current_quantile);
    Add_quantiles(6,1) = quantile(Neurite_30hr,current_quantile);
    Add_quantiles(7,1) = quantile(Neurite_36hr,current_quantile);
    Add_quantiles(8,1) = quantile(Neurite_42hr,current_quantile);
    Add_quantiles(9,1) = quantile(Neurite_48hr,current_quantile);
    Add_quantiles(10,1) = quantile(Neurite_54hr,current_quantile);
    Quantiles(:,indexQ) = Add_quantiles(:,1); 
end

marker_size = 10;
line_width = 1;
label_font_size = 25;
axis_number_font_size = 10;
Color = [0 0.5 1];


% figure;
% hist(Neurite_42hr,20);
% xlabel('Neurite length [um]','fontsize',label_font_size);
% ylabel('Frequency','fontsize',label_font_size);
% set(gca,'fontsize',axis_number_font_size);

figure;
fitType = 'poly2';
parameter_fits = [];

p1 = [];
p2 = [];
p3 = [];

for indexQ = 1:length_quantiles
   current_quantile_values = Quantiles(:,indexQ);
   [parameter_fit,gof,output] = fit(timepoints',current_quantile_values,fitType);
   p1 = [p1 parameter_fit.p1];
   p2 = [p2 parameter_fit.p2];
   p3 = [p3 parameter_fit.p3];
   p = plot(parameter_fit,'-');
   set(p,'Linewidth',line_width,'Color',Color);
   xlim([min(timepoints) max(timepoints)]);
   hold on;
   plot(timepoints,current_quantile_values,'b.','color',Color,'markersize',marker_size);
   hold on;
end

hLeg = legend(gca,'off');
set(gca,'FontSize',axis_number_font_size);
xlabel('time [hrs.]','fontsize',label_font_size);
ylabel('Neurite length [um]','fontsize',label_font_size);

% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 5 3])
% print('Fig 3D','-dpng','-r600');

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3.6])%3.3*figureColumns 2*figureRows])
print('Fig 3D','-dtiff','-r1200');

%% Distribution figure

figure(2);
title_font_size = 11;
axis_label_font_size = 10;
axis_scale_font_size = 10;

subplot(4,4,1);histfit(Neurite_0hr,20,'gamma');title('Neurites at 16 hr ','FontSize',title_font_size) 
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,2);histfit(Neurite_6hr,20,'gamma');title('Neurites at 22 hr ','FontSize',title_font_size)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,3);histfit(Neurite_12hr,20,'gamma');title('Neurites at 28 hr ','FontSize',title_font_size) 
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,4);histfit(Neurite_18hr,20,'gamma');title('Neurites at 34 hr ','FontSize',title_font_size)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,5);histfit(Neurite_24hr,20,'gamma');title('Neurites at 40 hr ','FontSize',title_font_size) 
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,6);histfit(Neurite_30hr,20,'gamma');title('Neurites at 46 hr ','FontSize',title_font_size) 
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,7);histfit(Neurite_36hr,20,'gamma');title('Neurites at 52 hr ','FontSize',title_font_size) 
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,8);histfit(Neurite_42hr,20,'gamma');title('Neurites at 58 hr ','FontSize',title_font_size) 
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,9);histfit(Neurite_48hr,20,'gamma');title('Neurites at 64 hr ','FontSize',title_font_size)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])
subplot(4,4,10);histfit(Neurite_54hr,20,'gamma');title('Neurites at 70 hr ','FontSize',title_font_size)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',10, 'LineWidth', 1);
xlim([0 3200]);ylim([0 85])

[~,h1]=suplabel('Length (\mum)'); 
[~,h2]=suplabel('Frequency','y'); 
% [~,h3]=suplabel('Longest Process Length' ,'t'); 
set(h1,'FontSize',20) 
set(h2,'FontSize',20) 

% print('Fig 3C','-dpng','-r600');



set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4])%3.3*figureColumns 2*figureRows])
print('Fig 3C','-dtiff','-r1200');








% % figure;
% % 
% % artificial_timepoints = min(timepoints):0.1:max(timepoints);
% % length_artificial_timepoints = length(artificial_timepoints);
% % Ones = zeros(1,length(artificial_timepoints));
% % velocities = zeros(length_artificial_timepoints,length_quantiles);
% % mean_velocity = zeros(length_quantiles,1);
% % 
% % for indexQ = 1:length_quantiles
% %    current_velocities = 2 .* p1(indexQ) .* artificial_timepoints + p2(indexQ) * Ones;
% %    velocities(:,indexQ) = current_velocities;
% %    mean_velocity(indexQ) = mean(current_velocities);
% %    p = plot(artificial_timepoints,current_velocities,'-');
% %    hold on;
% %    set(p,'Linewidth',line_width,'Color',Color);
% %    xlim([min(artificial_timepoints) max(artificial_timepoints)]);
% % end
% % 
% % hLeg = legend(gca,'off');
% % set(gca,'FontSize',axis_number_font_size);
% % xlabel('time [h]','fontsize',label_font_size);
% % ylabel('Neurite growth [um/h]','fontsize',label_font_size);







% % 
% % 
% % xlim([min(timepoints) max(timepoints)]);
% % 
% % xx1 = [0 6 12 18 24 30 36 42 48 54];
% % uu1= [u1 u2 u3 u4 u5 u6 u7 u8 u9 u10];
% % yy1= [y1 y2 y3 y4 y5 y6 y7 y8 y9 y10];
% % ss1= [s1 s2 s3 s4 s5 s6 s7 s8 s9 s10];
% % yy2 = [median(Neurite_0hr), median(Neurite_6hr), median(Neurite_12hr), median(Neurite_18hr), median(Neurite_24hr), median(Neurite_30hr), median(Neurite_36hr), median(Neurite_42hr), median(Neurite_48hr), median(Neurite_54hr)];
% % vv1= [v1 v2 v3 v4 v5 v6 v7 v8 v9 v10];
% % zz1= [z1 z2 z3 z4 z5 z6 z7 z8 z9 z10];
% % tt1= [t1 t2 t3 t4 t5 t6 t7 t8 t9 t10];
% % 
% % figure;
% % plot (xx1,uu1, '*-g',xx1,yy1, '*-k',xx1,ss1, '*-r')
% % hold on
% % plot (xx1,yy2, '*-b')
% % hold on
% % plot (xx1,vv1, '*-g',xx1,zz1, '*-k',xx1,tt1, '*-r')
% % xlabel('Time (hrs)'); ylabel('Length (\mu m)');
% % title('Median of Longest Process Length')
% % set(gca,'FontSize',15)
% % 
% % 
% % figure;
% % plot (xx1,uu1, '*-g',xx1,yy1, '*-k',xx1,ss1, '*-r')
% % hold on
% % plot (xx1,yy2, '*-b')
% % hold on
% % plot (xx1,vv1, '*-g',xx1,zz1, '*-k',xx1,tt1, '*-r')
% % xlabel('Time (hrs)'); ylabel('Length (\mu m)');
% % title('Median of Longest Process Length')
% % set(gca,'FontSize',15)


%% 
% title_font_size = 13;
% axis_label_font_size = 14;
% axis_scale_font_size = 9;
% 
% 
% figure(1);
% subplot(4,3,1)
% histfit(Neurite_0hr,20,'gamma')
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 16 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
%  
% subplot(4,3,2)
% histfit(Neurite_6hr,20,'gamma')
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 22 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
%   
% subplot(4,3,3)
% histfit(Neurite_12hr,20,'gamma') 
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 28 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
%   
% subplot(4,3,4)
% histfit(Neurite_18hr,20,'gamma') 
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 34 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% subplot(4,3,5)
% histfit(Neurite_24hr,20,'gamma')
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 40 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% subplot(4,3,6)
% histfit(Neurite_30hr,20,'gamma')
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 46 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% subplot(4,3,7)
% histfit(Neurite_36hr,20,'gamma') 
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 52 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% subplot(4,3,8)
% histfit(Neurite_42hr,20,'gamma') 
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 58 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% subplot(4,3,9)
% histfit(Neurite_48hr,20,'gamma') 
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 64 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% subplot(4,3,10)
% histfit(Neurite_54hr,20,'gamma') 
% set(gca,'fontsize',axis_scale_font_size)
% title('Neurites at 70 hr ','FontSize',title_font_size);
% xlabel('Length (\mu m)','FontSize',axis_label_font_size);
% ylabel('Frequency ','FontSize',axis_label_font_size);
% xlim([0 3200])
% ylim([0 85])
% 
% print('figure(1)','-dpng','-r600');




%% ###########################
% Neurite_0hr = sort(data1(:,4));
% Neurite_6hr = sort(data2(:,4));
% Neurite_12hr = sort(data3(:,4));
% Neurite_18hr = sort(data4(:,4));
% Neurite_24hr = sort(data5(:,4));
% Neurite_30hr = sort(data6(:,4));
% Neurite_36hr = sort(data7(:,4));
% Neurite_42hr = sort(data8(:,4));
% Neurite_48hr = sort(data9(:,4));
% Neurite_54hr = sort(data10(:,4));
% 
% 
% 
% subplot(3,3,1)
% histfit(Neurite_0hr(end-100:end),20,'gamma')
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 0 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
%  
% subplot(3,3,2)
% histfit(Neurite_6hr(end-100:end),20,'gamma')
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 6 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
%   
% subplot(3,3,3)
% histfit(Neurite_12hr(end-100:end),20,'gamma') 
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 12 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
%   
% subplot(3,3,4)
% histfit(Neurite_18hr(end-100:end),20,'gamma') 
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 18 hr ') 
% set(gca,'FontSize',15) 
% xlim([0 3200])
% ylim([0 25])
% 
% subplot(3,3,5)
% histfit(Neurite_24hr(end-100:end),20,'gamma')
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 24 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
% 
% subplot(3,3,6)
% histfit(Neurite_30hr(end-100:end),20,'gamma')
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 30 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
% 
% subplot(3,3,7)
% histfit(Neurite_36hr(end-100:end),20,'gamma') 
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 36 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
% 
% subplot(3,3,8)
% histfit(Neurite_42hr(end-100:end),20,'gamma') 
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 42 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])
% 
% subplot(3,3,9)
% histfit(Neurite_48hr(end-100:end),20,'gamma') 
% xlabel('Length (\mu m)'); ylabel('Frequency ');
% title('Neurites at 48 hr ')
% set(gca,'FontSize',15)
% xlim([0 3200])
% ylim([0 25])