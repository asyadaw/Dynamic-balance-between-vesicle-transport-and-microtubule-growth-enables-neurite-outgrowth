%Golgi budded vesicles - Fluxes for budding from Golgi to golgi_cytosol
xx_a1_g_into_cg = a1_g_into_cg * sxa1;
xx_b1_g_into_cg = b1_g_into_cg * sxb1;
uu_a1_g_into_cg = a1_g_into_cg * sua1;
uu_b1_g_into_cg = b1_g_into_cg * sub1;
yy_a1_g_into_cg = a1_g_into_cg * sya1;
yy_b1_g_into_cg = b1_g_into_cg * syb1;
vv_a1_g_into_cg = a1_g_into_cg * sva1;
vv_b1_g_into_cg = b1_g_into_cg * svb1;

cc1_a1_g_into_cg = a1_g_into_cg * sc1a1;
cc1_b1_g_into_cg = b1_g_into_cg * sc1b1;         
cc2_a1_g_into_cg = a1_g_into_cg * sc2a1;
cc2_b1_g_into_cg = b1_g_into_cg * sc2b1;   

kk_a1_g_into_cg = a1_g_into_cg * ska1;
kk_b1_g_into_cg = b1_g_into_cg * skb1;        
dd_a1_g_into_cg = a1_g_into_cg * sda1;
dd_b1_g_into_cg = b1_g_into_cg * sdb1; 

%Golgi budded vesicles - Fluxes for backward fusion from cg into g
xx_a1_cg_into_g = a1_cg_into_g * x_a1_cg;
xx_b1_cg_into_g = b1_cg_into_g * x_b1_cg;
uu_a1_cg_into_g = a1_cg_into_g * u_a1_cg;
uu_b1_cg_into_g = b1_cg_into_g * u_b1_cg;
yy_a1_cg_into_g = a1_cg_into_g * y_a1_cg;
yy_b1_cg_into_g = b1_cg_into_g * y_b1_cg;
vv_a1_cg_into_g = a1_cg_into_g * v_a1_cg;
vv_b1_cg_into_g = b1_cg_into_g * v_b1_cg;

cc1_a1_cg_into_g = a1_cg_into_g * c1_a1_cg;
cc1_b1_cg_into_g = b1_cg_into_g * c1_b1_cg;
cc2_a1_cg_into_g = a1_cg_into_g * c2_a1_cg;
cc2_b1_cg_into_g = b1_cg_into_g * c2_b1_cg;

dd_a1_cg_into_g = a1_cg_into_g * d_a1_cg;
dd_b1_cg_into_g = b1_cg_into_g * d_b1_cg;
kk_a1_cg_into_g = a1_cg_into_g * k_a1_cg;
kk_b1_cg_into_g = b1_cg_into_g * k_b1_cg;

%Golgi budded vesicles - Fluxes for forward fusion from cg to mtc
xx_a1_cg_into_mtc = a1_cg_into_mtc * x_a1_cg;
xx_b1_cg_into_mtc = b1_cg_into_mtc * x_b1_cg;
uu_a1_cg_into_mtc = a1_cg_into_mtc * u_a1_cg;
uu_b1_cg_into_mtc = b1_cg_into_mtc * u_b1_cg;
yy_a1_cg_into_mtc = a1_cg_into_mtc * y_a1_cg;
yy_b1_cg_into_mtc = b1_cg_into_mtc * y_b1_cg;
vv_a1_cg_into_mtc = a1_cg_into_mtc * v_a1_cg;
vv_b1_cg_into_mtc = b1_cg_into_mtc * v_b1_cg; 

cc1_a1_cg_into_mtc  = a1_cg_into_mtc * c1_a1_cg;
cc1_b1_cg_into_mtc  = b1_cg_into_mtc * c1_b1_cg;
cc2_a1_cg_into_mtc  = a1_cg_into_mtc * c2_a1_cg;
cc2_b1_cg_into_mtc  = b1_cg_into_mtc * c2_b1_cg;

kk_a1_cg_into_mtc = a1_cg_into_mtc * k_a1_cg;
kk_b1_cg_into_mtc = b1_cg_into_mtc * k_b1_cg;
dd_a1_cg_into_mtc = a1_cg_into_mtc * d_a1_cg;
dd_b1_cg_into_mtc = b1_cg_into_mtc * d_b1_cg;


%Golgi budded vesicles - Fluxes from mtc to cpm
xx_a1_mtc_into_cpm = a1_mtc_into_cpm * x_a1_mtc;
xx_b1_mtc_into_cpm = b1_mtc_into_cpm * x_b1_mtc;
uu_a1_mtc_into_cpm = a1_mtc_into_cpm * u_a1_mtc;
uu_b1_mtc_into_cpm = b1_mtc_into_cpm * u_b1_mtc;
yy_a1_mtc_into_cpm = a1_mtc_into_cpm * y_a1_mtc;
yy_b1_mtc_into_cpm = b1_mtc_into_cpm * y_b1_mtc;
vv_a1_mtc_into_cpm = a1_mtc_into_cpm * v_a1_mtc;
vv_b1_mtc_into_cpm = b1_mtc_into_cpm * v_b1_mtc; 

cc1_a1_mtc_into_cpm = a1_mtc_into_cpm * c1_a1_mtc;
cc1_b1_mtc_into_cpm = b1_mtc_into_cpm * c1_b1_mtc;
cc2_a1_mtc_into_cpm = a1_mtc_into_cpm * c2_a1_mtc;
cc2_b1_mtc_into_cpm = b1_mtc_into_cpm * c2_b1_mtc;

kk_a1_mtc_into_cpm = a1_mtc_into_cpm * k_a1_mtc;
kk_b1_mtc_into_cpm = b1_mtc_into_cpm * k_b1_mtc;
dd_a1_mtc_into_cpm = a1_mtc_into_cpm * d_a1_mtc;
dd_b1_mtc_into_cpm = b1_mtc_into_cpm * d_b1_mtc;

%Golgi budded vesicles - Fluxes from cpm to pm
xx_a1_cpm_into_pm = a1_cpm_into_pm * x_a1_cpm;
xx_b1_cpm_into_pm = b1_cpm_into_pm * x_b1_cpm;
uu_a1_cpm_into_pm = a1_cpm_into_pm * u_a1_cpm;
uu_b1_cpm_into_pm = b1_cpm_into_pm * u_b1_cpm;
yy_a1_cpm_into_pm = a1_cpm_into_pm * y_a1_cpm;
yy_b1_cpm_into_pm = b1_cpm_into_pm * y_b1_cpm;
vv_a1_cpm_into_pm = a1_cpm_into_pm * v_a1_cpm;
vv_b1_cpm_into_pm = b1_cpm_into_pm * v_b1_cpm;

cc1_a1_cpm_into_pm  = a1_cpm_into_pm * c1_a1_cpm;
cc1_b1_cpm_into_pm  = b1_cpm_into_pm * c1_b1_cpm;
cc2_a1_cpm_into_pm  = a1_cpm_into_pm * c2_a1_cpm;
cc2_b1_cpm_into_pm  = b1_cpm_into_pm * c2_b1_cpm;

kk_a1_cpm_into_pm = a1_cpm_into_pm * k_a1_cpm;
kk_b1_cpm_into_pm = b1_cpm_into_pm * k_b1_cpm;        
dd_a1_cpm_into_pm = a1_cpm_into_pm * d_a1_cpm;
dd_b1_cpm_into_pm = b1_cpm_into_pm * d_b1_cpm; 

%Growth cone membrane budded vesicles - Fluxes for budding from pm to cpm
xx_a2_pm_into_cpm = a2_pm_into_cpm * sxa2;
xx_b2_pm_into_cpm = b2_pm_into_cpm * sxb2;
uu_a2_pm_into_cpm = a2_pm_into_cpm * sua2;
uu_b2_pm_into_cpm = b2_pm_into_cpm * sub2;
yy_a2_pm_into_cpm = a2_pm_into_cpm * sya2;
yy_b2_pm_into_cpm = b2_pm_into_cpm * syb2;
vv_a2_pm_into_cpm = a2_pm_into_cpm * sva2;
vv_b2_pm_into_cpm = b2_pm_into_cpm * svb2;

cc1_a2_pm_into_cpm = a2_pm_into_cpm * sc1a2;
cc1_b2_pm_into_cpm = b2_pm_into_cpm * sc1b2;
cc2_a2_pm_into_cpm = a2_pm_into_cpm * sc2a2;
cc2_b2_pm_into_cpm = b2_pm_into_cpm * sc2b2;

kk_a2_pm_into_cpm = a2_pm_into_cpm * ska2;
kk_b2_pm_into_cpm = b2_pm_into_cpm * skb2;
dd_a2_pm_into_cpm = a2_pm_into_cpm * sda2;
dd_b2_pm_into_cpm = b2_pm_into_cpm * sdb2;

%Growth cone membrane budded vesicles - Fluxes backfusion from cpm to pm
xx_a2_cpm_into_pm = a2_cpm_into_pm * x_a2_cpm;
xx_b2_cpm_into_pm = b2_cpm_into_pm * x_b2_cpm;
uu_a2_cpm_into_pm = a2_cpm_into_pm * u_a2_cpm;
uu_b2_cpm_into_pm = b2_cpm_into_pm * u_b2_cpm;
yy_a2_cpm_into_pm = a2_cpm_into_pm * y_a2_cpm;
yy_b2_cpm_into_pm = b2_cpm_into_pm * y_b2_cpm;
vv_a2_cpm_into_pm = a2_cpm_into_pm * v_a2_cpm;
vv_b2_cpm_into_pm = b2_cpm_into_pm * v_b2_cpm;

cc1_a2_cpm_into_pm = a2_cpm_into_pm * c1_a2_cpm;
cc1_b2_cpm_into_pm = b2_cpm_into_pm * c1_b2_cpm;
cc2_a2_cpm_into_pm = a2_cpm_into_pm * c2_a2_cpm;
cc2_b2_cpm_into_pm = b2_cpm_into_pm * c2_b2_cpm;

kk_a2_cpm_into_pm = a2_cpm_into_pm * k_a2_cpm;
kk_b2_cpm_into_pm = b2_cpm_into_pm * k_b2_cpm;
dd_a2_cpm_into_pm = a2_cpm_into_pm * d_a2_cpm;
dd_b2_cpm_into_pm = b2_cpm_into_pm * d_b2_cpm;

%Growth cone membrane budded vesicles - Fluxes from cpm to mtc
xx_a2_cpm_into_mtc = a2_cpm_into_mtc * x_a2_cpm;
xx_b2_cpm_into_mtc = b2_cpm_into_mtc * x_b2_cpm;
uu_a2_cpm_into_mtc = a2_cpm_into_mtc * u_a2_cpm;
uu_b2_cpm_into_mtc = b2_cpm_into_mtc * u_b2_cpm;
yy_a2_cpm_into_mtc = a2_cpm_into_mtc * y_a2_cpm;
yy_b2_cpm_into_mtc = b2_cpm_into_mtc * y_b2_cpm;
vv_a2_cpm_into_mtc = a2_cpm_into_mtc * v_a2_cpm;
vv_b2_cpm_into_mtc = b2_cpm_into_mtc * v_b2_cpm;

cc1_a2_cpm_into_mtc = a2_cpm_into_mtc * c1_a2_cpm;
cc1_b2_cpm_into_mtc = b2_cpm_into_mtc * c1_b2_cpm;
cc2_a2_cpm_into_mtc = a2_cpm_into_mtc * c2_a2_cpm;
cc2_b2_cpm_into_mtc = b2_cpm_into_mtc * c2_b2_cpm;

kk_a2_cpm_into_mtc = a2_cpm_into_mtc * k_a2_cpm;
kk_b2_cpm_into_mtc = b2_cpm_into_mtc * k_b2_cpm; 
dd_a2_cpm_into_mtc = a2_cpm_into_mtc * d_a2_cpm;
dd_b2_cpm_into_mtc = b2_cpm_into_mtc * d_b2_cpm;

%Growth cone membrane budded vesicles - Fluxes from mtc to cg
xx_a2_mtc_into_cg = a2_mtc_into_cg * x_a2_mtc;
xx_b2_mtc_into_cg = b2_mtc_into_cg * x_b2_mtc;
uu_a2_mtc_into_cg = a2_mtc_into_cg * u_a2_mtc;
uu_b2_mtc_into_cg = b2_mtc_into_cg * u_b2_mtc;
yy_a2_mtc_into_cg = a2_mtc_into_cg * y_a2_mtc;
yy_b2_mtc_into_cg = b2_mtc_into_cg * y_b2_mtc;
vv_a2_mtc_into_cg = a2_mtc_into_cg * v_a2_mtc;
vv_b2_mtc_into_cg = b2_mtc_into_cg * v_b2_mtc;

cc1_a2_mtc_into_cg = a2_mtc_into_cg * c1_a2_mtc;
cc1_b2_mtc_into_cg = b2_mtc_into_cg * c1_b2_mtc;
cc2_a2_mtc_into_cg = a2_mtc_into_cg * c2_a2_mtc;
cc2_b2_mtc_into_cg = b2_mtc_into_cg * c2_b2_mtc;

kk_a2_mtc_into_cg = a2_mtc_into_cg * k_a2_mtc;
kk_b2_mtc_into_cg = b2_mtc_into_cg * k_b2_mtc; 
dd_a2_mtc_into_cg = a2_mtc_into_cg * d_a2_mtc;
dd_b2_mtc_into_cg = b2_mtc_into_cg * d_b2_mtc;


%Growth cone membrane budded vesicles - Forward fusion fluxes from cg to g
xx_a2_cg_into_g = a2_cg_into_g * x_a2_cg;
xx_b2_cg_into_g = b2_cg_into_g * x_b2_cg;
uu_a2_cg_into_g = a2_cg_into_g * u_a2_cg;
uu_b2_cg_into_g = b2_cg_into_g * u_b2_cg;
yy_a2_cg_into_g = a2_cg_into_g * y_a2_cg;
yy_b2_cg_into_g = b2_cg_into_g * y_b2_cg;
vv_a2_cg_into_g = a2_cg_into_g * v_a2_cg;
vv_b2_cg_into_g = b2_cg_into_g * v_b2_cg;

cc1_a2_cg_into_g = a2_cg_into_g * c1_a2_cg;
cc1_b2_cg_into_g = b2_cg_into_g * c1_b2_cg;
cc2_a2_cg_into_g = a2_cg_into_g * c2_a2_cg;
cc2_b2_cg_into_g = b2_cg_into_g * c2_b2_cg;

kk_a2_cg_into_g = a2_cg_into_g * k_a2_cg;
kk_b2_cg_into_g = b2_cg_into_g * k_b2_cg;
dd_a2_cg_into_g = a2_cg_into_g * d_a2_cg;
dd_b2_cg_into_g = b2_cg_into_g * d_b2_cg;
