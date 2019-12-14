dimen=0.5;

% Vecteur i selon x
segx= line([OE(1),OE(1)+dimen],[OE(2),OE(2)],[OE(3),OE(3)]);
% Vecteur j selon y
segy= line([OE(1),OE(1)],[OE(2),OE(2)+dimen],[OE(3),OE(3)]);
% Vecteur k selon z
segz= line([OE(1),OE(1)],[OE(2),OE(2)],[OE(3),OE(3)+dimen]);
set(segx,'color','b');
set(segy,'color','w');
set(segz,'color','r');

norme = 0.5;
% Calcul des nouvelles coordonnées du vecteur U dans RE
OU(1)= s(1)*norme;
%OU(1)= (s(1)+n(1)+a(1))*norme;
%OU(2)= (s(2)+n(2)+a(2))*norme;
%OU(3)= (s(3)+n(3)+a(3))*norme;
OU(2)= s(2)*norme;
OU(3)= s(3)*norme;
% Affichage orientation : vecteur u unitaire
OU(1)=OE(1)+OU(1);
OU(2)=OE(2)+OU(2);
OU(3)=OE(3)+OU(3);

% Trace du vecteur U
segu= line([OE(1),OU(1)],[OE(2),OU(2)],[OE(3),OU(3)]);
set(segu,'color','g');

% Affichage d'une crois au bout du vecteur U
plot3(OU(1),OU(2),OU(3),'rx');

%view

