% Calcul du Modèle géométrique Direct
% Initialization  of the joint variables
disp('entrer les valeurs articulaires');
q1 = input('q1 = ');
q2 = input('q2 = ');
q3 = input('q3 = ');
q4 = input('q4 = ');
q5 = input('q5 = ');
q6 = input('q6 = ');
q = [q1;q2;q3;q4;q5;q6];  

% MDH table parameters 
alpha = [0, pi/2, pi/2, 0, -pi/2, -pi/2];
theta = [0, pi/2, 0, q4, q5, q6];
d = [0, 0, 0, 0, 0, 0];
r = [q1, q2, q3, 0, 0, 0];

% Using DHSym function to compute the DGM:
T06= DHSym(alpha , d, theta, r); 
TA0 = [0 0 1 0; 0 -1 0 0; 1 0 0 0; 0 0 0 1];
T6E = [0 1 0 0; -1 0 0 0; 0 0 1 L1; 0 0 0 1];
Ttot= TA0*T06*T6E; 

% Extraction des coordonnees operationnelles (cosinus-directeur)
sx = Ttot(1,1);
nx = Ttot(1,2);
ax = Ttot(1,3);
Px = Ttot(1,4);
sy = Ttot(2,1);
ny = Ttot(2,2);
ay = Ttot(2,3);
Py = Ttot(2,4);
sz = Ttot(3,1);
nz = Ttot(3,2);
az = Ttot(3,3);
Pz = Ttot(3,4);

% Configuration of the robot
tetax = atan2(-ay, az);
ctx = cos(tetax);
stx = sin(tetax);
tetay = atan2(ax, -ay * stx + az * ctx);
tetaz = atan2(ctx * ay + stx * sz, ctx * ny + stx * nz);

% Displaying the results
xf = [Px;Py;Pz;tetax;tetay;tetaz]
qsol = [q1;q2;q3;q4;q5;q6]; 
nbsolution = 1; 