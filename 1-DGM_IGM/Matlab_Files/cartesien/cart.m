% Caract�ristiques g�om�triques
q1min= -1.5;
q2min= -1.5;
q3min= -1;
q1max= +1.5;
q2max= +1.5;
q3max= +1;
q4min= -pi/2;
q5min= -pi/2;
q6min= -pi/2;
q4max= +pi/2;
q5max= +pi/2;
q6max= +pi/2;

% Etat articulaire initial par defaut
q1m=0;q2m=0;q3m=0;
q4m=0;q5m=0;q6m=0;

% initialization of the variable that accounts 
% if the mgi is used alone or in the mgdmgi
mgd_mgi=1;

L1 = .5;

% Caract�ristiques cin�matiques
kv1=1.0; % 1 m/seconde
kv2=1.0; % 1 m/seconde
kv3=1.0; % 1 m/seconde
kv4=1.0; % 1 rad/seconde
kv5=1.0; % 1 rad/seconde
kv6=1.0; % 1 rad/seconde

% Caract�ristiques dynamiques
ka1=1.0; % 1 m/seconde*seconde
ka2=1.0; % 1 m/seconde*seconde
ka3=1.0; % 1 m/seconde*seconde
ka4=1.0; % 1 rad/seconde*seconde
ka5=1.0; % 1 rad/seconde*seconde
ka6=1.0; % 1 rad/seconde*seconde
