%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Forward vesicle movement g <-- cg --> MTU %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Calculate number of vesicles and motors per vesicle
vnb1_cg = nb1_cg / antero_vesicle_surface_area;
vna1_cg = na1_cg / antero_vesicle_surface_area;

k_per_vesicle_a1_cg = kk_a1_cg / vna1_cg;
k_per_vesicle_b1_cg = kk_b1_cg / vnb1_cg;

%%%%Calculate fraction of bound vesicles
fraction_bound_na1_cg = 1 - (1 - fraction_bound_kk_a1b1_cg)^k_per_vesicle_a1_cg;
fraction_bound_nb1_cg = 1 - (1 - fraction_bound_kk_a1b1_cg)^k_per_vesicle_b1_cg;
%fraction_bound_na1_cg = fraction_bound_kk_a1b1_cg * k_per_vesicle_a1_cg;
%fraction_bound_nb1_cg = fraction_bound_kk_a1b1_cg * k_per_vesicle_b1_cg;

%%%%Calculate fluxes along microtubule
frequency_a1b1_cg_to_mtc = velocity_k / MTU_in_cg_length; 
a1_cg_into_mtc = na1_cg * frequency_a1b1_cg_to_mtc * fraction_bound_na1_cg;
b1_cg_into_mtc = nb1_cg * frequency_a1b1_cg_to_mtc * fraction_bound_nb1_cg;

%%Calculate backward fluxes
%snareYVcomplexes_a1_cg_g = (kappaYV_g * yy_a1_cg * vv_g   + kappaYV_g * vv_a1_cg * yy_g) * (1-fraction_bound_na1_cg);
%snareXUcomplexes_a1_cg_g = (kappaXU_g * xx_a1_cg * uu_g   + kappaXU_g * uu_a1_cg * xx_g) * (1-fraction_bound_na1_cg);
%snareYVcomplexes_b1_cg_g = (kappaYV_g * yy_b1_cg * vv_g   + kappaYV_g * vv_b1_cg * yy_g) * (1-fraction_bound_nb1_cg);
%snareXUcomplexes_b1_cg_g = (kappaXU_g * xx_b1_cg * uu_g   + kappaXU_g * uu_b1_cg * xx_g) * (1-fraction_bound_nb1_cg);


a1_cg_into_g = 0;%  (snareXUcomplexes_a1_cg_g + snareYVcomplexes_a1_cg_g) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;;
b1_cg_into_g = 0;%  (snareXUcomplexes_b1_cg_g + snareYVcomplexes_b1_cg_g) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Forward vesicle movement MTU --> cpm %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Calculate number of vesicles and motors per vesicle
vnb1_mtc = nb1_mtc / antero_vesicle_surface_area;
vna1_mtc = na1_mtc / antero_vesicle_surface_area;

k_per_vesicle_a1_mtc = kk_a1_mtc / vna1_mtc;
k_per_vesicle_b1_mtc = kk_b1_mtc / vnb1_mtc;

%%%%Calculate fraction of bound vesicles
fraction_bound_na1_mtc = 1 - (1-fraction_bound_kk_a1b1_mtc)^k_per_vesicle_a1_mtc;
fraction_bound_nb1_mtc = 1 - (1-fraction_bound_kk_a1b1_mtc)^k_per_vesicle_b1_mtc;
%fraction_bound_na1_mtc = fraction_bound_kk_a1b1_mtc * k_per_vesicle_a1_mtc;
%fraction_bound_nb1_mtc = fraction_bound_kk_a1b1_mtc * k_per_vesicle_b1_mtc;

%%%%Calculate fluxes along microtubule
frequency_a1b1_mtc_to_cpm = velocity_k / MTU_length_app; 
a1_mtc_into_cpm = na1_mtc * frequency_a1b1_mtc_to_cpm * fraction_bound_na1_mtc;
b1_mtc_into_cpm = nb1_mtc * frequency_a1b1_mtc_to_cpm * fraction_bound_nb1_mtc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Forward vesicle movement cpm -> pm %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Calculate number of vesicles and motors per vesicle
vna1_cpm = na1_cpm / antero_vesicle_surface_area;
vnb1_cpm = nb1_cpm / antero_vesicle_surface_area;

k_per_vesicle_a1_cpm = kk_a1_cpm / vna1_cpm;
k_per_vesicle_b1_cpm = kk_b1_cpm / vnb1_cpm;

%%%%Calculate fraction of bound vesicles
fraction_bound_na1_cpm = 1 - (1-fraction_bound_kk_a1b1_cpm)^k_per_vesicle_a1_cpm;
fraction_bound_nb1_cpm = 1 - (1-fraction_bound_kk_a1b1_cpm)^k_per_vesicle_b1_cpm;
%fraction_bound_na1_cpm = fraction_bound_kk_a1b1_cpm * k_per_vesicle_a1_cpm;
%fraction_bound_nb1_cpm = fraction_bound_kk_a1b1_cpm * k_per_vesicle_b1_cpm;

%%%%Calculate forward fusion
snareYVcomplexes_a1_cpm_pm = (kappaYV_pm * yy_a1_cpm * vv_pm + kappaYV_pm * vv_a1_cpm * yy_pm) * (1-fraction_bound_na1_cpm);
snareXUcomplexes_a1_cpm_pm = (kappaXU_pm * xx_a1_cpm * uu_pm + kappaXU_pm * uu_a1_cpm * xx_pm) * (1-fraction_bound_na1_cpm);
a1_cpm_into_pm =   (snareXUcomplexes_a1_cpm_pm + snareYVcomplexes_a1_cpm_pm) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion; 

snareYVcomplexes_b1_cpm_pm = (kappaYV_pm * yy_b1_cpm * vv_pm + kappaYV_pm * vv_b1_cpm * yy_pm) * (1-fraction_bound_nb1_cpm);
snareXUcomplexes_b1_cpm_pm = (kappaXU_pm * xx_b1_cpm * uu_pm + kappaXU_pm * uu_b1_cpm * xx_pm) * (1-fraction_bound_nb1_cpm);
b1_cpm_into_pm =   (snareYVcomplexes_b1_cpm_pm + snareXUcomplexes_b1_cpm_pm) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Backward vesicle movement pm <-- cpm --> MTU %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Calculate number of vesicles and motors per vesicle
vnb2_cpm = nb2_cpm / retro_vesicle_surface_area;
vna2_cpm = na2_cpm / retro_vesicle_surface_area;

d_per_vesicle_a2_cpm = dd_a2_cpm / vna2_cpm;
d_per_vesicle_b2_cpm = dd_b2_cpm / vnb2_cpm;

%%%%Calculate fraction of bound vesicles
fraction_bound_na2_cpm = 1 - (1 - fraction_bound_dd_a2b2_cpm)^d_per_vesicle_a2_cpm;
fraction_bound_nb2_cpm = 1 - (1 - fraction_bound_dd_a2b2_cpm)^d_per_vesicle_b2_cpm;
%fraction_bound_na2_cpm = fraction_bound_dd_a2b2_cpm * d_per_vesicle_a2_cpm;
%fraction_bound_nb2_cpm = fraction_bound_dd_a2b2_cpm * d_per_vesicle_b2_cpm;



%%%%Calculate fluxes along microtubule
frequency_a2b2_cpm_to_mtc = velocity_d / (MTU_in_cpm_length); 
a2_cpm_into_mtc = na2_cpm * frequency_a2b2_cpm_to_mtc * fraction_bound_na2_cpm;
b2_cpm_into_mtc = nb2_cpm * frequency_a2b2_cpm_to_mtc * fraction_bound_nb2_cpm;
             
%%Calculate backward fluxes
snareYVcomplexes_a2_cpm_pm = (kappaYV_pm * yy_a2_cpm * vv_pm + kappaYV_pm * vv_a2_cpm * yy_pm) * (1-fraction_bound_na2_cpm);
snareXUcomplexes_a2_cpm_pm = (kappaXU_pm * xx_a2_cpm * uu_pm + kappaXU_pm * uu_a2_cpm * xx_pm) * (1-fraction_bound_na2_cpm);
a2_cpm_into_pm = 0;%  (snareXUcomplexes_a2_cpm_pm + snareYVcomplexes_a2_cpm_pm) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;;
                 
snareYVcomplexes_b2_cpm_pm = (kappaYV_pm * yy_b2_cpm * vv_pm + kappaYV_pm * vv_b2_cpm * yy_pm) * (1-fraction_bound_nb2_cpm);
snareXUcomplexes_b2_cpm_pm = (kappaXU_pm * xx_b2_cpm * uu_pm + kappaXU_pm * uu_b2_cpm * xx_pm) * (1-fraction_bound_nb2_cpm);
b2_cpm_into_pm = 0;%  (snareXUcomplexes_b2_cpm_pm + snareYVcomplexes_b2_cpm_pm) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;;
                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Backward vesicle movement in MTU --> cg %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Calculate number of vesicles and motors per vesicle
vnb2_mtc = nb2_mtc / retro_vesicle_surface_area;
vna2_mtc = na2_mtc / retro_vesicle_surface_area;

d_per_vesicle_a2_mtc = dd_a2_mtc / vna2_mtc;
d_per_vesicle_b2_mtc = dd_b2_mtc / vnb2_mtc;

%%%%Calculate fraction of bound vesicles
fraction_bound_na2_mtc = 1 - (1-fraction_bound_dd_a2b2_mtc)^d_per_vesicle_a2_mtc;
fraction_bound_nb2_mtc = 1 - (1-fraction_bound_dd_a2b2_mtc)^d_per_vesicle_b2_mtc;
%fraction_bound_na2_mtc = fraction_bound_dd_a2b2_mtc * d_per_vesicle_a2_mtc;
%fraction_bound_nb2_mtc = fraction_bound_dd_a2b2_mtc * d_per_vesicle_b2_mtc;

%%%%Calculate fluxes along microtubule
frequency_a2b2_mtc_to_cg = velocity_d / (MTU_length_app); 
a2_mtc_into_cg = na2_mtc * frequency_a2b2_mtc_to_cg * fraction_bound_na2_mtc;
b2_mtc_into_cg = nb2_mtc * frequency_a2b2_mtc_to_cg * fraction_bound_nb2_mtc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Backward vesicle movement cg --> g %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Calculate number of vesicles and motors per vesicle
vnb2_cg = nb2_cg / retro_vesicle_surface_area;
vna2_cg = na2_cg / retro_vesicle_surface_area;

d_per_vesicle_a2_cg = dd_a2_cg / vna2_cg;
d_per_vesicle_b2_cg = dd_b2_cg / vnb2_cg;

%%%%Calculate fraction of bound vesicles
fraction_bound_na2_cg = 1 - (1 - fraction_bound_dd_a2b2_cg)^d_per_vesicle_a2_cg;
fraction_bound_nb2_cg = 1 - (1 - fraction_bound_dd_a2b2_cg)^d_per_vesicle_b2_cg;
%fraction_bound_na2_cg = fraction_bound_dd_a2b2_cg * d_per_vesicle_a2_cg;
%fraction_bound_nb2_cg = fraction_bound_dd_a2b2_cg * d_per_vesicle_b2_cg;

%%%%Calculate forward fusion
snareYVcomplexes_a2_cg_g = (kappaYV_g * yy_a2_cg * vv_g + kappaYV_g * vv_a2_cg * yy_g) * (1-fraction_bound_na2_cg);
%snareXUcomplexes_a2_cg_g = (kappaXU_g * xx_a2_cg * uu_g + kappaXU_g * uu_a2_cg * xx_g) * (1-fraction_bound_na2_cg);
snareXUcomplexes_a2_cg_g = (kappaXU_g * uu_a2_cg * xx_g) * (1-fraction_bound_na2_cg);
a2_cg_into_g   =   (snareYVcomplexes_a2_cg_g + snareXUcomplexes_a2_cg_g) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;

snareYVcomplexes_b2_cg_g = (kappaYV_g * yy_b2_cg * vv_g + kappaYV_g * vv_b2_cg * yy_g) * (1-fraction_bound_nb2_cg);
snareXUcomplexes_b2_cg_g = (kappaXU_g * xx_b2_cg * uu_g + kappaXU_g * uu_b2_cg * xx_g) * (1-fraction_bound_nb2_cg);
b2_cg_into_g   =   (snareYVcomplexes_b2_cg_g + snareXUcomplexes_b2_cg_g) * antero_vesicle_surface_area/snare_complexes_per_vesicle_fusion;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% vesicle movements %%%%%%%%%%%%%%%%%%%%%%%%%

%vesicle budding at golgi and plasma membrane
a1_g_into_cg   = wa_g * cc2_g * sg;
b1_g_into_cg   = wb_g * cc1_g * sg;

a2_pm_into_cpm = wa_pm * cc2_pm * spm;
b2_pm_into_cpm = wb_pm * cc1_pm * spm;
