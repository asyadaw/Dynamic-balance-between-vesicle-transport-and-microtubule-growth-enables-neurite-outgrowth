figure;

global Output_fluxes Output_time

% Output_fluxes_names = { 'a1 g into cg',        'a1 cg into mtc',       'a1 mtc into cpm',     'a1 cpm into pm',...%4
%                         'b1 g into cg',        'b1 cg into mtc',       'b1 mtc into cpm',     'b1 cpm into pm',...%8
%                         'a2 pm into cpm',      'a2 cpm into mtc',      'a2 mtc into cg',      'a2 cg into g',...%12                          
%                         'b2 pm into cpm',      'b2 cpm into mtc',      'b2 mtc into cg',      'b2 cg into g',...%16           
%                         'xx a1 g into cg',     'xx a1 cg into mtc',    'xx a1 mtc into cpm',  'xx a1 cpm into pm',...%20
%                         'xx b1 g into cg',     'xx b1 cg into mtc',    'xx b1 mtc into cpm',  'xx b1 cpm into pm',...%24
%                         'xx a2 pm into cpm',   'xx a2 cpm into mtc',   'xx a2 mtc into cg',   'xx a2 cg into g',...%28
%                         'xx b2 pm into cpm',   'xx b2 cpm into mtc',   'xx b2 mtc into cg',   'xx b2 cg into g',...%32                     
%                         'uu a1 g into cg',     'uu a1 cg into mtc',    'uu a1 mtc into cpm',  'uu a1 cpm into pm',...%36
%                         'uu b1 g into cg',     'uu b1 cg into mtc',    'uu b1 mtc into cpm',  'uu b1 cpm into pm',...%40
%                         'uu a2 pm into cpm',   'uu a2 cpm into mtc',   'uu a2 mtc into cg',   'uu a2 cg into g',...%44
%                         'uu b2 pm into cpm',   'uu b2 cpm into mtc',   'uu b2 mtc into cg',   'uu b2 cg into g',...%48                     
%                         'yy a1 g into cg',     'yy a1 cg into mtc',    'yy a1 mtc into cpm',  'yy a1 cpm into pm',...%52
%                         'yy b1 g into cg',     'yy b1 cg into mtc',    'yy b1 mtc into cpm',  'yy b1 cpm into pm',...%56
%                         'yy a2 pm into cpm',   'yy a2 cpm into mtc',   'yy a2 mtc into cg',   'yy a2 cg into g',...%60
%                         'yy b2 pm into cpm',   'yy b2 cpm into mtc',   'yy b2 mtc into cg',   'yy b2 cg into g',...%64                    
%                         'vv a1 g into cg',     'vv a1 cg into mtc',    'vv a1 mtc into cpm',  'vv a1 cpm into pm',...%68
%                         'vv b1 g into cg',     'vv b1 cg into mtc',    'vv b1 mtc into cpm',  'vv b1 cpm into pm',...%72
%                         'vv a2 pm into cpm',   'vv a2 cpm into mtc',   'vv a2 mtc into cg',   'vv a2 cg into g',...%76                         
%                         'vv b2 pm into cpm',   'vv b2 cpm into mtc',   'vv b2 mtc into cg',   'vv b2 cg into g',...%80
%                         'cc1 a1 g into cg',    'cc1 a1 cg into mtc',   'cc1 a1 mtc into cpm', 'cc1 a1 cpm into pm',...%84
%                         'cc1 b1 g into cg',    'cc1 b1 cg into mtc',   'cc1 b1 mtc into cpm', 'cc1 b1 cpm into pm',...%88
%                         'cc1 a2 pm into cpm',  'cc1 a2 cpm into mtc',  'cc1 a2 mtc into cg',  'cc1 a2 cg into g',...%92
%                         'cc1 b2 pm into cpm',  'cc1 b2 cpm into mtc',  'cc1 b2 mtc into cg',  'cc1 b2 cg into g',...%96
%                         'cc2 a1 g into cg',    'cc2 a1 cg into mtc',   'cc2 a1 mtc into cpm', 'cc2 a1 cpm into pm',...%100
%                         'cc2 b1 g into cg',    'cc2 b1 cg into mtc',   'cc2 b1 mtc into cpm', 'cc2 b1 cpm into pm',...%104
%                         'cc2 a2 pm into cpm',  'cc2 a2 cpm into mtc',  'cc2 a2 mtc into cg',  'cc2 a2 cg into g',...%108
%                         'cc2 b2 pm into cpm',  'cc2 b2 cpm into mtc',  'cc2 b2 mtc into cg',  'cc2 b2 cg into g',...%112
%                         'kk a1 g into cg',     'kk a1 cg into mtc',    'kk a1 mtc into cpm',  'kk a1 cpm into pm',...%116
%                         'kk b1 g into cg',     'kk b1 cg into mtc',    'kk b1 mtc into cpm',  'kk b1 cpm into pm',...%120
%                         'kk a2 pm into cpm',   'kk a2 cpm into mtc',   'kk a2 mtc into cg',   'kk a2 cg into g',...%124                       
%                         'kk b2 pm into cpm',   'kk b2 cpm into mtc',   'kk b2 mtc into cg',   'kk b2 cg into g',...%128
%                         'dd a1 g into cg',     'dd a1 cg into mtc',    'dd a1 mtc into cpm',  'dd a1 cpm into pm',...%132
%                         'dd b1 g into cg',     'dd b1 cg into mtc',    'dd b1 mtc into cpm',  'dd b1 cpm into pm',...%136
%                         'dd a2 pm into cpm',   'dd a2 cpm into mtc',   'dd a2 mtc into cg',   'dd a2 cg into g',...%140
%                         'dd b2 pm into cpm',   'dd b2 cpm into mtc',   'dd b2 mtc into cg',   'dd b2 cg into g',...%144       
%                         'k per vesicle a1 cg', 'k per vesicle a1 mtc', 'k per vesicle a1 cpm',...%147
%                         'k per vesicle b1 cg', 'k per vesicle b1 mtc', 'k per vesicle b1 cpm',...%150
%                         'd per vesicle a2 cg', 'd per vesicle a2 mtc', 'd per vesicle a2 cpm',...%153
%                         'd per vesicle b2 cg', 'd per vesicle b2 mtc', 'd per vesicle b2 cpm',...%156
%                         'fraction bound kk a1b1 mtc', 'fraction bound na1 mtc',  'fraction bound nb1 mtc',...%159
%                         'fraction bound dd a2b2 mtc', 'fraction bound na2 mtc',  'fraction bound nb2 mtc',...%162
%                         'fraction bound kk a1b1 cg',  'fraction bound na1 cg',   'fraction bound nb1 cg',...%165
%                         'fraction bound dd a2b2 cpm', 'fraction bound na2 cg',   'fraction bound nb2 cg',...%168
%                         'fraction bound kk a1b1 cpm', 'fraction bound na1 cpm',  'fraction bound nb1 cpm',...%171
%                         'fraction bound dd a2b2 cpm', 'fraction bound na2 cpm',  'fraction bound nb2 cpm',...%173
%                         'snareYVcomplexes b1 cpm pm', 'snareXUcomplexes b1 cpm pm','snareYVcomplexes a2 cpm pm',...
%                         'snareXUcomplexes a2 cpm pm', 'snareYVcomplexes a2 cg g',  'snareXUcomplexes a2 cg g' };%',181
                    
 

Output_fluxes_names =  {   {'Flux of coat A budded vesicles';' from TGN to CBC'},  {'Flux of coat A budded vesicles';' from CBC to NSC'},  {'Flux of coat A budded vesicles';' from NSC to GCC'},  {'Flux of coat A budded vesicles';' from GCC to GC'},...%4
                           {'Flux of coat B budded vesicles';' from TGN to CBC'},  {'Flux of coat B budded vesicles';' from CBC to NSC'},  {'Flux of coat B budded vesicles';' from NSC to GCC'},  {'Flux of coat B budded vesicles';' from GCC to GC'},...%8
                           {'Flux of coat A budded vesicles';' from CBC to TNG'},  {'Flux of coat A budded vesicles';' from NSC to CBC'},  {'Flux of coat A budded vesicles';' from GCC to NSC'},  {'Flux of coat A budded vesicles';' from GC to GCC'},...%12                            
                           {'Flux of coat B budded vesicles';' from CBC to TNG'},  {'Flux of coat B budded vesicles';' from NSC to CBC'},  {'Flux of coat B budded vesicles';' from GCC to NSC'},  {'Flux of coat B budded vesicles';' from GC to GCC'},...%16 
                           {'Flux of SNARE X with coat A';'from TNG to CBC'},     {'Flux of SNARE X with coat A';'from CBC to NSC'},     {'Flux of SNARE X with coat A';'from NSC to GCC'},     {'Flux of SNARE X with coat A';'from GCC to GC'},...%20
                           {'Flux of SNARE X with coat B';'from TNG to CBC'},     {'Flux of SNARE X with coat B';'from CBC to NSC'},     {'Flux of SNARE X with coat B';'from NSC to GCC'},     {'Flux of SNARE X with coat B';'from GCC to GC'},...%24
                           {'Flux of SNARE X with coat A';'from CBC to TGN'},     {'Flux of SNARE X with coat A';'from NSC to CBC'},     {'Flux of SNARE X with coat A';'from GCC to NSC'},     {'Flux of SNARE X with coat A';'from GC to GCC'},...%28   
                           {'Flux of SNARE X with coat B';'from CBC to TGN'},     {'Flux of SNARE X with coat B';'from NSC to CBC'},     {'Flux of SNARE X with coat B';'from GCC to NSC'},     {'Flux of SNARE X with coat B';'from GC to GCC'},...%32
                           {'Flux of SNARE U with coat A';'from TNG to CBC'},     {'Flux of SNARE U with coat A';'from CBC to NSC'},     {'Flux of SNARE U with coat A';'from NSC to GCC'},     {'Flux of SNARE U with coat A';'from GCC to GC'},...%36
                           {'Flux of SNARE U with coat B';'from TNG to CBC'},     {'Flux of SNARE U with coat B';'from CBC to NSC'},     {'Flux of SNARE U with coat B';'from NSC to GCC'},     {'Flux of SNARE U with coat B';'from GCC to GC'},...%40                           
                           {'Flux of SNARE U with coat A';'from CBC to TGN'},     {'Flux of SNARE U with coat A';'from NSC to CBC'},     {'Flux of SNARE U with coat A';'from GCC to NSC'},     {'Flux of SNARE U with coat A';'from GC to GCC'},...%44   
                           {'Flux of SNARE U with coat B';'from CBC to TGN'},     {'Flux of SNARE U with coat B';'from NSC to CBC'},     {'Flux of SNARE U with coat B';'from GCC to NSC'},     {'Flux of SNARE U with coat B';'from GC to GCC'},...%48                         
                           {'Flux of SNARE Y with coat A';'from TNG to CBC'},     {'Flux of SNARE Y with coat A';'from CBC to NSC'},     {'Flux of SNARE Y with coat A';'from NSC to GCC'},     {'Flux of SNARE Y with coat A';'from GCC to GC'},...%52
                           {'Flux of SNARE Y with coat B';'from TNG to CBC'},     {'Flux of SNARE Y with coat B';'from CBC to NSC'},     {'Flux of SNARE Y with coat B';'from NSC to GCC'},     {'Flux of SNARE Y with coat B';'from GCC to GC'},...%56                           
                           {'Flux of SNARE Y with coat A';'from CBC to TGN'},     {'Flux of SNARE Y with coat A';'from NSC to CBC'},     {'Flux of SNARE Y with coat A';'from GCC to NSC'},     {'Flux of SNARE Y with coat A';'from GC to GCC'},...%60   
                           {'Flux of SNARE Y with coat B';'from CBC to TGN'},     {'Flux of SNARE Y with coat B';'from NSC to CBC'},     {'Flux of SNARE Y with coat B';'from GCC to NSC'},     {'Flux of SNARE Y with coat B';'from GC to GCC'},...%64                         
                           {'Flux of SNARE V with coat A';'from TNG to CBC'},     {'Flux of SNARE V with coat A';'from CBC to NSC'},     {'Flux of SNARE V with coat A';'from NSC to GCC'},     {'Flux of SNARE V with coat A';'from GCC to GC'},...%68
                           {'Flux of SNARE V with coat B';'from TNG to CBC'},     {'Flux of SNARE V with coat B';'from CBC to NSC'},     {'Flux of SNARE V with coat B';'from NSC to GCC'},     {'Flux of SNARE V with coat B';'from GCC to GC'},...%72
                           {'Flux of SNARE V with coat A';'from CBC to TGN'},     {'Flux of SNARE V with coat A';'from NSC to CBC'},     {'Flux of SNARE V with coat A';'from GCC to NSC'},     {'Flux of SNARE V with coat A';'from GC to GCC'},...%76   
                           {'Flux of SNARE V with coat B';'from CBC to TGN'},     {'Flux of SNARE V with coat B';'from NSC to CBC'},     {'Flux of SNARE V with coat B';'from GCC to NSC'},     {'Flux of SNARE V with coat B';'from GC to GCC'},...%80
                           {'Flux of RF1  with coat A';'from TNG to CBC'},     {'Flux of RF1  with coat A';'from CBC to NSC'},    {'Flux of RF1  with coat A';'from NSC to GCC'},  {'Flux of RF1  with coat A';'from GCC to GC'},...%84
                           {'Flux of RF1  with coat B';'from TNG to CBC'},     {'Flux of RF1  with coat B';'from CBC to NSC'},    {'Flux of RF1  with coat B';'from NSC to GCC'},  {'Flux of RF1  with coat B';'from GCC to GC'},...%88
                           {'Flux of RF1 with coat A';'from CBC to TGN'},      {'Flux of RF1 with coat A';'from NSC to CBC'},     {'Flux of RF1 with coat A';'from GCC to NSC'},   {'Flux of RF1 with coat A';'from GC to GCC'},...%92   
                           {'Flux of RF1 with coat B';'from CBC to TGN'},      {'Flux of RF1 with coat B';'from NSC to CBC'},     {'Flux of RF1 with coat B';'from GCC to NSC'},   {'Flux of RF1 with coat B';'from GC to GCC'},...%96
                           {'Flux of Recruitment Factor2  with coat A';'from TNG to CBC'},     {'Flux of RF2  with coat A';'from CBC to NSC'},    {'Flux of RF2  with coat A';'from NSC to GCC'},  {'Flux of RF2  with coat A';'from GCC to GC'},...%100
                           {'Flux of RF2  with coat B';'from TNG to CBC'},     {'Flux of RF2  with coat B';'from CBC to NSC'},    {'Flux of RF2  with coat B';'from NSC to GCC'},  {'Flux of RF2  with coat B';'from GCC to GC'},...%104
                           {'Flux of RF2 with coat A';'from CBC to TGN'},      {'Flux of RF2 with coat A';'from NSC to CBC'},     {'Flux of RF2 with coat A';'from GCC to NSC'},   {'Flux of RF2 with coat A';'from GC to GCC'},...%108   
                           {'Flux of RF2 with coat B';'from CBC to TGN'},      {'Flux of RF2 with coat B';'from NSC to CBC'},     {'Flux of RF2 with coat B';'from GCC to NSC'},   {'Flux of RF2 with coat B';'from GC to GCC'},...%112
                           {'Flux of Kinesin R  with coat A';'from TNG to CBC'},               {'Flux of Kinesin R  with coat A';'from CBC to NSC'},              {'Flux of Kinesin R  with coat A';'from NSC to GCC'},            {'Flux of Kinesin R  with coat A';'from GCC to GC'},...%116
                           {'Flux of Kinesin R  with coat B';'from TNG to CBC'},               {'Flux of Kinesin R  with coat B';'from CBC to NSC'},              {'Flux of Kinesin R  with coat B';'from NSC to GCC'},            {'Flux of Kinesin R  with coat B';'from GCC to GC'},...%120                           
                           {'Flux of Kinesin R with coat A';'from CBC to TGN'},     {'Flux of Kinesin R with coat A';'from NSC to CBC'},     {'Flux of Kinesin R with coat A';'from GCC to NSC'},     {'Flux of Kinesin R with coat A';'from GC to GCC'},...%124   
                           {'Flux of Kinesin R with coat B';'from CBC to TGN'},     {'Flux of Kinesin R with coat B';'from NSC to CBC'},     {'Flux of Kinesin R with coat B';'from GCC to NSC'},     {'Flux of Kinesin R with coat B';'from GC to GCC'},...%128
                           {'Flux of Dynein R  with coat A';'from TNG to CBC'},     {'Flux of Dynein R  with coat A';'from CBC to NSC'},     {'Flux of Dynein R  with coat A';'from NSC to GCC'},     {'Flux of Dynein R  with coat A';'from GCC to GC'},...%132
                           {'Flux of Dynein R  with coat B';'from TNG to CBC'},     {'Flux of Dynein R  with coat B';'from CBC to NSC'},     {'Flux of Dynein R  with coat B';'from NSC to GCC'},     {'Flux of Dynein R  with coat B';'from GCC to GC'},...%136
                           {'Flux of Dynein R with coat A';'from CBC to TGN'},      {'Flux of Dynein R with coat A';'from NSC to CBC'},      {'Flux of Dynein R with coat A';'from GCC to NSC'},      {'Flux of Dynein R with coat A';'from GC to GCC'},...%140   
                           {'Flux of Dynein R with coat B';'from CBC to TGN'},      {'Flux of Dynein R with coat B';'from NSC to CBC'},      {'Flux of Dynein R with coat B';'from GCC to NSC'},      {'Flux of Dynein R with coat B';'from GC to GCC'}};%144






                
    
b1_color = [255/255 130/255 0]; % orange
a1_color = [255/255 130/255 0]; % orange
b2_color = [0/255 100/255 200/255]; % blue
a2_color = [0/255 100/255 200/255]; % blue
b1_lineStyle = '-';
a1_lineStyle = ':';
a2_lineStyle = '-';
b2_lineStyle = ':';

 Output_fluxes_colors =    [ a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%                             
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%                          
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color;...%                          
                             a1_color;a1_color;a1_color;a1_color;...%
                             b1_color;b1_color;b1_color;b1_color;...%
                             a2_color;a2_color;a2_color;a2_color;...%
                             b2_color;b2_color;b2_color;b2_color];%
                             
 Output_fluxes_lineStyles =    { a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%                             
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%                          
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle;...%                          
                             a1_lineStyle;a1_lineStyle;a1_lineStyle;a1_lineStyle;...%
                             b1_lineStyle;b1_lineStyle;b1_lineStyle;b1_lineStyle;...%
                             a2_lineStyle;a2_lineStyle;a2_lineStyle;a2_lineStyle;...%
                             b2_lineStyle;b2_lineStyle;b2_lineStyle;b2_lineStyle};%

                         
                         

 t_for_fluxes = Output_time;
 length_fluxes = length(Output_fluxes_names(1,:));
 fontSize = 20;
 LineWidth = 3;
 
 multiplot.Max_rows = 4;
 multiplot.Max_cols = 4;
 multiplot.Max_subplots = multiplot.Max_rows * multiplot.Max_cols;
 multiplot.Index = multiplot.Max_subplots;
 
 figure_label = 'Suppl Fig 3 fluxes';
 figure_sublabels = 'A':'Z';
 indexSubfigure = 0;
 
 for indexFlux=1:length_fluxes
     multiplot.Index = multiplot.Index + 1;
     if (multiplot.Index > multiplot.Max_subplots)
        multiplot.Index = 1;
        figure;
     end
     subplot(multiplot.Max_rows, multiplot.Max_cols, multiplot.Index)
     plot(t_for_fluxes,Output_fluxes(:,indexFlux),'Color',Output_fluxes_colors(indexFlux,:),'lineStyle',char(Output_fluxes_lineStyles(indexFlux)),'LineWidth',LineWidth);
     ylim([0 max(Output_fluxes(:,indexFlux))*1.1]);
     xlim(tspan);
     title(Output_fluxes_names{indexFlux});
     
      %  cor_factor = figureColumns * figureRows - (statevar_plotIndexes(indexStatevar) - first_index_current_figure + 1);
        
      %  text('units','pixels','position',[-31 -12],'fontsize',30,'string','time [min]');
      %  text('units','pixels','position',[-70-cor_factor*20 21],'fontsize',25,'string',{'surface [\mum^2]   or   vesicles [#]'},'rotation',90);

    if (  (multiplot.Index == multiplot.Max_subplots)...
        ||(indexFlux == length_fluxes))
        indexSubfigure = indexSubfigure + 1;
        set(gcf,'PaperUnits','inches','PaperPosition',[0 0 3.3*multiplot.Max_cols 2*multiplot.Max_rows])
        print([figure_label figure_sublabels(indexSubfigure)],'-dpng','-r600');
    end
  end
     
%  plot(Output(:,1),Output(:,7) ,'.-','lineStyle',[153/255 0 0.3],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,8),'.-','lineStyle',[0 0 0],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,9),'.-','lineStyle',[1 0 0],'LineWidth',LineWidth);
% %%xlabel('time (Sec)'); ylabel('flux ');
%  title('Flux between G & CG ')
%  legend(strcat('B1-G-into-CBC: ',num2str(b1_flux_G_to_CG)),strcat('B1-CBC-into-G: ',num2str(b1_flux_CG_to_G)),strcat('B1-CBC-into-MTU: ',num2str(b1_flux_CG_to_MTU)))
%  %legend('Location','Northeast')
%  set(gca,'FontSize',fontSize);
%  xlabel('Time (Min)','FontSize',fontSize);
%  ylabel('Flux (AU)','FontSize',fontSize);
%  axis([0,max(Output(:,1)),0,ymax])
%  
%   subplot(2,2,2)
%   plot(Output(:,1),Output(:,10),'.-','lineStyle',[200/255 100/255 0/255],'LineWidth',LineWidth);
%   hold on;
%   plot(Output(:,1),Output(:,11),'.-','lineStyle',[1 150/255 50/255],'LineWidth',LineWidth);
%   %xlabel('time (Sec)'); ylabel('flux ');
%   title('Flux between MTU & NTC')
%   legend(strcat('B1-MTU-into-CPM: ',num2str(b1_flux_MTU_to_CPM)),strcat('B1-CPM-into-PM: ',num2str(b1_flux_CPM_to_PM)))
%   legend('Location','Northeast')
%   set(gca,'FontSize',fontSize);
%    xlabel('Time (Min)','FontSize',fontSize);
%   ylabel('Flux (AU)','FontSize',fontSize);
%   axis([0,max(Output(:,1)),0,ymax])
%  
%  
%  subplot(2,2,3)
%              
%  plot(Output(:,1),Output(:,12),'.-','lineStyle',[0 0 200/255],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,13),'.-','lineStyle',[0 0 0],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,14),'.-','lineStyle',[100/255 50/255 200/255],'LineWidth',LineWidth);
%  %xlabel('time (Sec)'); ylabel('flux ');
%  title('Flux between PM & NTC ')
% legend(strcat('a2-PM-into-CPM: ',num2str(a2_flux_PM_to_CPM)),strcat('a2-CPM-into-PM: ',num2str(a2_flux_CPM_to_PM)),strcat('a2-CPM-into-MTU: ',num2str(a2_flux_CPM_to_MTU)))
%  %legend('Location','Northeast')
%  set(gca,'FontSize',fontSize);
%   xlabel('Time (Min)','FontSize',fontSize);
%  ylabel('Flux (AU)','FontSize',fontSize);
%  axis([0,max(Output(:,1)),0,ymax])
%      
%      
%      
% 
%   index = 0;   
%   index = index + 1;
%  
%  G_into_CC = Output(:,index);
%  b1_flux_G_to_CG = G_into_CC;
% 
%  index = index + 1;
%  CG_into_G = Output(:,8);
%  b1_flux_CG_to_G = CG_into_G;
%  
%      
%  index = index + 1;
%  CG_into_MTU = Output(:,index);
%  b1_flux_CG_to_MTU = CG_into_MTU;
%  
%  index = index + 1;
%  MTU_into_CPM = Output(:,index);
%  b1_flux_MTU_to_CPM = MTU_into_CPM;
%  
%  index = index + 1;
%  CPM_into_PM = Output(:,index);
%  b1_flux_CPM_to_PM = CPM_into_PM;
%  
%  index = index + 1;
%  PM_into_CPM = Output(:,index);
%  a2_flux_PM_to_CPM = PM_into_CPM;
%  
%  index = index + 1;
%  CPM_into_PM = Output(:,index);
%  a2_flux_CPM_to_PM = CPM_into_PM;
%  
%  index = index + 1;
%  CPM_into_MTU = Output(:,index);
%  a2_flux_CPM_to_MTU = CPM_into_MTU;
%  
%  index = index + 1;
%  MTU_into_CG = Output(:,index);
%  a2_flux_MTU_to_CG = MTU_into_CG;
%  
%  index = index + 1;
%  CG_into_G = Output(:,index);
%  a2_flux_CG_to_G = CG_into_G;
% 
%  
%  index = index + 1;
%  xx_a1_g_into_cg = Output(:,index);
%  index = index +1;
%  xx_a1_cg_into_g = Output(:,index);
%  index = index +1;
%  xx_a1_cg_into_mtc = Output(:,index);
%  index = index +1;
%  xx_a1_mtc_into_cpm = Output(:,index);
%  index = index +1;
%  xx_a1_cpm_into_pm = Output(:,index);
%  index = index +1;
%  xx_b1_g_into_cg = Output(:,index);
%  index = index +1;
%  xx_b1_cg_into_g = Output(:,index);
%  index = index +1;
%  xx_b1_cg_into_mtc = Output(:,index);
%  index = index +1;
%  xx_b1_mtc_into_cpm = Output(:,index);
%  index = index +1;
%  xx_b1_cpm_into_pm = Output(:,index);
%  index = index +1;
%  xx_a2_pm_into_cpm = Output(:,index);
%  index = index +1;
%  xx_a2_cpm_into_pm = Output(:,index);
%  index = index +1;
%  xx_a2_cpm_into_mtc = Output(:,index);
%  index = index +1;
%  xx_a2_mtc_into_cg = Output(:,index);
%  index = index +1;
%  xx_a2_cg_into_g = Output(:,index);
%  index = index +1;                          
%  xx_b2_pm_into_cpm = Output(:,index);
%  index = index +1;
%  xx_b2_cpm_into_pm = Output(:,index);
%  index = index +1;
%  xx_b2_cpm_into_mtc = Output(:,index);
%  index = index +1;
%  xx_b2_mtc_into_cg = Output(:,index);
%  index = index +1;
%  xx_b2_cg_into_g = Output(:,index);
%  index = index +1;                     
%  uu_a1_g_into_cg = Output(:,index);
%  index = index +1;
%  uu_a1_cg_into_g = Output(:,index);index = index +1;
%  uu_a1_cg_into_mtc = Output(:,index);index = index +1;
%  uu_a1_mtc_into_cpm = Output(:,index);index = index +1;
%  uu_a1_cpm_into_pm = Output(:,index);index = index +1;
%  uu_b1_g_into_cg = Output(:,index);index = index +1;
%  uu_b1_cg_into_g = Output(:,index);index = index +1;
%  uu_b1_cg_into_mtc = Output(:,index);index = index +1;
%  uu_b1_mtc_into_cpm = Output(:,index);index = index +1;
%  uu_b1_cpm_into_pm = Output(:,index);index = index +1;
%  uu_a2_pm_into_cpm = Output(:,index);index = index +1;
%  uu_a2_cpm_into_pm = Output(:,index);index = index +1;
%  uu_a2_cpm_into_mtc = Output(:,index);index = index +1;
%  uu_a2_mtc_into_cg = Output(:,index);index = index +1;
%  uu_a2_cg_into_g = Output(:,index);index = index +1;                          
%  uu_b2_pm_into_cpm = Output(:,index);index = index +1;
%  uu_b2_cpm_into_pm = Output(:,index);index = index +1;
%  uu_b2_cpm_into_mtc = Output(:,index);index = index +1;
%  uu_b2_mtc_into_cg = Output(:,index);index = index +1;
%  uu_b2_cg_into_g = Output(:,index);index = index +1;
%  yy_a1_g_into_cg = Output(:,index);index = index +1;
%  yy_a1_cg_into_g = Output(:,index);index = index +1;
%  yy_a1_cg_into_mtc = Output(:,index);index = index +1;
%  yy_a1_mtc_into_cpm = Output(:,index);index = index +1;
%  yy_a1_cpm_into_pm = Output(:,index);index = index +1;
%  yy_b1_g_into_cg = Output(:,index);index = index +1;
%  yy_b1_cg_into_g = Output(:,index);index = index +1;
%  yy_b1_cg_into_mtc = Output(:,index);index = index +1;
%  yy_b1_mtc_into_cpm = Output(:,index);index = index +1;
%  yy_b1_cpm_into_pm = Output(:,index);index = index +1;
%  yy_a2_pm_into_cpm = Output(:,index);index = index +1;
%  yy_a2_cpm_into_pm = Output(:,index);index = index +1;
%  yy_a2_cpm_into_mtc = Output(:,index);index = index +1;
%  yy_a2_mtc_into_cg = Output(:,index);index = index +1;
%  yy_a2_cg_into_g = Output(:,index);index = index +1;                          
%  yy_b2_pm_into_cpm = Output(:,index);index = index +1;
%  yy_b2_cpm_into_pm = Output(:,index);index = index +1;
%  yy_b2_cpm_into_mtc = Output(:,index);index = index +1;
%  yy_b2_mtc_into_cg = Output(:,index);index = index +1;
%  yy_b2_cg_into_g = Output(:,index);index = index +1;
%  vv_a1_g_into_cg = Output(:,index);index = index +1;
%  vv_a1_cg_into_g = Output(:,index);index = index +1;  
%  vv_a1_cg_into_mtc = Output(:,index);index = index +1;   
%  vv_a1_mtc_into_cpm = Output(:,index);index = index +1; 
%  vv_a1_cpm_into_pm = Output(:,index);index = index +1;
%  vv_b1_g_into_cg = Output(:,index);index = index +1; 
%  vv_b1_cg_into_g = Output(:,index);index = index +1;  
%  vv_b1_cg_into_mtc = Output(:,index);index = index +1;   
%  vv_b1_mtc_into_cpm = Output(:,index);index = index +1; 
%  vv_b1_cpm_into_pm = Output(:,index);index = index +1;
%  vv_a2_pm_into_cpm = Output(:,index);index = index +1;
%  vv_a2_cpm_into_pm = Output(:,index);index = index +1;
%  vv_a2_cpm_into_mtc = Output(:,index);index = index +1;  
%  vv_a2_mtc_into_cg = Output(:,index);index = index +1;  
%  vv_a2_cg_into_g = Output(:,index);index = index +1;                          
%  vv_b2_pm_into_cpm = Output(:,index);index = index +1;
%  vv_b2_cpm_into_pm = Output(:,index);index = index +1;
%  vv_b2_cpm_into_mtc = Output(:,index);index = index +1;  
%  vv_b2_mtc_into_cg = Output(:,index);index = index +1;   
%  vv_b2_cg_into_g = Output(:,index);index = index +1;
%  cc1_a1_g_into_cg = Output(:,index);index = index +1;  
%  cc1_a1_cg_into_g = Output(:,index);index = index +1;  
%  cc1_a1_cg_into_mtc = Output(:,index);index = index +1;   
%  cc1_a1_mtc_into_cpm = Output(:,index);index = index +1; 
%  cc1_a1_cpm_into_pm = Output(:,index);index = index +1;
%  cc1_b1_g_into_cg = Output(:,index);index = index +1;  
%  cc1_b1_cg_into_g = Output(:,index);index = index +1;  
%  cc1_b1_cg_into_mtc = Output(:,index);index = index +1;   
%  cc1_b1_mtc_into_cpm = Output(:,index);index = index +1; 
%  cc1_b1_cpm_into_pm = Output(:,index);index = index +1;
%  cc1_a2_pm_into_cpm = Output(:,index);index = index +1;
%  cc1_a2_cpm_into_pm = Output(:,index);index = index +1;
%  cc1_a2_cpm_into_mtc = Output(:,index);index = index +1;  
%  cc1_a2_mtc_into_cg = Output(:,index);index = index +1;  
%  cc1_a2_cg_into_g = Output(:,index);index = index +1;                          
%  cc1_b2_pm_into_cpm = Output(:,index);index = index +1;
%  cc1_b2_cpm_into_pm = Output(:,index);index = index +1;
%  cc1_b2_cpm_into_mtc = Output(:,index);index = index +1;  
%  cc1_b2_mtc_into_cg = Output(:,index);index = index +1;   
%  cc1_b2_cg_into_g = Output(:,index);index = index +1;
%  cc2_a1_g_into_cg = Output(:,index);index = index +1; 
%  cc2_a1_cg_into_g = Output(:,index);index = index +1; 
%  cc2_a1_cg_into_mtc = Output(:,index);index = index +1;   
%  cc2_a1_mtc_into_cpm = Output(:,index);index = index +1; 
%  cc2_a1_cpm_into_pm = Output(:,index);index = index +1;
%  cc2_b1_g_into_cg = Output(:,index);index = index +1; 
%  cc2_b1_cg_into_g = Output(:,index);index = index +1;  
%  cc2_b1_cg_into_mtc = Output(:,index);index = index +1;   
%  cc2_b1_mtc_into_cpm = Output(:,index);index = index +1; 
%  cc2_b1_cpm_into_pm = Output(:,index);index = index +1;
%  cc2_a2_pm_into_cpm = Output(:,index);index = index +1;
%  cc2_a2_cpm_into_pm = Output(:,index);index = index +1;
%  cc2_a2_cpm_into_mtc = Output(:,index);index = index +1;  
%  cc2_a2_mtc_into_cg = Output(:,index);index = index +1;  
%  cc2_a2_cg_into_g = Output(:,index);index = index +1;                          
%  cc2_b2_pm_into_cpm = Output(:,index);index = index +1;
%  cc2_b2_cpm_into_pm = Output(:,index);index = index +1;
%  cc2_b2_cpm_into_mtc = Output(:,index);index = index +1;  
%  cc2_b2_mtc_into_cg = Output(:,index);index = index +1;   
%  cc2_b2_cg_into_g = Output(:,index);index = index +1;
%  kk_a1_g_into_cg = Output(:,index);index = index +1;  
%  kk_a1_cg_into_g = Output(:,index);index = index +1;  
%  kk_a1_cg_into_mtc = Output(:,index);index = index +1;   
%  kk_a1_mtc_into_cpm = Output(:,index);index = index +1; 
%  kk_a1_cpm_into_pm = Output(:,index);index = index +1;
%  kk_b1_g_into_cg = Output(:,index);index = index +1;  
%  kk_b1_cg_into_g = Output(:,index);index = index +1;  
%  kk_b1_cg_into_mtc = Output(:,index);index = index +1;   
%  kk_b1_mtc_into_cpm = Output(:,index);index = index +1;
%  kk_b1_cpm_into_pm = Output(:,index);index = index +1;
%  kk_a2_pm_into_cpm = Output(:,index);index = index +1;
%  kk_a2_cpm_into_pm = Output(:,index);index = index +1;
%  kk_a2_cpm_into_mtc = Output(:,index);index = index +1;  
%  kk_a2_mtc_into_cg = Output(:,index);index = index +1;  
%  kk_a2_cg_into_g = Output(:,index);index = index +1;                          
%  kk_b2_pm_into_cpm = Output(:,index);index = index +1;
%  kk_b2_cpm_into_pm = Output(:,index);index = index +1;
%  kk_b2_cpm_into_mtc = Output(:,index);index = index +1;  
%  kk_b2_mtc_into_cg = Output(:,index);index = index +1;  
%  kk_b2_cg_into_g = Output(:,index);index = index +1;
%  dd_a1_g_into_cg = Output(:,index);index = index +1;  
%  dd_a1_cg_into_g = Output(:,index);index = index +1;  
%  dd_a1_cg_into_mtc = Output(:,index);index = index +1;   
%  dd_a1_mtc_into_cpm = Output(:,index);index = index +1; 
%  dd_a1_cpm_into_pm = Output(:,index);index = index +1;
%  dd_b1_g_into_cg = Output(:,index);index = index +1;  
%  dd_b1_cg_into_g = Output(:,index);index = index +1;  
%  dd_b1_cg_into_mtc = Output(:,index);index = index +1;   
%  dd_b1_mtc_into_cpm = Output(:,index);index = index +1; 
%  dd_b1_cpm_into_pm = Output(:,index);index = index +1;
%  dd_a2_pm_into_cpm = Output(:,index);index = index +1;
%  dd_a2_cpm_into_pm = Output(:,index);index = index +1;
%  dd_a2_cpm_into_mtc = Output(:,index);index = index +1;  
%  dd_a2_mtc_into_cg = Output(:,index);index = index +1;  
%  dd_a2_cg_into_g = Output(:,index);index = index +1;                          
%  dd_b2_pm_into_cpm = Output(:,index);index = index +1;
%  dd_b2_cpm_into_pm = Output(:,index);index = index +1;
%  dd_b2_cpm_into_mtc = Output(:,index);index = index +1;  
%  dd_b2_mtc_into_cg = Output(:,index);index = index +1;  
%  dd_b2_cg_into_g = Output(:,index);index = index +1;           
%  velocity_a1_mtc_to_cpm = Output(:,index);index = index +1;
%  velocity_b1_mtc_to_cpm = Output(:,index);index = index +1;
%  velocity_a2_mtc_to_cg = Output(:,index);index = index +1; 
%  velocity_b2_mtc_to_cg = Output(:,index);index = index +1;          
%  dyn_MTs_length = Output(:,index);index = index +1;
%  stbl_MTs_length, MTU_length
%  
%  
%  
% 
%  flux1 = [b1_flux_G_to_CG, b1_flux_CG_to_G, b1_flux_CG_to_MTU, b1_flux_MTU_to_CPM,...
%           b1_flux_CPM_to_PM, a2_flux_PM_to_CPM, a2_flux_CPM_to_PM, a2_flux_CPM_to_MTU,...
%           a2_flux_MTU_to_CG, a2_flux_CG_to_G]; 
%       
%       fprintf('%d\n',flux1);
%       
% % 0.2623    0.0499    0.2125    0.2123    0.2123    0.8446    0.6710    0.1736    0.1734    0.1735
% %  0.4403    0.0664    0.3739    0.3714    0.3714    0.8455    0.6264    0.2191    0.2187    0.2187
% % 0.6752    0.0738    0.6013    0.5874    0.5871    0.8441    0.6122    0.2319    0.2308    0.2308
% % 0.8057    0.0666    0.7391    0.7113    0.7113    0.8424    0.6173    0.2252    0.2236    0.2236
% % 1.0225    0.0688    0.9537    0.8880    0.8880    0.8394    0.6336    0.2058    0.2035    0.2035
% % 1.3032    0.0626    1.2406    1.0712    1.0712    0.8350    0.6604    0.1746    0.1715    0.1715
% % 1.5873    0.0662    1.5211    1.1826    1.1826    0.8309    0.6837    0.1472    0.1434    0.1434
% 
% ymax = 2;
%  
% subplot(2,2,1)
% %  plot(Output(:,1),Output(:,7) ,'.-','lineStyle',[153/255 0 0.3],'LineWidth',LineWidth);
% %  hold on;
% %  plot(Output(:,1),Output(:,8),'.-','lineStyle',[0 0 0],'LineWidth',LineWidth);
% %  hold on;
% %  plot(Output(:,1),Output(:,9),'.-','lineStyle',[1 0 0],'LineWidth',LineWidth);
% % %%xlabel('time (Sec)'); ylabel('flux ');
% %  title('Flux between G & CG ')
% %  legend(strcat('B1-G-into-CC: ',num2str(b1_flux_G_to_CG)),strcat('B1-CG-into-G: ',num2str(b1_flux_CG_to_G)),strcat('B1-CG-into-MTU: ',num2str(b1_flux_CG_to_MTU)))
% %  %legend('Location','Northeast')
% %  set(gca,'FontSize',fontSize);
% %  xlabel('Time (Min)','FontSize',fontSize);
% %  ylabel('Flux (AU)','FontSize',fontSize);
% %  axis([0,max(Output(:,1)),0,ymax])
%  
% plot(Output(:,1),Output(:,7) ,'.-','lineStyle',[153/255 0 0.3],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,8),'.-','lineStyle',[0 0 0],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,9),'.-','lineStyle',[1 0 0],'LineWidth',LineWidth);
% %%xlabel('time (Sec)'); ylabel('flux ');
%  title('Flux between G & CG ')
%  legend(strcat('B1-G-into-CBC: ',num2str(b1_flux_G_to_CG)),strcat('B1-CBC-into-G: ',num2str(b1_flux_CG_to_G)),strcat('B1-CBC-into-MTU: ',num2str(b1_flux_CG_to_MTU)))
%  %legend('Location','Northeast')
%  set(gca,'FontSize',fontSize);
%  xlabel('Time (Min)','FontSize',fontSize);
%  ylabel('Flux (AU)','FontSize',fontSize);
%  axis([0,max(Output(:,1)),0,ymax])
%  
%   subplot(2,2,2)
%   plot(Output(:,1),Output(:,10),'.-','lineStyle',[200/255 100/255 0/255],'LineWidth',LineWidth);
%   hold on;
%   plot(Output(:,1),Output(:,11),'.-','lineStyle',[1 150/255 50/255],'LineWidth',LineWidth);
%   %xlabel('time (Sec)'); ylabel('flux ');
%   title('Flux between MTU & NTC')
%   legend(strcat('B1-MTU-into-CPM: ',num2str(b1_flux_MTU_to_CPM)),strcat('B1-CPM-into-PM: ',num2str(b1_flux_CPM_to_PM)))
%   legend('Location','Northeast')
%   set(gca,'FontSize',fontSize);
%    xlabel('Time (Min)','FontSize',fontSize);
%   ylabel('Flux (AU)','FontSize',fontSize);
%   axis([0,max(Output(:,1)),0,ymax])
%  
%  
%  subplot(2,2,3)
%              
%  plot(Output(:,1),Output(:,12),'.-','lineStyle',[0 0 200/255],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,13),'.-','lineStyle',[0 0 0],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,14),'.-','lineStyle',[100/255 50/255 200/255],'LineWidth',LineWidth);
%  %xlabel('time (Sec)'); ylabel('flux ');
%  title('Flux between PM & NTC ')
% legend(strcat('a2-PM-into-CPM: ',num2str(a2_flux_PM_to_CPM)),strcat('a2-CPM-into-PM: ',num2str(a2_flux_CPM_to_PM)),strcat('a2-CPM-into-MTU: ',num2str(a2_flux_CPM_to_MTU)))
%  %legend('Location','Northeast')
%  set(gca,'FontSize',fontSize);
%   xlabel('Time (Min)','FontSize',fontSize);
%  ylabel('Flux (AU)','FontSize',fontSize);
%  axis([0,max(Output(:,1)),0,ymax])
% 
%  
%  subplot(2,2,4)
%  plot(Output(:,1),Output(:,15),'.-','lineStyle',[0/255 130/255 255/255],'LineWidth',LineWidth);
%  hold on;
%  plot(Output(:,1),Output(:,16),'.-','lineStyle',[150/255 255/255 200/255],'LineWidth',LineWidth);
%  %xlabel('time (Sec)'); ylabel('flux ');
%  title('Flux between MTU & CG')
% legend(strcat('a2-MTU-into-CG: ',num2str(a2_flux_MTU_to_CG)),strcat('a2-CG-into-G: ',num2str(a2_flux_CG_to_G)))
%  %legend('Location','Northeast')
%  set(gca,'FontSize',fontSize);
%  xlabel('Time (Min)','FontSize',fontSize);
%  ylabel('Flux (AU)','FontSize',fontSize);
%   axis([0,max(Output(:,1)),0,ymax])
%   
%   
%   
%   
% % %   
% % % 
% % % figure(3);
% % % axis_fontSize = 15;
% % % xlabel_text = 'time [min]';
% % % ylabel_text = 'length [uM]';
% % % 
% % % 
% % % plot(Output(:,1),Output(:,18), '.-b','LineWidth',2)
% % % hold on;
% % % plot(Output(:,1),Output(:,19), '.-r','LineWidth',2);
% % % hold on;
% % % plot(Output(:,1),Output(:,20), '-g','LineWidth',2);
% % % xlabel(xlabel_text); 
% % % ylabel(ylabel_text);
% % % ylim(max(Output(:,20))+5);
% % % title('Microtubule Dynamics')
% % % %legend('Neurite length','dynamic MT length');
% % % % legend(strcat('Neurite length: steady state growth: ',num2str(velocity*60),'um/h'));
% % % set(gca,'FontSize',axis_fontSize);
% % % legend('Location','Northeast') 