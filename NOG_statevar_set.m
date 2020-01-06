

%statevar_names = zeros(129,1);
statevar_length = 132;
statevar = zeros(statevar_length,1);
statevar_plotIndexes = zeros(statevar_length,1);
statevar_buffer = zeros(statevar_length,1);
plotRowIndex = -1;
plots_per_row = 5;
index = 0;
statevar_names = cell(statevar_length,1);
statevar_figure_names = cell(statevar_length,1);
statevar_figure_colors = zeros(statevar_length,3);
statevar_figure_lineStyles = cell(statevar_length,1);
statevar_explaination = cell(statevar_length,1);
statevar_unit = cell(statevar_length,1);

b1_color = [255/255 130/255 0]; % orange
a1_color = [255/255 130/255 0]; % orange
b2_color = [0/255 100/255 200/255]; % blue
a2_color = [0/255 100/255 200/255]; % blue
organelle_color = [0 155/255 0]; % green
organelle_lineStyle = '-';
b1_lineStyle = '-';
a1_lineStyle = '--';
a2_lineStyle = '-';
b2_lineStyle = '--';



%Membranes
index = index + 1;
statevar(index) = sg; % = statevar(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'sg'; %keep name for figure generation
statevar_explaination{index} = 'Trans Golgi Network ';
% statevar_figure_names{index} = 'TGN surface'; 
statevar_figure_names{index} ={'TGN membrane';' surface area'}; 
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' [\mum{^2}]';
statevar_buffer(index) = false;
indexS_sg = index;

index = index + 1;
statevar(index) = nb1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'nb1_cg';
statevar_explaination{index} = 'Coat B budded membrane from TNG in CBC ';
% statevar_figure_names{index} = 'Vesicles B_G - CBC';
statevar_figure_names{index} = {'Vesicles';'B_G - CBC'}; %{'Vesicles';'B_G - CBC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_nb1_cg = index;

index = index + 1;
statevar(index) = nb1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'nb1_mtc';
statevar_explaination{index} = 'Coat B budded membrane from TNG - NSC ';
% statevar_figure_names{index} = 'Vesicles B_G - NSC'; 
statevar_figure_names{index} ={'Vesicles';'B_G - NSC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_nb1_mtc = index;

index = index + 1;
statevar(index) = nb1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'nb1_cpm';
statevar_explaination{index} = 'Coat B budded membrane from TNG in GCC ';
% statevar_figure_names{index} = 'Vesicles B_G - GCC'; 
statevar_figure_names{index} ={'Vesicles';'B_G - GCC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_nb1_cpm = index;

index = index + 1;
statevar(index) = spm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'spm'; %keep name for figure generation
statevar_explaination{index} = 'Growth cone plasma membrane';
% statevar_figure_names{index} = 'GC surface'; 
statevar_figure_names{index} ={'Growth cone membrane';'surface area'};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_spm = index;

index = index + 1;
statevar(index) = na1_cg; % = statevar(index);
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'na1_cg';
statevar_explaination{index} = 'Coat A budded membrane from TGN in CBC ';
% statevar_figure_names{index} = 'Vesicles A_G - CBC'; 
statevar_figure_names{index} ={'Vesicles';'A_G - CBC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_na1_cg = index;

index = index + 1;
statevar(index) = na1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'na1_mtc';
statevar_explaination{index} = 'Coat A budded membrane from TNG in NSC';
% statevar_figure_names{index} = 'Vesicles A_G - NSC'; 
statevar_figure_names{index} ={'Vesicles';'A_G - NSC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_na1_mtc = index;

index = index + 1;
statevar(index) = na1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'na1_cpm';
statevar_explaination{index} = 'Coat A budded membrane from TNG in GCC ';
% statevar_figure_names{index} = 'Vesicles A_G - GCC'; 
statevar_figure_names{index} ={'Vesicles';'A_G - GCC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_na1_cpm = index;

index = index + 1;
statevar(index) = nb2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'nb2_cg';
statevar_explaination{index} = 'Coat B budded membrane from plasma membrane in CBC ';
% statevar_figure_names{index} = 'Vesicles B_P_M - CBC'; 
statevar_figure_names{index} ={'Vesicles';'B_P_M - CBC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_nb2_cg = index;

index = index + 1;
statevar(index) = nb2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'nb2_mtc';
statevar_explaination{index} = 'Coat B budded membrane from plasma membrane in NSC';
% statevar_figure_names{index} = 'Vesicles B_P_M - NSC'; 
statevar_figure_names{index} ={'Vesicles';'B_P_M - NSC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_nb2_mtc = index;

index = index + 1;
statevar(index) = nb2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'nb2_cpm';
statevar_explaination{index} = 'Coat B budded membrane from plasma membrane in GCC ';
% statevar_figure_names{index} = 'Vesicles B_P_M - GCC'; 
statevar_figure_names{index} ={'Vesicles';'B_P_M - GCC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_nb2_cpm = index;

index = index + 1;
statevar(index) = na2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'na2_cg';
statevar_explaination{index} = 'Coat A budded membrane from plasma membrane in CBC ';
% statevar_figure_names{index} = 'Vesicles A_P_M - CBC'; 
statevar_figure_names{index} ={'Vesicles';'A_P_M - CBC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_na2_cg = index;

index = index + 1;
statevar(index) = na2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'na2_mtc';
statevar_explaination{index} = 'Coat A budded membrane from plasma membrane in NSC';
% statevar_figure_names{index} = 'Vesicles A_P_M - NSC'; 
statevar_figure_names{index} ={'Vesicles';'A_P_M - NSC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_na2_mtc = index;

index = index + 1;
statevar(index) = na2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'na2_cpm';
statevar_explaination{index} = 'Coat A budded membrane from plasma membrane in GCC ';
% statevar_figure_names{index} = 'Vesicles A_P_M - GCC'; 
statevar_figure_names{index} ={'Vesicles';'A_P_M - GCC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = '[\mum{^2}] ';
statevar_buffer(index) = false;
indexS_na2_cpm = index;

index = index + 1;
statevar(index) = s3; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 's3'; 
statevar_explaination{index} = 'Neurite shaft surface area';
% statevar_figure_names{index} = 'Neurite shaft surface'; 
statevar_figure_names{index} ={'Neurite shaft membrane';'surface area'};
statevar_unit{index} = '[\mum{^2}] ';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
lastStatevarIndex_of_membraneVariable = index;
statevar_buffer(index) = false;
indexS_s3 = index;


%Snares YY
index = index + 1;
statevar(index) = yy_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_g';
statevar_explaination{index} = 'SNARE Y in TGN';
% statevar_figure_names{index} = 'SNARE Y - TGN'; 
statevar_figure_names{index} ={'SNARE Y';'TGN'};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = '  ';
statevar_buffer(index) = false;
indexS_yy_g = index;

index = index + 1;
statevar(index) = yy_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_b1_cg';
statevar_explaination{index} = 'Coat B budded total Y SNAREs from TNG in CBC';
% statevar_figure_names{index} = 'SNARE Y - B_G - CBC'; 
statevar_figure_names{index} ={'SNARE Y';'B_G - CBC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_b1_cg = index;

index = index + 1;
statevar(index) = yy_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_b1_mtc';
statevar_explaination{index} = 'Coat B budded total Y SNAREs from TNG in NSC';
% statevar_figure_names{index} = 'SNARE Y - B_G - NSC'; 
statevar_figure_names{index} ={'SNARE Y';'B_G - NSC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_b1_mtc = index;

index = index + 1;
statevar(index) = yy_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_b1_cpm';
statevar_explaination{index} = 'Coat B budded total Y SNAREsfrom TNG in GCC';
% statevar_figure_names{index} = 'SNARE Y - B_G - GCC'; 
statevar_figure_names{index} ={'SNARE Y';'B_G - GCC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_b1_cpm = index;

index = index + 1;
statevar(index) = yy_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_pm';
statevar_explaination{index} = 'SNARE Y at growth cone membrane';
% statevar_figure_names{index} = 'SNARE Y - GC'; 
statevar_figure_names{index} ={'SNARE Y';'GC'};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_pm = index;

index = index + 1;
statevar(index) = yy_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_a1_cg';
statevar_explaination{index} = 'Coat A budded total Y SNAREs from TNG in CBC';
% statevar_figure_names{index} = 'SNARE Y - A_G - CBC';  
statevar_figure_names{index} ={'SNARE Y';'A_G - CBC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_a1_cg = index;

index = index + 1;
statevar(index) = yy_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_a1_mtc';
statevar_explaination{index} = 'Coat A budded total Y SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE Y - A_G - NSC';  
statevar_figure_names{index} ={'SNARE Y';'A_G - NSC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_a1_mtc = index;

index = index + 1;
statevar(index) = yy_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_a1_cpm';
statevar_explaination{index} = 'Coat A budded total Y SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE Y - A_G - GCC'; 
statevar_figure_names{index} ={'SNARE Y';'A_G - GCC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_a1_cpm = index;

index = index + 1;
statevar(index) = yy_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_b2_cg';
statevar_explaination{index} = 'Coat B budded total Y SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE Y - B_P_M - CBC'; 
statevar_figure_names{index} ={'SNARE Y';'B_P_M - CBC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_b2_cg = index;

index = index + 1;
statevar(index) = yy_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_b2_mtc';
statevar_explaination{index} = 'Coat B budded total Y SNAREs from plasma membrane in MTU';
% statevar_figure_names{index} = 'SNARE Y - B_P_M - NSC'; 
statevar_figure_names{index} ={'SNARE Y';'B_P_M - NSC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_b2_mtc = index;

index = index + 1;
statevar(index) = yy_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_b2_cpm';
statevar_explaination{index} = 'Coat B budded total Y SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE Y - B_P_M - GCC'; 
statevar_figure_names{index} ={'SNARE Y';'B_P_M - GCC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_b2_cpm = index;

index = index + 1;
statevar(index) = yy_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_a2_cg';
statevar_explaination{index} = 'Coat A budded total Y SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE Y - A_P_M - CBC'; 
statevar_figure_names{index} ={'SNARE Y';'A_P_M - CBC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_a2_cg = index;

index = index + 1;
statevar(index) = yy_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_a2_mtc';
statevar_explaination{index} = 'Coat A budded total Y SNAREs from plasma membrane in MTU';
% statevar_figure_names{index} = 'SNARE Y - A_P_M - NSC'; 
statevar_figure_names{index} ={'SNARE Y';'A_P_M - NSC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_a2_mtc = index;

index = index + 1;
statevar(index) = yy_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'yy_a2_cpm';
statevar_explaination{index} = 'Coat A budded total Y SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE Y - A_P_M - GCC'; 
statevar_figure_names{index} ={'SNARE Y';'A_P_M - GCC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_yy_a2_cpm = index;

%Snares VV
index = index + 1;
statevar(index) = vv_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_g';
statevar_explaination{index} = 'Total V SNAREs in TGN';
% statevar_figure_names{index} = 'SNARE V - TGN'; 
statevar_figure_names{index} ={'SNARE V';'TGN'};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_g = index;

index = index + 1;
statevar(index) = vv_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_b1_cg';
statevar_explaination{index} = 'Coat B budded total V SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE V - B_G - CBC'; 
statevar_figure_names{index} ={'SNARE V';'B_G - CBC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_b1_cg = index;

index = index + 1;
statevar(index) = vv_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_b1_mtc';
statevar_explaination{index} = 'Coat B budded total V SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE V - B_G - NSC'; 
statevar_figure_names{index} ={'SNARE V';'B_G - NSC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_b1_mtc = index;

index = index + 1;
statevar(index) = vv_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_b1_cpm';
statevar_explaination{index} = 'Coat B budded total V SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE V - B_G - GCC'; 
statevar_figure_names{index} ={'SNARE V';'B_G - GCC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_b1_cpm = index;

index = index + 1;
statevar(index) = vv_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_pm';
statevar_explaination{index} = 'SNARE V at growth cone membrane';
% statevar_figure_names{index} = 'SNARE V - GC'; % 
statevar_figure_names{index} = {'SNARE V';'GC'};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_pm = index;

index = index + 1;
statevar(index) = vv_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_a1_cg';
statevar_explaination{index} = 'Coat A budded total V SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE V - A_G - CBC'; 
statevar_figure_names{index} ={'SNARE V';' A_G - CBC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_a1_cg = index;

index = index + 1;
statevar(index) = vv_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_a1_mtc';
statevar_explaination{index} = 'Coat A budded total V SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE V - A_G - NSC';  
statevar_figure_names{index} ={'SNARE V';'A_G - NSC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_a1_mtc = index;

index = index + 1;
statevar(index) = vv_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_a1_cpm';
statevar_explaination{index} = 'Coat A budded total V SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE V - A_G - GCC';  
statevar_figure_names{index} ={'SNARE V';'A_G - GCC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_a1_cpm = index;

index = index + 1;
statevar(index) = vv_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_b2_cg';
statevar_explaination{index} = 'Coat B budded total V SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE V - B_P_M - CBC';  
statevar_figure_names{index} ={'SNARE V';'B_P_M - CBC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_b2_cg = index;

index = index + 1;
statevar(index) =  vv_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_b2_mtc';
statevar_explaination{index} = 'Coat B budded total V SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE V - B_P_M - NSC';  
statevar_figure_names{index} ={'SNARE V';'B_P_M - NSC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_b2_mtc = index;

index = index + 1;
statevar(index) = vv_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_b2_cpm';
statevar_explaination{index} = 'Coat B budded total V SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE V - B_P_M - GCC';  
statevar_figure_names{index} ={'SNARE V';'B_P_M - GCC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_b2_cpm = index;

index = index + 1;
statevar(index) = vv_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_a2_cg';
statevar_explaination{index} = 'Coat A budded total V SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE V - A_P_M - CBC';  
statevar_figure_names{index} ={'SNARE V';'A_P_M - CBC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_a2_cg = index;

index = index + 1;
statevar(index) = vv_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_a2_mtc';
statevar_explaination{index} = 'Coat A budded total V SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE V - A_P_M - NSC';  
statevar_figure_names{index} ={'SNARE V';'A_P_M - NSC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_a2_mtc = index;

index = index + 1;
statevar(index) = vv_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'vv_a2_cpm';
statevar_explaination{index} = 'Coat A budded total V SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE V - A_P_M - GCC';  
statevar_figure_names{index} ={'SNARE V';'A_P_M - GCC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_vv_a2_cpm = index;

%Snares XX
index = index + 1;
statevar(index) = xx_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_g';
statevar_explaination{index} = 'SNARE X - TGN'; 
% statevar_figure_names{index} = 'SNARE X - TGN';  
statevar_figure_names{index} ={'SNARE X';'TGN'};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_g = index;

index = index + 1;
statevar(index) = xx_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_b1_cg';
statevar_explaination{index} = 'Coat B budded total X SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE X - B_G - CBC';  
statevar_figure_names{index} ={'SNARE X';'B_G - CBC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_b1_cg = index;

index = index + 1;
statevar(index) = xx_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_b1_mtc';
statevar_explaination{index} = 'Coat B budded total X SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE X - B_G - NSC';  
statevar_figure_names{index} ={'SNARE X';'B_G - NSC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_b1_mtc = index;

index = index + 1;
statevar(index) = xx_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_b1_cpm';
statevar_explaination{index} = 'Coat B budded total X SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE X - B_G - GCC';  
statevar_figure_names{index} ={'SNARE X';'B_G - GCC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_b1_cpm = index;

index = index + 1;
statevar(index) = xx_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_pm';
statevar_explaination{index} = 'SNARE X at growth cone membrane';
% statevar_figure_names{index} = 'SNARE X - GC';  
statevar_figure_names{index} ={'SNARE X';' GC'};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_pm = index;

index = index + 1;
statevar(index) = xx_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_a1_cg';
statevar_explaination{index} = 'Coat A budded total X SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE X - A_G - CBC';  
statevar_figure_names{index} ={'SNARE X';'A_G - CBC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_a1_cg = index;

index = index + 1;
statevar(index) = xx_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_a1_mtc';
statevar_explaination{index} =  'Coat A budded total X SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE X - A_G - NSC'; 
statevar_figure_names{index} ={'SNARE X';'A_G - NSC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_a1_mtc = index;

index = index + 1;
statevar(index) = xx_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_a1_cpm';
statevar_explaination{index} =  'Coat A budded total X SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE X - A_G - GCC'; 
statevar_figure_names{index} ={'SNARE X';'A_G - GCC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_a1_cpm = index;

index = index + 1;
statevar(index) = xx_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_b2_cg';
statevar_explaination{index} =  'Coat B budded total X SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE X - B_P_M - CBC'; 
statevar_figure_names{index} ={'SNARE X';'B_P_M - CBC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_b2_cg = index;

index = index + 1;
statevar(index) = xx_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_b2_mtc';
statevar_explaination{index} =  'Coat B budded total X SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE X - B_P_M - NSC'; 
statevar_figure_names{index} ={'SNARE X';'B_P_M - NSC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_b2_mtc = index;

index = index + 1;
statevar(index) = xx_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_b2_cpm';
statevar_explaination{index} = 'Coat B budded total X SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE X - B_P_M - GCC'; 
statevar_figure_names{index} ={'SNARE X';'B_P_M - GCC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_b2_cpm = index;

index = index + 1;
statevar(index) = xx_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_a2_cg';
statevar_explaination{index} = 'Coat A budded total X SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE X - A_P_M - CBC'; 
statevar_figure_names{index} ={'SNARE X';'A_P_M - CBC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_a2_cg = index;

index = index + 1;
statevar(index) = xx_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_a2_mtc';
statevar_explaination{index} = 'Coat A budded total X SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE X - A_P_M - NSC'; 
statevar_figure_names{index} ={'SNARE X';'A_P_M - NSC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_a2_mtc = index;

index = index + 1;
statevar(index) = xx_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'xx_a2_cpm';
statevar_explaination{index} = 'Coat A budded total X SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE X - A_P_M - GCC';  
statevar_figure_names{index} ={'SNARE X';'A_P_M - GCC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_xx_a2_cpm = index;

%Snares UU
index = index + 1;
statevar(index) = uu_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_g';
statevar_explaination{index} = 'SNARE U - TGN'; 
% statevar_figure_names{index} = 'SNARE U - TGN'; 
statevar_figure_names{index} ={'SNARE U';' TGN'};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_g = index;

index = index + 1;
statevar(index) = uu_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_b1_cg';
statevar_explaination{index} = 'Coat B budded total U SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE U - B_G - CBC';
statevar_figure_names{index} ={'SNARE U';'B_G - CBC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_b1_cg = index;

index = index + 1;
statevar(index) =  uu_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_b1_mtc';
statevar_explaination{index} = 'Coat B budded total U SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE U - B_G - NSC'; 
statevar_figure_names{index} ={'SNARE U';'B_G - NSC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_b1_mtc = index;

index = index + 1;
statevar(index) =  uu_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_b1_cpm';
statevar_explaination{index} = 'Coat B budded total U SNAREs from TNGv - GCC'; 
% statevar_figure_names{index} = 'SNARE U - B_G - GCC'; 
statevar_figure_names{index} ={'SNARE U';'B_G - GCC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_b1_cpm = index;

index = index + 1;
statevar(index) = uu_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_pm';
statevar_explaination{index} = 'SNARE U at growth cone membrane';
% statevar_figure_names{index} = 'SNARE U - GC'; 
statevar_figure_names{index} ={'SNARE U';'GC'};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_pm = index;

index = index + 1;
statevar(index) =  uu_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_a1_cg';
statevar_explaination{index} = 'Coat A budded total U SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE U - A_G - CBC'; 
statevar_figure_names{index} ={'SNARE U';'A_G - CBC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_a1_cg = index;

index = index + 1;
statevar(index) =  uu_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_a1_mtc';
statevar_explaination{index} = 'Coat A budded total U SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE U - A_G - NSC'; 
statevar_figure_names{index} ={'SNARE U';'A_G - NSC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_a1_mtc = index;

index = index + 1;
statevar(index) =  uu_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_a1_cpm';
statevar_explaination{index} = 'Coat A budded total U SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE U - A_G - GCC'; 
statevar_figure_names{index} ={'SNARE U';'A_G - GCC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_a1_cpm = index;

index = index + 1;
statevar(index) =  uu_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_b2_cg';
statevar_explaination{index} = 'Coat B budded total U SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE U - B_P_M - CBC'; 
statevar_figure_names{index} ={'SNARE U';'B_P_M - CBC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_b2_cg= index;

index = index + 1;
statevar(index) =  uu_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_b2_mtc';
statevar_explaination{index} = 'Coat B budded total U SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE U - B_P_M - NSC'; 
statevar_figure_names{index} ={'SNARE U';'B_P_M - NSC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_b2_mtc= index;

index = index + 1;
statevar(index) =  uu_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_b2_cpm';
statevar_explaination{index} = 'Coat B budded total U SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE U - B_P_M - GCC'; 
statevar_figure_names{index} ={'SNARE U';'B_P_M - GCC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_b2_cpm= index;

index = index + 1;
statevar(index) =  uu_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_a2_cg';
statevar_explaination{index} = 'Coat A budded total U SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE U - A_P_M - CBC'; 
statevar_figure_names{index} ={'SNARE U';'A_P_M - CBC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_a2_cg= index;

index = index + 1;
statevar(index) =  uu_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_a2_mtc';
statevar_explaination{index} = 'Coat A budded total U SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE U - A_P_M - NSC'; 
statevar_figure_names{index} ={'SNARE U';'A_P_M - NSC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_a2_mtc= index;

index = index + 1;
statevar(index) =  uu_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'uu_a2_cpm';
statevar_explaination{index} = 'Coat A budded total U SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE U - A_P_M - GCC'; 
statevar_figure_names{index} ={'SNARE U';'A_P_M - GCC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_uu_a2_cpm= index;

%Kinesin-Receptor
index = index + 1;
statevar(index) =  kk_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_g';
statevar_explaination{index} = 'Kinesin R - TGN'; 
% statevar_figure_names{index} = 'Kinesin R - TGN'; 
statevar_figure_names{index} ={'Kinesin R';'TGN'};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_g = index;

index = index + 1;
statevar(index) =  kk_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_b1_cg';
statevar_explaination{index} = 'Coat B budded total kinesins receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - B_G - CBC'; 
statevar_figure_names{index} ={'Kinesin R';'B_G - CBC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_b1_cg = index;

index = index + 1;
statevar(index) =  kk_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_b1_mtc';
statevar_explaination{index} = 'Coat B budded total kinesins receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - B_G - NSC'; 
statevar_figure_names{index} ={'Kinesin R';'B_G - NSC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_b1_mtc = index;

index = index + 1;
statevar(index) =  kk_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_b1_cpm';
statevar_explaination{index} = 'Coat B budded total kinesins receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - B_G - GCC'; 
statevar_figure_names{index} ={'Kinesin R';'B_G - GCC'};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_b1_cpm = index;

index = index + 1;
statevar(index) =  kk_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_pm';
statevar_explaination{index} = 'Kinesin R at growth cone membrane';
% statevar_figure_names{index} = 'Kinesin R - GC'; 
statevar_figure_names{index} ={'Kinesin R';' GC'};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_pm = index;

index = index + 1;
statevar(index) =  kk_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_a1_cg';
statevar_explaination{index} = 'Coat A budded total kinesins receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - A_G - CBC'; 
statevar_figure_names{index} ={'Kinesin R';'A_G - CBC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_a1_cg= index;

index = index + 1;
statevar(index) =  kk_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_a1_mtc';
statevar_explaination{index} = 'Coat A budded total kinesins receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - A_G - NSC'; 
statevar_figure_names{index} ={'Kinesin R';'A_G - NSC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_a1_mtc = index;

index = index + 1;
statevar(index) =  kk_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_a1_cpm';
statevar_explaination{index} = 'Coat A budded total kinesins receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - A_G - GCC'; 
statevar_figure_names{index} ={'Kinesin R';'A_G - GCC'};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_a1_cpm = index;

index = index + 1;
statevar(index) =  kk_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_b2_cg';
statevar_explaination{index} = 'Coat B budded total kinesins receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - B_P_M - CBC'; 
statevar_figure_names{index} ={'Kinesin R';'B_P_M - CBC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_b2_cg = index;

index = index + 1;
statevar(index) =  kk_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_b2_mtc';
statevar_explaination{index} = 'Coat B budded total kinesins receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - B_P_M - NSC'; 
statevar_figure_names{index} ={'Kinesin R';'B_P_M - NSC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_b2_mtc = index;

index = index + 1;
statevar(index) =  kk_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_b2_cpm';
statevar_explaination{index} = 'Coat B budded total kinesins receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - B_P_M - GCC'; 
statevar_figure_names{index} ={'Kinesin R';'B_P_M - GCC'};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_b2_cpm = index;

index = index + 1;
statevar(index) =  kk_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_a2_cg';
statevar_explaination{index} = 'Coat A budded total kinesins receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - A_P_M - CBC'; 
statevar_figure_names{index} ={'Kinesin R';'A_P_M - CBC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_a2_cg = index;

index = index + 1;
statevar(index) =  kk_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_a2_mtc';
statevar_explaination{index} = 'Coat A budded total kinesins receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - A_P_M - NSC'; 
statevar_figure_names{index} ={'Kinesin R';'A_P_M - NSC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_a2_mtc = index;

index = index + 1;
statevar(index) =  kk_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'kk_a2_cpm';
statevar_explaination{index} = 'Coat A budded total kinesins receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - A_P_M - GCC'; 
statevar_figure_names{index} ={'Kinesin R';'A_P_M - GCC'};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_kk_a2_cpm = index;

%Dynein-Receptor
index = index + 1;
statevar(index) =  dd_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_g';
statevar_explaination{index} = 'Dynein R - TGN'; 
% statevar_figure_names{index} = 'Dynein R - TGN'; 
statevar_figure_names{index} ={'Dynein R';' TGN '};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_g = index;

index = index + 1;
statevar(index) =  dd_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_b1_cg';
statevar_explaination{index} = 'Coat B budded total dynein receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Dynein R - B_G - CBC'; 
statevar_figure_names{index} ={'Dynein R';' B_G - CBC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_b1_cg= index;

index = index + 1;
statevar(index) =  dd_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_b1_mtc';
statevar_explaination{index} =  'Coat B budded total dynein receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Dynein R - B_G - NSC';  
statevar_figure_names{index} ={'Dynein R';' B_G - NSC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_b1_mtc = index;

index = index + 1;
statevar(index) =  dd_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_b1_cpm';
statevar_explaination{index} =  'Coat B budded total dynein receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Dynein R - B_G - GCC';  
statevar_figure_names{index} ={'Dynein R';' B_G - GCC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_b1_cpm = index;

index = index + 1;
statevar(index) =  dd_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_pm';
statevar_explaination{index} = 'Dynein R at growth cone membrane';
% statevar_figure_names{index} = 'Dynein R - GC';  
statevar_figure_names{index} ={'Dynein R';' GC '};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_pm = index;

index = index + 1;
statevar(index) =  dd_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_a1_cg';
statevar_explaination{index} =  'Coat A budded total dynein receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Dynein R - A_G - CBC';  
statevar_figure_names{index} ={'Dynein R';' A_G - CBC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_a1_cg = index;

index = index + 1;
statevar(index) =  dd_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_a1_mtc';
statevar_explaination{index} =  'Coat A budded total dynein receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Dynein R - A_G - NSC';  
statevar_figure_names{index} ={'Dynein R';' A_G - NSC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_a1_mtc = index;

index = index + 1;
statevar(index) =  dd_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_a1_cpm';
statevar_explaination{index} =  'Coat A budded total dynein receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Dynein R - A_G - GCC';  
statevar_figure_names{index} ={'Dynein R';' A_G - GCC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_a1_cpm = index;

index = index + 1;
statevar(index) =  dd_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_b2_cg';
statevar_explaination{index} =  'Coat B budded total dynein receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Dynein R - B_P_M - CBC';  
statevar_figure_names{index} ={'Dynein R';' B_P_M - CBC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_b2_cg = index;

index = index + 1;
statevar(index) =  dd_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_b2_mtc';
statevar_explaination{index} =  'Coat B budded total dynein receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Dynein R - B_P_M - NSC';  
statevar_figure_names{index} ={'Dynein R';' B_P_M - NSC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_b2_mtc = index;

index = index + 1;
statevar(index) =  dd_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_b2_cpm';
statevar_explaination{index} =  'Coat B budded total dynein receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Dynein R - B_P_M - GCC';  
statevar_figure_names{index} ={'Dynein R';' B_P_M - GCC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_b2_cpm = index;

index = index + 1;
statevar(index) =  dd_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_a2_cg';
statevar_explaination{index} =  'Coat A budded total dynein receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Dynein R - A_P_M - CBC';  
statevar_figure_names{index} ={'Dynein R';' A_P_M - CBC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_a2_cg = index;

index = index + 1;
statevar(index) =  dd_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_a2_mtc';
statevar_explaination{index} =  'Coat A budded total dynein receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Dynein R - A_P_M - NSC';  
statevar_figure_names{index} ={'Dynein R';' A_P_M - NSC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_a2_mtc = index;

index = index + 1;
statevar(index) =  dd_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dd_a2_cpm';
statevar_explaination{index} =  'Coat A budded total dynein receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Dynein R - A_P_M - GCC';  
statevar_figure_names{index} ={'Dynein R';' A_P_M - GCC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_dd_a2_cpm = index;

%Recruitment factor cc1-Receptor
index = index + 1;
statevar(index) =  cc1_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_g';
statevar_explaination{index} = 'RF1 - TGN'; 
% statevar_figure_names{index} = 'RF1 - TGN';  
statevar_figure_names{index} ={'Recruitment Factor 1';' TGN '};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_g = index;

index = index + 1;
statevar(index) =  cc1_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_b1_cg';
statevar_explaination{index} =  'Coat B budded total recruitment factor 1 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF1 - B_G - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' B_G - CBC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_b1_cg = index;

index = index + 1;
statevar(index) =  cc1_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_b1_mtc';
statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF1 - B_G - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' B_G - NSC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_b1_mtc = index;

index = index + 1;
statevar(index) =  cc1_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_b1_cpm';
statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF1 - B_G - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' B_G - CGC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_b1_cpm = index;

index = index + 1;
statevar(index) =  cc1_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_pm';
statevar_explaination{index} = 'RF1 at growth cone membrane';
% statevar_figure_names{index} = 'RF1 - GC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' GC '};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_pm = index;

index = index + 1;
statevar(index) =  cc1_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_a1_cg';
statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF1 - A_G - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' A_G - CBC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_a1_cg = index;

index = index + 1;
statevar(index) =  cc1_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_a1_mtc';
statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF1 - A_G - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' A_G - NSC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_a1_mtc = index;

index = index + 1;
statevar(index) =  cc1_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_a1_cpm';
statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF1 - A_G - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' A_G - GCC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_a1_cpm = index;

index = index + 1;
statevar(index) =  cc1_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_b2_cg';
statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF1 - B_P_M - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' B_P_M - CBC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_b2_cg = index;

index = index + 1;
statevar(index) =  cc1_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_b2_mtc';
statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF1 - B_P_M - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' B_P_M - NSC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_b2_mtc = index;

index = index + 1;
statevar(index) =  cc1_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_b2_cpm';
statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF1 - B_P_M - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' B_P_M - GCC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_b2_cpm = index;

index = index + 1;
statevar(index) =  cc1_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_a2_cg';
statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF1 - A_P_M - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' A_P_M - CBC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_a2_cg = index;

index = index + 1;
statevar(index) =  cc1_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_a2_mtc';
statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF1 - A_P_M - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' A_P_M - NSC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_a2_mtc = index;

index = index + 1;
statevar(index) =  cc1_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc1_a2_cpm';
statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF1 - A_P_M - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 1';' A_P_M - GCC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc1_a2_cpm = index;


%Recruitment factor cc2
index = index + 1;
statevar(index) =  cc2_g; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_g';
statevar_explaination{index} = 'RF2 - TGN'; 
% statevar_figure_names{index} = 'RF2 - TGN'; 
statevar_figure_names{index} ={'Recruitment factor 2';' TGN '};
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_g = index;

index = index + 1;
statevar(index) =  cc2_b1_cg; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_b1_cg';
statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF2 - B_G - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' B_G - CBC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_b1_cg = index;

index = index + 1;
statevar(index) =  cc2_b1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_b1_mtc';
statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF2 - B_G - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' B_G - NSC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_b1_mtc = index;

index = index + 1;
statevar(index) =  cc2_b1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_b1_cpm';
statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF2 - B_G - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' B_G - GCC '};
statevar_figure_colors(index,:) = b1_color;
statevar_figure_lineStyles{index} = b1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_b1_cpm = index;

index = index + 1;
statevar(index) =  cc2_pm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_pm';
statevar_explaination{index} = 'Total recruitment factor 2 in growth cone membrane';
% statevar_figure_names{index} = 'RF2 - GC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' GC '};
statevar_figure_colors(index,:) = organelle_color;
statevar_figure_lineStyles{index} = organelle_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_pm = index;

index = index + 1;
statevar(index) =  cc2_a1_cg; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_a1_cg';
statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF2 - A_G - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' A_G - CBC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_a1_cg = index;

index = index + 1;
statevar(index) =  cc2_a1_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_a1_mtc';
statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF2 - A_G - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' A_G - NSC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_a1_mtc = index;

index = index + 1;
statevar(index) =  cc2_a1_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_a1_cpm';
statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF2 - A_G - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' A_G - GCC '};
statevar_figure_colors(index,:) = a1_color;
statevar_figure_lineStyles{index} = a1_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_a1_cpm = index;

index = index + 1;
statevar(index) =  cc2_b2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_b2_cg';
statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF2 - B_P_M - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' B_P_M - CBC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_b2_cg = index;

index = index + 1;
statevar(index) =  cc2_b2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_b2_mtc';
statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF2 - B_P_M - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' B_P_M - NSC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_b2_mtc = index;

index = index + 1;
statevar(index) =  cc2_b2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_b2_cpm';
statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF2 - B_P_M - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' B_P_M - GCC '};
statevar_figure_colors(index,:) = b2_color;
statevar_figure_lineStyles{index} = b2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_b2_cpm = index;

index = index + 1;
statevar(index) =  cc2_a2_cg; % = statevar(index);     
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 2;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_a2_cg';
statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF2 - A_P_M - CBC'; 
statevar_figure_names{index} ={'Recruitment factor 2';' A_P_M - CBC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_a2_cg = index;

index = index + 1;
statevar(index) =  cc2_a2_mtc; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_a2_mtc';
statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF2 - A_P_M - NSC'; 
statevar_figure_names{index} ={'Recruitment factor 2';'A_P_M - NSC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_a2_mtc = index;

index = index + 1;
statevar(index) =  cc2_a2_cpm; % = statevar(index);     
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'cc2_a2_cpm';
statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from plasma membrane - GCC'; 
statevar_figure_names{index} ={'Recruitment factor 2';'A_P_M - GCC '};
statevar_figure_colors(index,:) = a2_color;
statevar_figure_lineStyles{index} = a2_lineStyle;
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_cc2_a2_cpm = index;

index = index + 1;
statevar(index) = effective_tubulin; % = statevar(index);
plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
plotIndex = plotRowIndex * plots_per_row + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'effective_tubulin';
statevar_explaination{index} = 'Effective tubulin';
statevar_figure_names{index} = 'Effective Tubulin';
statevar_figure_colors(index,:) = [255/255 130/255 0]; % orange;
statevar_figure_lineStyles{index} = '-';
statevar_unit{index} = '\muM ';
statevar_buffer(index) = false;
indexS_effective_tubulin = index;

index = index + 1;
statevar(index) = dyn_MTs; % = statevar(index);
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'dyn_MTs';
statevar_explaination{index} = 'Dynamic microtubules';
statevar_figure_names{index} = 'Dynamic MTs';
statevar_figure_colors(index,:) = [255/255 130/255 0]; % orange [0 155/255 0]; % green [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_unit{index} = ' \mum';
statevar_buffer(index) = false;
indexS_dyn_MTs = index;

index = index + 1;
statevar(index) = average_dyn_MTs_length; % = statevar(index);
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'average_dyn_MTs_length';
statevar_explaination{index} = 'Average length of dynamic MTs';
statevar_figure_names{index} = {'Average length of dyn MTs'};
statevar_figure_colors(index,:) = [255/255 130/255 0]; % orange [0 155/255 0]; % green [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_unit{index} = ' \mum';
statevar_buffer(index) = false;
indexS_average_dyn_MTs_length = index;

index = index + 1;
statevar(index) = stbl_MTs_length; % = statevar(index);
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'stbl_MTs_length';
statevar_explaination{index} = 'Stable microtubule length';
 statevar_figure_names{index} = 'Stable MTs Length';
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_unit{index} = '\mum ';
statevar_buffer(index) = false;
indexS_stbl_MTs_length = index;

total_membrane = 0;
for indexStatevar = 1:lastStatevarIndex_of_membraneVariable
    total_membrane = total_membrane + statevar(indexStatevar);
end

index = index + 1;
statevar(index) = total_membrane; % = statevar(index);
index_total_membrane = index;
plotIndex = plotIndex + 1;
statevar_plotIndexes(index) = plotIndex;
statevar_names{index} = 'total_membrane';
statevar_figure_names{index} = 'Total Membrane';
statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
statevar_figure_lineStyles{index} = '-';
statevar_unit{index} = ' ';
statevar_buffer(index) = false;
indexS_total_membrane = index;

if statevar_length ~= index
   ME = MException('statevar index not equal to stated statevar length');
   throw(ME);
end









% 
% %statevar_names = zeros(129,1);
% statevar_length = 131;
% statevar = zeros(statevar_length,1);
% statevar_plotIndexes = zeros(statevar_length,1);
% statevar_buffer = zeros(statevar_length,1);
% plotRowIndex = -1;
% plots_per_row = 5;
% index = 0;
% statevar_names = cell(statevar_length,1);
% statevar_figure_names = cell(statevar_length,1);
% statevar_figure_colors = zeros(statevar_length,3);
% statevar_figure_lineStyles = cell(statevar_length,1);
% statevar_explaination = cell(statevar_length,1);
% statevar_unit = cell(statevar_length,1);
% 
% b1_color = [255/255 130/255 0]; % orange
% a1_color = [255/255 130/255 0]; % orange
% b2_color = [0/255 100/255 200/255]; % blue
% a2_color = [0/255 100/255 200/255]; % blue
% organelle_color = [0 155/255 0]; % green
% organelle_lineStyle = '-';
% b1_lineStyle = '-';
% a1_lineStyle = ':';
% a2_lineStyle = '-';
% b2_lineStyle = ':';
% 
% 
% 
% %Membranes
% index = index + 1;
% statevar(index) = sg; % = statevar(index);
% plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'sg'; %keep name for figure generation
% statevar_explaination{index} = 'Trans Golgi Network ';
% statevar_figure_names{index} = 'TGN surface'; 
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' [\mum{^2}]';
% statevar_buffer(index) = false;
% indexS_sg = index;
% 
% index = index + 1;
% statevar(index) = nb1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'nb1_cg';
% statevar_explaination{index} = 'Coat B budded membrane from TNG in CBC ';
% statevar_figure_names{index} = 'Vesicles B_G - CBC';
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_nb1_cg = index;
% 
% index = index + 1;
% statevar(index) = nb1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'nb1_mtc';
% statevar_explaination{index} = 'Coat B budded membrane from TNG - NSC ';
% statevar_figure_names{index} = 'Vesicles B_G - NSC';
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_nb1_mtc = index;
% 
% index = index + 1;
% statevar(index) = nb1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'nb1_cpm';
% statevar_explaination{index} = 'Coat B budded membrane from TNG in GCC ';
% statevar_figure_names{index} = 'Vesicles B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_nb1_cpm = index;
% 
% index = index + 1;
% statevar(index) = spm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'spm'; %keep name for figure generation
% statevar_explaination{index} = 'Growth cone plasma membrane';
% statevar_figure_names{index} = 'GC surface';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_spm = index;
% 
% index = index + 1;
% statevar(index) = na1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'na1_cg';
% statevar_explaination{index} = 'Coat A budded membrane from TGN in CBC ';
% statevar_figure_names{index} = 'Vesicles A_G - CBC';
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_na1_cg = index;
% 
% index = index + 1;
% statevar(index) = na1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'na1_mtc';
% statevar_explaination{index} = 'Coat A budded membrane from TNG in MTC';
% statevar_figure_names{index} = 'Vesicles A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_na1_mtc = index;
% 
% index = index + 1;
% statevar(index) = na1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'na1_cpm';
% statevar_explaination{index} = 'Coat A budded membrane from TNG in GCC ';
% statevar_figure_names{index} = 'Vesicles A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_na1_cpm = index;
% 
% index = index + 1;
% statevar(index) = nb2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex +1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'nb2_cg';
% statevar_explaination{index} = 'Coat B budded membrane from plasma membrane in CBC ';
% statevar_figure_names{index} = 'Vesicles B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_nb2_cg = index;
% 
% index = index + 1;
% statevar(index) = nb2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'nb2_mtc';
% statevar_explaination{index} = 'Coat B budded membrane from plasma membrane in MTC';
% statevar_figure_names{index} = 'Vesicles B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_nb2_mtc = index;
% 
% index = index + 1;
% statevar(index) = nb2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'nb2_cpm';
% statevar_explaination{index} = 'Coat B budded membrane from plasma membrane in GCC ';
% statevar_figure_names{index} = 'Vesicles B_P_M - GCC';
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_nb2_cpm = index;
% 
% index = index + 1;
% statevar(index) = na2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'na2_cg';
% statevar_explaination{index} = 'Coat A budded membrane from plasma membrane in CBC ';
% statevar_figure_names{index} = 'Vesicles A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_na2_cg = index;
% 
% index = index + 1;
% statevar(index) = na2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'na2_mtc';
% statevar_explaination{index} = 'Coat A budded membrane from plasma membrane in MTC';
% statevar_figure_names{index} = 'Vesicles A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_na2_mtc = index;
% 
% index = index + 1;
% statevar(index) = na2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'na2_cpm';
% statevar_explaination{index} = 'Coat A budded membrane from plasma membrane in GCC ';
% statevar_figure_names{index} = 'Vesicles A_P_M - GCC';
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_buffer(index) = false;
% indexS_na2_cpm = index;
% 
% index = index + 1;
% statevar(index) = s3; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 's3'; 
% statevar_explaination{index} = 'Neurite shaft surface area';
% statevar_figure_names{index} = 'Neurite shaft surface';
% statevar_unit{index} = '[\mum{^2}] ';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% lastStatevarIndex_of_membraneVariable = index;
% statevar_buffer(index) = false;
% indexS_s3 = index;
% 
% 
% %Snares YY
% index = index + 1;
% statevar(index) = yy_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_g';
% statevar_explaination{index} = 'SNARE Y in TGN';
% statevar_figure_names{index} = 'SNARE Y - TGN';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = '  ';
% statevar_buffer(index) = false;
% indexS_yy_g = index;
% 
% index = index + 1;
% statevar(index) = yy_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_b1_cg';
% statevar_explaination{index} = 'Coat B budded total Y SNAREs from TNG in CBC';
% statevar_figure_names{index} = 'SNARE Y - B_G - CBC';
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_b1_cg = index;
% 
% index = index + 1;
% statevar(index) = yy_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total Y SNAREs from TNG in MTC';
% statevar_figure_names{index} = 'SNARE Y - B_G - NSC';
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) = yy_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total Y SNAREsfrom TNG in GCC';
% statevar_figure_names{index} = 'SNARE Y - B_G - GCC';
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) = yy_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_pm';
% statevar_explaination{index} = 'SNARE Y at growth cone membrane';
% statevar_figure_names{index} = 'SNARE Y - GC'; ;
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_pm = index;
% 
% index = index + 1;
% statevar(index) = yy_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_a1_cg';
% statevar_explaination{index} = 'Coat A budded total Y SNAREs from TNG in CBC';
% statevar_figure_names{index} = 'SNARE Y - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_a1_cg = index;
% 
% index = index + 1;
% statevar(index) = yy_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_a1_mtc';
% statevar_explaination{index} = 'Coat A budded total Y SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE Y - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) = yy_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_a1_cpm';
% statevar_explaination{index} = 'Coat A budded total Y SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE Y - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) = yy_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_b2_cg';
% statevar_explaination{index} = 'Coat B budded total Y SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE Y - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_b2_cg = index;
% 
% index = index + 1;
% statevar(index) = yy_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_b2_mtc';
% statevar_explaination{index} = 'Coat B budded total Y SNAREs from plasma membrane in MTU';
% statevar_figure_names{index} = 'SNARE Y - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) = yy_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total Y SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE Y - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) = yy_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_a2_cg';
% statevar_explaination{index} = 'Coat A budded total Y SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE Y - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_a2_cg = index;
% 
% index = index + 1;
% statevar(index) = yy_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total Y SNAREs from plasma membrane in MTU';
% statevar_figure_names{index} = 'SNARE Y - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) = yy_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'yy_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total Y SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE Y - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_yy_a2_cpm = index;
% 
% %Snares VV
% index = index + 1;
% statevar(index) = vv_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_g';
% statevar_explaination{index} = 'Total V SNAREs in TGN';
% statevar_figure_names{index} = 'SNARE V - TGN'; 
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_g = index;
% 
% index = index + 1;
% statevar(index) = vv_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_b1_cg';
% statevar_explaination{index} = 'Coat B budded total V SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE V - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_b1_cg = index;
% 
% index = index + 1;
% statevar(index) = vv_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total V SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE V - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) = vv_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total V SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE V - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) = vv_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_pm';
% statevar_explaination{index} = 'SNARE V at growth cone membrane';
% statevar_figure_names{index} = 'SNARE V - GC';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_pm = index;
% 
% index = index + 1;
% statevar(index) = vv_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_a1_cg';
% statevar_explaination{index} = 'Coat A budded total V SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE V - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_a1_cg = index;
% 
% index = index + 1;
% statevar(index) = vv_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_a1_mtc';
% statevar_explaination{index} = 'Coat A budded total V SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE V - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) = vv_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_a1_cpm';
% statevar_explaination{index} = 'Coat A budded total V SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE V - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) = vv_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_b2_cg';
% statevar_explaination{index} = 'Coat B budded total V SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE V - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_b2_cg = index;
% 
% index = index + 1;
% statevar(index) =  vv_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_b2_mtc';
% statevar_explaination{index} = 'Coat B budded total V SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE V - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) = vv_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total V SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE V - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) = vv_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_a2_cg';
% statevar_explaination{index} = 'Coat A budded total V SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE V - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_a2_cg = index;
% 
% index = index + 1;
% statevar(index) = vv_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total V SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE V - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) = vv_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'vv_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total V SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE V - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_vv_a2_cpm = index;
% 
% %Snares XX
% index = index + 1;
% statevar(index) = xx_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_g';
% statevar_explaination{index} = 'SNARE X - TGN'; 
% statevar_figure_names{index} = 'SNARE X - TGN'; 
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_g = index;
% 
% index = index + 1;
% statevar(index) = xx_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_b1_cg';
% statevar_explaination{index} = 'Coat B budded total X SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE X - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_b1_cg = index;
% 
% index = index + 1;
% statevar(index) = xx_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total X SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE X - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) = xx_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total X SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE X - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) = xx_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_pm';
% statevar_explaination{index} = 'SNARE X at growth cone membrane';
% statevar_figure_names{index} = 'SNARE X - GC';
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_pm = index;
% 
% index = index + 1;
% statevar(index) = xx_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_a1_cg';
% statevar_explaination{index} = 'Coat A budded total X SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE X - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_a1_cg = index;
% 
% index = index + 1;
% statevar(index) = xx_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_a1_mtc';
% statevar_explaination{index} =  'Coat A budded total X SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE X - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) = xx_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_a1_cpm';
% statevar_explaination{index} =  'Coat A budded total X SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE X - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) = xx_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_b2_cg';
% statevar_explaination{index} =  'Coat B budded total X SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE X - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_b2_cg = index;
% 
% index = index + 1;
% statevar(index) = xx_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_b2_mtc';
% statevar_explaination{index} =  'Coat B budded total X SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE X - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) = xx_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total X SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE X - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) = xx_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_a2_cg';
% statevar_explaination{index} = 'Coat A budded total X SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE X - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_a2_cg = index;
% 
% index = index + 1;
% statevar(index) = xx_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total X SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE X - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) = xx_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'xx_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total X SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE X - A_P_M - GCC';  
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_xx_a2_cpm = index;
% 
% %Snares UU
% index = index + 1;
% statevar(index) = uu_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_g';
% statevar_explaination{index} = 'SNARE U - TGN'; 
% statevar_figure_names{index} = 'SNARE U - TGN'; 
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_g = index;
% 
% index = index + 1;
% statevar(index) = uu_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_b1_cg';
% statevar_explaination{index} = 'Coat B budded total U SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE U - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_b1_cg = index;
% 
% index = index + 1;
% statevar(index) =  uu_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total U SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE U - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  uu_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total U SNAREs from TNGv - GCC'; 
% statevar_figure_names{index} = 'SNARE U - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) = uu_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_pm';
% statevar_explaination{index} = 'SNARE U at growth cone membrane';
% statevar_figure_names{index} = 'SNARE U - GC'; ;
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_pm = index;
% 
% index = index + 1;
% statevar(index) =  uu_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_a1_cg';
% statevar_explaination{index} = 'Coat A budded total U SNAREs from TNG - CBC'; 
% statevar_figure_names{index} = 'SNARE U - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_a1_cg = index;
% 
% index = index + 1;
% statevar(index) =  uu_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_a1_mtc';
% statevar_explaination{index} = 'Coat A budded total U SNAREs from TNG - NSC'; 
% statevar_figure_names{index} = 'SNARE U - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  uu_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_a1_cpm';
% statevar_explaination{index} = 'Coat A budded total U SNAREs from TNG - GCC'; 
% statevar_figure_names{index} = 'SNARE U - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  uu_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_b2_cg';
% statevar_explaination{index} = 'Coat B budded total U SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE U - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_b2_cg= index;
% 
% index = index + 1;
% statevar(index) =  uu_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_b2_mtc';
% statevar_explaination{index} = 'Coat B budded total U SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE U - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_b2_mtc= index;
% 
% index = index + 1;
% statevar(index) =  uu_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total U SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE U - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_b2_cpm= index;
% 
% index = index + 1;
% statevar(index) =  uu_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_a2_cg';
% statevar_explaination{index} = 'Coat A budded total U SNAREs from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'SNARE U - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_a2_cg= index;
% 
% index = index + 1;
% statevar(index) =  uu_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total U SNAREs from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'SNARE U - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_a2_mtc= index;
% 
% index = index + 1;
% statevar(index) =  uu_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'uu_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total U SNAREs from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'SNARE U - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_uu_a2_cpm= index;
% 
% %Kinesin-Receptor
% index = index + 1;
% statevar(index) =  kk_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_g';
% statevar_explaination{index} = 'Kinesin R - TGN'; 
% statevar_figure_names{index} = 'Kinesin R - TGN'; 
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_g = index;
% 
% index = index + 1;
% statevar(index) =  kk_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_b1_cg';
% statevar_explaination{index} = 'Coat B budded total kinesins receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_b1_cg = index;
% 
% index = index + 1;
% statevar(index) =  kk_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total kinesins receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  kk_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total kinesins receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  kk_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_pm';
% statevar_explaination{index} = 'Kinesin R at growth cone membrane';
% statevar_figure_names{index} = 'Kinesin R - GC'; ;
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_pm = index;
% 
% index = index + 1;
% statevar(index) =  kk_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_a1_cg';
% statevar_explaination{index} = 'Coat A budded total kinesins receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_a1_cg= index;
% 
% index = index + 1;
% statevar(index) =  kk_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_a1_mtc';
% statevar_explaination{index} = 'Coat A budded total kinesins receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  kk_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_a1_cpm';
% statevar_explaination{index} = 'Coat A budded total kinesins receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  kk_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_b2_cg';
% statevar_explaination{index} = 'Coat B budded total kinesins receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_b2_cg = index;
% 
% index = index + 1;
% statevar(index) =  kk_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_b2_mtc';
% statevar_explaination{index} = 'Coat B budded total kinesins receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  kk_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total kinesins receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) =  kk_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_a2_cg';
% statevar_explaination{index} = 'Coat A budded total kinesins receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Kinesin R - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_a2_cg = index;
% 
% index = index + 1;
% statevar(index) =  kk_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total kinesins receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Kinesin R - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  kk_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'kk_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total kinesins receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Kinesin R - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_kk_a2_cpm = index;
% 
% %Dynein-Receptor
% index = index + 1;
% statevar(index) =  dd_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_g';
% statevar_explaination{index} = 'Dynein R - TGN'; ;
% statevar_figure_names{index} = 'Dynein R - TGN'; ;
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_g = index;
% 
% index = index + 1;
% statevar(index) =  dd_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_b1_cg';
% statevar_explaination{index} = 'Coat B budded total dynein receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Dynein R - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_b1_cg= index;
% 
% index = index + 1;
% statevar(index) =  dd_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_b1_mtc';
% statevar_explaination{index} =  'Coat B budded total dynein receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Dynein R - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  dd_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_b1_cpm';
% statevar_explaination{index} =  'Coat B budded total dynein receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Dynein R - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  dd_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_pm';
% statevar_explaination{index} = 'Dynein R at growth cone membrane';
% statevar_figure_names{index} = 'Dynein R - GC'; ;
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_pm = index;
% 
% index = index + 1;
% statevar(index) =  dd_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_a1_cg';
% statevar_explaination{index} =  'Coat A budded total dynein receptors from TNG - CBC'; 
% statevar_figure_names{index} = 'Dynein R - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_a1_cg = index;
% 
% index = index + 1;
% statevar(index) =  dd_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_a1_mtc';
% statevar_explaination{index} =  'Coat A budded total dynein receptors from TNG - NSC'; 
% statevar_figure_names{index} = 'Dynein R - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  dd_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_a1_cpm';
% statevar_explaination{index} =  'Coat A budded total dynein receptors from TNG - GCC'; 
% statevar_figure_names{index} = 'Dynein R - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  dd_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_b2_cg';
% statevar_explaination{index} =  'Coat B budded total dynein receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Dynein R - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_b2_cg = index;
% 
% index = index + 1;
% statevar(index) =  dd_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_b2_mtc';
% statevar_explaination{index} =  'Coat B budded total dynein receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Dynein R - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  dd_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_b2_cpm';
% statevar_explaination{index} =  'Coat B budded total dynein receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Dynein R - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) =  dd_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_a2_cg';
% statevar_explaination{index} =  'Coat A budded total dynein receptors from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'Dynein R - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_a2_cg = index;
% 
% index = index + 1;
% statevar(index) =  dd_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_a2_mtc';
% statevar_explaination{index} =  'Coat A budded total dynein receptors from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'Dynein R - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  dd_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dd_a2_cpm';
% statevar_explaination{index} =  'Coat A budded total dynein receptors from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'Dynein R - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_dd_a2_cpm = index;
% 
% %Recruitment factor cc1-Receptor
% index = index + 1;
% statevar(index) =  cc1_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_g';
% statevar_explaination{index} = 'RF1 - TGN'; ;
% statevar_figure_names{index} = 'RF1 - TGN'; ;
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_g = index;
% 
% index = index + 1;
% statevar(index) =  cc1_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_b1_cg';
% statevar_explaination{index} =  'Coat B budded total recruitment factor 1 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF1 - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_b1_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc1_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF1 - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc1_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF1 - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  cc1_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_pm';
% statevar_explaination{index} = 'RF1 at growth cone membrane';
% statevar_figure_names{index} = 'RF1 - GC'; ;
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_pm = index;
% 
% index = index + 1;
% statevar(index) =  cc1_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_a1_cg';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF1 - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_a1_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc1_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_a1_mtc';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF1 - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc1_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_a1_cpm';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF1 - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  cc1_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_b2_cg';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF1 - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_b2_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc1_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_b2_mtc';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF1 - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc1_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 1 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF1 - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) =  cc1_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_a2_cg';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF1 - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_a2_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc1_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF1 - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc1_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc1_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 1 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF1 - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc1_a2_cpm = index;
% 
% 
% %Recruitment factor cc2
% index = index + 1;
% statevar(index) =  cc2_g; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_g';
% statevar_explaination{index} = 'RF2 - TGN'; ;
% statevar_figure_names{index} = 'RF2 - TGN'; ;
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_g = index;
% 
% index = index + 1;
% statevar(index) =  cc2_b1_cg; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_b1_cg';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF2 - B_G - CBC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_b1_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc2_b1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_b1_mtc';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF2 - B_G - NSC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_b1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc2_b1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_b1_cpm';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF2 - B_G - GCC'; 
% statevar_figure_colors(index,:) = b1_color;
% statevar_figure_lineStyles{index} = b1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_b1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  cc2_pm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_pm';
% statevar_explaination{index} = 'Total recruitment factor 2 in growth cone membrane';
% statevar_figure_names{index} = 'RF2 - GC'; ;
% statevar_figure_colors(index,:) = organelle_color;
% statevar_figure_lineStyles{index} = organelle_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_pm = index;
% 
% index = index + 1;
% statevar(index) =  cc2_a1_cg; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_a1_cg';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from TNG - CBC'; 
% statevar_figure_names{index} = 'RF2 - A_G - CBC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_a1_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc2_a1_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_a1_mtc';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from TNG - NSC'; 
% statevar_figure_names{index} = 'RF2 - A_G - NSC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_a1_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc2_a1_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_a1_cpm';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from TNG - GCC'; 
% statevar_figure_names{index} = 'RF2 - A_G - GCC'; 
% statevar_figure_colors(index,:) = a1_color;
% statevar_figure_lineStyles{index} = a1_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_a1_cpm = index;
% 
% index = index + 1;
% statevar(index) =  cc2_b2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_b2_cg';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF2 - B_P_M - CBC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_b2_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc2_b2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_b2_mtc';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF2 - B_P_M - NSC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_b2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc2_b2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_b2_cpm';
% statevar_explaination{index} = 'Coat B budded total recruitment factor 2 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF2 - B_P_M - GCC'; 
% statevar_figure_colors(index,:) = b2_color;
% statevar_figure_lineStyles{index} = b2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_b2_cpm = index;
% 
% index = index + 1;
% statevar(index) =  cc2_a2_cg; % = statevar(index);     
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 2;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_a2_cg';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from plasma membrane - CBC'; 
% statevar_figure_names{index} = 'RF2 - A_P_M - CBC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_a2_cg = index;
% 
% index = index + 1;
% statevar(index) =  cc2_a2_mtc; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_a2_mtc';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from plasma membrane - NSC'; 
% statevar_figure_names{index} = 'RF2 - A_P_M - NSC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_a2_mtc = index;
% 
% index = index + 1;
% statevar(index) =  cc2_a2_cpm; % = statevar(index);     
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'cc2_a2_cpm';
% statevar_explaination{index} = 'Coat A budded total recruitment factor 2 from plasma membrane - GCC'; 
% statevar_figure_names{index} = 'RF2 - A_P_M - GCC'; 
% statevar_figure_colors(index,:) = a2_color;
% statevar_figure_lineStyles{index} = a2_lineStyle;
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_cc2_a2_cpm = index;
% 
% index = index + 1;
% statevar(index) = effective_tubulin; % = statevar(index);
% plotRowIndex = plotRowIndex + 1; %%%%%%%%%%%%%%%%%%%%%%%%%% new row in plot
% plotIndex = plotRowIndex * plots_per_row + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'effective_tubulin';
% statevar_explaination{index} = 'Effective tubulin';
% statevar_figure_names{index} = 'Effective Tubulin';
% statevar_figure_colors(index,:) = [255/255 130/255 0]; % orange;
% statevar_figure_lineStyles{index} = '-';
% statevar_unit{index} = '\muM ';
% statevar_buffer(index) = false;
% indexS_effective_tubulin = index;
% 
% index = index + 1;
% statevar(index) = dyn_MTs; % = statevar(index);
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'dyn_MTs';
% statevar_explaination{index} = 'Dynamic microtubules';
% statevar_figure_names{index} = 'Dynamic MTs';
% statevar_figure_colors(index,:) = [255/255 130/255 0]; % orange [0 155/255 0]; % green [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_unit{index} = ' \mum';
% statevar_buffer(index) = false;
% indexS_dyn_MTs = index;
% 
% index = index + 1;
% statevar(index) = stbl_MTs_length; % = statevar(index);
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'stbl_MTs_length';
% statevar_explaination{index} = 'Stable microtubule length';
% statevar_figure_names{index} = 'Stable MTs Length';
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_unit{index} = '\mum ';
% statevar_buffer(index) = false;
% indexS_stbl_MTs_length = index;
% 
% total_membrane = 0;
% for indexStatevar = 1:lastStatevarIndex_of_membraneVariable
%     total_membrane = total_membrane + statevar(indexStatevar);
% end
% 
% index = index + 1;
% statevar(index) = total_membrane; % = statevar(index);
% index_total_membrane = index;
% plotIndex = plotIndex + 1;
% statevar_plotIndexes(index) = plotIndex;
% statevar_names{index} = 'total_membrane';
% statevar_figure_names{index} = 'Total Membrane';
% statevar_figure_colors(index,:) = [0 155/255 0]; % green [255/255 130/255 0]; % orange [0/255 100/255 200/255] % blue
% statevar_figure_lineStyles{index} = '-';
% statevar_unit{index} = ' ';
% statevar_buffer(index) = false;
% indexS_total_membrane = index;
% 
% if statevar_length ~= index
%    ME = MException('statevar index not equal to stated statevar length');
%    throw(ME);
% end