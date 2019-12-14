% Script to initialize the parameters of the 3R robot

L1=0.5;	% Longueur du premier segment
L2=0.5;	% Longueur du premier segment
L3=0.5;	% Longueur du premier segment

% Etat articulaire initial par defaut
q1m=0;q2m=0;q3m=0;

% Initialize to 1 variable that determines whether is asked user input
% in mgi or not
mgd_mgi=1;

kv1=1.0; % 1 rad/seconde
kv2=1.0; % 1 rad/seconde
kv3=1.0; % 1 rad/seconde

ka1=1.0; % 1 rad/seconde*seconde
ka2=1.0; % 1 rad/seconde*seconde
ka3=1.0; % 1 rad/seconde*seconde
