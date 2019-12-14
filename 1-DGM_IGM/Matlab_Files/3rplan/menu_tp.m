
%MENU	TP de Robotique Genie Electrique
%	Copyright (C) D. Khadraoui , P. Martinet
%	Novembre 1996%	ROBOT 3RPLAN

% Initialisation des donnees specifiques au robot
close all
clc

r3plan
while 1,	

which = menu('Modèle Géométrique Robot 3RPLAN',...
	'Calcul Modèle Géométrique Direct', ...
	'Calcul Modèle Géométrique Inverse', ...
	'Validation : MGD puis MGI', ...
	'Visualisation état articulaire', ...		
	'Exit');	

if which == 1,		
	mgd
elseif which == 2,		
	mgi
elseif which == 3,		
	mgdmgi
elseif which == 4,
	visuart
	pause
elseif which == 5,
	break;	
end
end
