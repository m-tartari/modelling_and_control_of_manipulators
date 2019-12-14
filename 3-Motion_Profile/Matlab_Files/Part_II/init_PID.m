clc;
clear all;

global ListePoints tf
ListePoints=[100*pi/360 100*pi/360;6*pi/360 60*pi/360];
kv=[50*pi/180 40*pi/180];
ka=[100*pi/180 60*pi/180];
kt = [20 7]; 

D=diff(ListePoints);

 tf = max([15*abs(D)./(8*kv),sqrt(10*abs(D)./(sqrt(3)*ka))]);

L1 = 0.5;
L2 = 0.4;
ZZ1R = 3.9;
ZZ2 = 0.35;
MX2 = 0.4; 
MY2 = 0.15;
FV1 = 0.3;
FV2 = 0.18;
FC1 = 0.3;
FC2 = 0.25;
IA2 = 0;
Npts = [8000 20000];

Freq = 200;
BW = [25;25];

omega = BW./2;
a = [ZZ1R+2*MX2*L1+ZZ2;ZZ2];
Fv = [FV1;FV2];

Kp = 6*a.*omega.^2;
Kd = 3*a.*omega - Fv;
Ki = a.*omega.^3;

sim('PID_.mdl');

plot_q;

