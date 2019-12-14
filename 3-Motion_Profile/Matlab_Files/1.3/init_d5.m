clc
clear all

global ListePoints tf
ListePoints=[100*pi/360 100*pi/360;6*pi/360 60*pi/360];
kv=[50*pi/180 40*pi/180];
ka=[100*pi/180 60*pi/180];
D=diff(ListePoints);

 tf = max([15*abs(D)./(8*kv),sqrt(10*abs(D)./(sqrt(3)*ka))]);
 
 Freq=200;
ZZ1R=3.9;
ZZ2=0.35;
MX2=0.4;
MY2=0.15;
Fv2=0.18;
Fv1=0.3;
L1=0.5;
Bw=[25;25];
w=Bw/2;
a=[ZZ1R+2*MX2*L1+ZZ2,ZZ2];
Fv=[Fv1;Fv2];
Kp=6*a*w.*w;
Kv=3*w-Fv;
Ki=a*w.*w.*w;

 sim('validation_slk_arti_d5.mdl')
 
 plot_q_validation
