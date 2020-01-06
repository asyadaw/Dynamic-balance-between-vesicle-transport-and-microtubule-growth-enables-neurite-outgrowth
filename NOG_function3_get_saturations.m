% saturation functions for binding of SNAREs to coats

snare_saturation_denom_1a = (1 + x_g/kxa  + u_g/kua  + y_g/kya  + v_g/kva);
snare_saturation_denom_1b = (1 + x_g/kxb  + u_g/kub  + y_g/kyb  + v_g/kvb);
snare_saturation_denom_2a = (1 + x_pm/kxa + u_pm/kua + y_pm/kya + v_pm/kva);
snare_saturation_denom_2b = (1 + x_pm/kxb + u_pm/kub + y_pm/kyb + v_pm/kvb);

sxa1 = snare_binding_spots_per_vesicle_area * (x_g/kxa) / snare_saturation_denom_1a;
sxb1 = snare_binding_spots_per_vesicle_area * (x_g/kxb) / snare_saturation_denom_1b;
sua1 = snare_binding_spots_per_vesicle_area * (u_g/kua) / snare_saturation_denom_1a;
sub1 = snare_binding_spots_per_vesicle_area * (u_g/kub) / snare_saturation_denom_1b;
sya1 = snare_binding_spots_per_vesicle_area * (y_g/kya) / snare_saturation_denom_1a;
syb1 = snare_binding_spots_per_vesicle_area * (y_g/kyb) / snare_saturation_denom_1b;
sva1 = snare_binding_spots_per_vesicle_area * (v_g/kva) / snare_saturation_denom_1a;
svb1 = snare_binding_spots_per_vesicle_area * (v_g/kvb) / snare_saturation_denom_1b;
sxa2 = snare_binding_spots_per_vesicle_area * (x_pm/kxa) / snare_saturation_denom_2a;
sxb2 = snare_binding_spots_per_vesicle_area * (x_pm/kxb) / snare_saturation_denom_2b;
sua2 = snare_binding_spots_per_vesicle_area * (u_pm/kua) / snare_saturation_denom_2a;
sub2 = snare_binding_spots_per_vesicle_area * (u_pm/kub) / snare_saturation_denom_2b;
sya2 = snare_binding_spots_per_vesicle_area * (y_pm/kya) / snare_saturation_denom_2a;
syb2 = snare_binding_spots_per_vesicle_area * (y_pm/kyb) / snare_saturation_denom_2b;
sva2 = snare_binding_spots_per_vesicle_area * (v_pm/kva) / snare_saturation_denom_2a;
svb2 = snare_binding_spots_per_vesicle_area * (v_pm/kvb) / snare_saturation_denom_2b;

% saturation functions for binding of cargo to coats

sc1a1 = cargo_binding_spots_per_vesicle_area * (c1_g/kc1a) / (1+c1_g/kc1a);
sc1b1 = cargo_binding_spots_per_vesicle_area * (c1_g/kc1b) / (1+c1_g/kc1b);
sc2a1 = cargo_binding_spots_per_vesicle_area * (c2_g/kc2a) / (1+c2_g/kc2a);
sc2b1 = cargo_binding_spots_per_vesicle_area * (c2_g/kc2b) / (1+c2_g/kc2b);


sc1a2 = cargo_binding_spots_per_vesicle_area * (c1_pm/kc1a) / (1+c1_pm/kc1a);
sc1b2 = cargo_binding_spots_per_vesicle_area * (c1_pm/kc1b) / (1+c1_pm/kc1b);
sc2a2 = cargo_binding_spots_per_vesicle_area * (c2_pm/kc2a) / (1+c2_pm/kc2a);
sc2b2 = cargo_binding_spots_per_vesicle_area * (c2_pm/kc2b) / (1+c2_pm/kc2b);

% saturation functions for binding of motor-receptors to coats

ska1 = motor_binding_spots_per_vesicle_area * (k_g/kka) / (1+k_g/kka);
skb1 = motor_binding_spots_per_vesicle_area * (k_g/kkb) / (1+k_g/kkb);
ska2 = motor_binding_spots_per_vesicle_area * (k_pm/kka) / (1+k_pm/kka);
skb2 = motor_binding_spots_per_vesicle_area * (k_pm/kkb) / (1+k_pm/kkb);
         
sda1 = motor_binding_spots_per_vesicle_area * (d_g/kda) / (1+d_g/kda);
sdb1 = motor_binding_spots_per_vesicle_area * (d_g/kdb) / (1+d_g/kdb);
sda2 = motor_binding_spots_per_vesicle_area * (d_pm/kda) / (1+d_pm/kda);
sdb2 = motor_binding_spots_per_vesicle_area * (d_pm/kdb) / (1+d_pm/kdb);
