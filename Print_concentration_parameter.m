complete_conc_file_name = strcat('C:\Users\yadawa01\Desktop\Cell_system_02092018\yadaw_at_al_Matlab_files\current_simulation_initial_conc.txt');

fid = fopen(complete_conc_file_name,'wt');

length_statevar = length(statevar_timelines(1,:));

fprintf(fid,'Matlab name');
fprintf(fid,'\t'); 
fprintf(fid,'Figure name');
fprintf(fid,'\t'); 
fprintf(fid,'Description');
fprintf(fid,'\t'); 
fprintf(fid,'Initial value');
fprintf(fid,'\t'); 
fprintf(fid,'unit');
fprintf(fid,'\n'); 

for indexStatevar = 1:length_statevar
    fprintf(fid,char(statevar_names{indexStatevar}));
    fprintf(fid,'\t'); 
    fprintf(fid,char(statevar_figure_names{indexStatevar}));
    fprintf(fid,'\t'); 
    fprintf(fid,char(statevar_explaination{indexStatevar}));
    fprintf(fid,'\t'); 
    fprintf(fid,num2str(statevar_timelines(1,indexStatevar)));
    fprintf(fid,'\t'); 
    %fprintf(fid,char(statevar_unit{indexStatevar}));
    fprintf(fid,'\n'); 
end

fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

complete_para_file_name = strcat('C:\Users\yadawa01\Desktop\Cell_system_02092018\yadaw_at_al_Matlab_files\current_simulation_parameter.txt');

fid = fopen(complete_para_file_name,'wt');

length_parameter = length(parameters);

fprintf(fid,'Matlab name');
fprintf(fid,'\t'); 
fprintf(fid,'Description');
fprintf(fid,'\t'); 
fprintf(fid,'Value');
fprintf(fid,'\t'); 
fprintf(fid,'unit');
fprintf(fid,'\n'); 

for indexParameter = 1:length_parameter
    fprintf(fid,char(parameter_names{indexParameter}));
    fprintf(fid,'\t'); 
    %fprintf(fid,char(parameter_explanation{indexParameter}));
    fprintf(fid,'\t'); 
    fprintf(fid,num2str(parameters(indexParameter)));
    fprintf(fid,'\t'); 
    fprintf(fid,'\t'); 
    fprintf(fid,'\n'); 
end

fclose(fid);
