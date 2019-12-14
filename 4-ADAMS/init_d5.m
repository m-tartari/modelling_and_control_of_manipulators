clc
clear all

Controls_Plant_2
global ListePoints tf
ListePoints=[[0,0];[pi/3,pi/3]];
kv = [deg2rad(50) deg2rad(40)];
ka = [deg2rad(100) deg2rad(60)];

D=diff(ListePoints);

 tf = max([15*abs(D)./(8*kv),sqrt(10*abs(D)./(sqrt(3)*ka))]);

 pgain=1;
 sim('Simlink_ADAMS_BONUS.slx')