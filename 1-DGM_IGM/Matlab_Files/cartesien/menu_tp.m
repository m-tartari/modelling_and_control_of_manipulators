aecho off
%MENU	TP de Robotique Genie Electrique
%	Copyright (C) D. Khadraoui , P. Martinet
%	Novembre 1996%	ROBOT Cartesien
% Initialisation des donnees specifiques au robot
cart
while 1,	
%clg
%Affichage d un cadre delimitant l aire d affichage
line([q1min,q1max,q1max,q1min,q1min],[q2min,q2min,q2max,q2max,q2min],[q3min,q3min,q3min,q3min,q3min]);
line([q1min,q1max,q1max,q1min,q1min],[q2min,q2min,q2max,q2max,q2min],[q3max,q3max,q3max,q3max,q3max]);
line([q1min,q1min,],[q2min,q2min],[q3max,q3min]);
line([q1max,q1max,],[q2min,q2min],[q3max,q3min]);
line([q1min,q1min,],[q2max,q2max],[q3max,q3min]);
line([q1max,q1max,],[q2max,q2max],[q3max,q3min]);
% Elimination des Axes
axis('off');
axis(axis);
view([-30,20])
which = menu('Mod�le G�om�trique Robot Cart�sien',...
	'Calcul Mod�le G�om�trique Direct', ...
	'Calcul Mod�le G�om�trique Inverse', ...
	'Validation : MGD puis MGI', ...
	'Visualisation position', ...
	'Visualisation orientation', ...	
	'Faire le tour ', ...
	'Effacer l ecran', ...
	'Exit');
if which == 1,
	mgd
elseif which == 2,
	mgi
elseif which == 3,
	mgdmgi
elseif which == 4,
	visuart
elseif which == 5,
	viseff
	pause
elseif which == 6,
	visuart
	viseff
	tourner
elseif which == 7,
	clg
elseif which == 8,
	break;	
end
end
