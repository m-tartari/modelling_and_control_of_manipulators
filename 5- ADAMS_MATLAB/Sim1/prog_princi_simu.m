%    lwr 4+ irccyn (version rigide -paramètres essentiels seulements-)
%    copyright (c) 2014 by irccyn, anthony jubien (anthony.jubien@irccyn.ec-nantes.fr)
%    creation: 1.0  date: 18/11/14   anthony jubien
%    revision: 	    date: 18/11/14   anthony jubien
%    programme pour simuler le lwr 4+

clc
close all
clear all

% chargements des consignes de positions qr, vitesses qdr , accélérations
% (facultatif) qddr  et du vecteur temps
load consignes

% chargement des paramètres dynamiques et géométriques du robot (unités du S.I. côté articulaire)
rl3 =   0.400 ;
rl5 =   0.390 ;
g3  =   -9.81 ;
fv1 =	14.4  ;
fc1 =	11.9  ;
fv2 =	15.3  ;
fc2 =	11.5  ;
ia3 =	2.01  ;
fv3 =	6.55  ;
fc3 =	8.98  ;
ia4 =	1.92  ;
fv4 =	11.0  ;
fc4 =	8.35  ;
ia5 =	0.776  ;
fv5 =	4.29  ;
fc5 =	8.31  ;
ia6 =	0.391  ;
fv6 =	2.26  ;
fc6 =	4.72  ;
ia7 =	0.399  ;
fv7 =	1.6  ;
fc7 =	6.04  ;
zz1 =	3.20  ;
xx2 =	1.31  ;
zz2 =	4.46  ;
my2 =	3.3  ;
xx4 =	0.368  ;
zz4 =	0.491  ;
my4 =	-1.37  ;
my5 =	0.049  ;
my6 =	0.042  ;

% calcul des gains du contrôleur (type PID : p 349 et 350 du livre de Khalil et Dombre)
inerties = [ zz1 zz2 ia3 ia4+zz4 ia5 ia6 ia7 ]'; %diagonale de la matrice d'inertie sous forme de vecteur
fv       = [ fv1 fv2 fv3 fv4 fv5 fv6 fv7 ]'; % frottements visqueux
w_cmd = 2*pi*[ 1 1 1 1 1 1 1 ]'*10; %[Hz] pulsation de commande pour chaque axe (10-20Hz)
kp = 3.*w_cmd.*w_cmd.*inerties ;                                   % gains proportionnels 
kd = 3.*w_cmd.*inerties-fv ;                                       % gains dérivés 
ki = w_cmd.*w_cmd.*w_cmd.*inerties ;                               % gains intégraux
tec = t(2)-t(1) ;%[s] période d'échantillonnage

% options pour la simulation,
 options=simset('Solver','ode45',...
        'RelTol','auto','AbsTol','auto',...
        'Refine',1,'MaxStep',t(2)-t(1),...
        'InitialState',[],'ZeroCross','off',...
        'SrcWorkspace','current','DstWorkspace','current'...
        );
        q0 = zeros(1,7)' ; % initialisation sur les positions simulées
    qd0 = zeros(1,7)' ; % initialisation sur les vitesses simulées
    

% simulation du robot    
sim('simu_lwr_rig_essentiels',[t(1) t(end)] ,options);  

% affichage 
figure
subplot(2,1,1)
plot(t,qs)
legend('axe 1','axe 2','axe 3','axe 4','axe 5','axe 6','axe 7')
xlabel('temps (s)')
ylabel('positions simulées (rad)')
subplot(2,1,2)
plot(t,qs-qr)
legend('axe 1','axe 2','axe 3','axe 4','axe 5','axe 6','axe 7')
xlabel('temps (s)')
ylabel('Erreur entre les positons simulées et les consignes de positions (rad)')

figure
subplot(2,1,1)
plot(t,qds)
legend('axe 1','axe 2','axe 3','axe 4','axe 5','axe 6','axe 7')
xlabel('temps (s)')
ylabel('vitesses simulées (rad/s)')
subplot(2,1,2)
plot(t,qds-qdr)
legend('axe 1','axe 2','axe 3','axe 4','axe 5','axe 6','axe 7')
xlabel('temps (s)')
ylabel('Erreur entre les vitesses simulées et les consignes de vitesses (rad/s)')

figure
plot(t,taus)
legend('axe 1','axe 2','axe 3','axe 4','axe 5','axe 6','axe 7')
xlabel('temps (s)')
ylabel('couples simulés (Nm)')






    
    
