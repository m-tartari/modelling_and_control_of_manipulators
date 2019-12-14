hold on;

for indice=1:1:nbsolution

q1m=qsol(6*(indice-1)+1);
q2m=qsol(6*(indice-1)+2);
q3m=qsol(6*(indice-1)+3);
q4m=qsol(6*(indice-1)+4);
q5m=qsol(6*(indice-1)+5);
q6m=qsol(6*(indice-1)+6);

% Trace des origines des reperes dans le repère atelier
O0=[0;0;0];
O1=[q1m;0;0];		% a verifier le sens pris dans Denavit
O2=[q1m;q2m;0]; 	% a verifier le sens pris dans Denavit
O3=[q1m;q2m;q3m];	% a verifier le sens pris dans Denavit
OE=[q1m;q2m;q3m];	% a verifier le sens pris dans Denavit

plot3(O0(1),O0(2),O0(3),'ro');
plot3(O1(1),O1(2),O1(3),'ro');
plot3(O2(1),O2(2),O2(3),'ro');
plot3(O3(1),O3(2),O3(3),'ro');

%premier segment du robot
X=[O0(1),O1(1)];
Y=[O0(2),O1(2)];
Z=[O0(3),O1(3)];
segment1=line(X,Y,Z);
set(segment1,'color','g');

%deuxieme segment du robot
X=[O1(1),O2(1)];
Y=[O1(2),O2(2)];
Z=[O1(3),O2(3)];
segment2=line(X,Y,Z);
set(segment2,'color','m');

%troisieme segment du robot
X=[O2(1),O3(1)];
Y=[O2(2),O3(2)];
Z=[O2(3),O3(3)];
segment3=line(X,Y,Z);
set(segment3,'color','c');

pause
end;
