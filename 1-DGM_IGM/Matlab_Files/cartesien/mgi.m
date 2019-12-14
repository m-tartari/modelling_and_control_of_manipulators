%Programmation du MGI
if(mgd_mgi==1)
disp('Entrer les valeurs des variables operationnelles');
Px=input('Px = ');
Py=input('Py = ');
Pz=input('Pz = ');
tetax=input('tetax = ');
tetay=input('tetay = ');
tetaz=input('tetaz = ');
end
L1=.5;

syms q1 q2 q3 q4 q5 q6 
syms ssx nnx aax ppx ssy nny aay ppy ssz nnz aaz ppz

cosx = cos(tetax);
sinx = sin(tetax);
cosy = cos(tetay);
siny = sin(tetay);
cosz = cos(tetaz);
sinz = sin(tetaz);

% MDH table parameters 
alpha = [0 pi/2 pi/2 0 -pi/2 -pi/2];
theta = [0 pi/2 0 q4 q5 q6];
d = [0 0 0 0 0 0];
r = [q1 q2 q3 0 0 0];
% first and last frames transformation matrix 'TA0' and 'T6E' and their inverses 'T0A' 'TE6'
TA0 = [0 0 1 0; 0 -1 0 0; 1 0 0 0; 0 0 0 1];
T6E = [0 1 0 0; -1 0 0 0; 0 0 1 L1; 0 0 0 1];
T0A = InvTransHom(TA0);
TE6 = InvTransHom(T6E);

% calculate TAE_numeric         
TAE_num = [cosy*cosz                    -cosy*sinz              siny        Px;
          sinx*siny*cosz+cosx*sinz     -sinx*siny*sinz+cosx*cosz    -sinx*cosy     Py;
          -cosx*siny*cosz+sinx*sinz      cosx*siny*sinz+sinx*cosz   cosx*cosy      Pz;
                     0                             0                    0           1  ];
         
T0n_num = T0A*TAE_num*TE6;

% Extraction des coordonnees operationnelles (cosinus-directeur)
ssx = T0n_num(1,1);
nnx = T0n_num(1,2);
aax = T0n_num(1,3);
PPx = T0n_num(1,4);
ssy = T0n_num(2,1);
nny = T0n_num(2,2);
aay = T0n_num(2,3);
PPy = T0n_num(2,4);
ssz = T0n_num(3,1);
nnz = T0n_num(3,2);
aaz = T0n_num(3,3);
PPz = T0n_num(3,4);

% Calcul de q1,q2,q3
q1= PPz;
q2=-PPy;
q3= PPx;

% Calcul de q4
q4a = atan2(-aay,aaz);
q4b = q4a+pi;

%Calcul de q4,q5,q6

q5a = atan2(-aax, sin(q4a)*aay-cos(q4a)*aaz);
q5b = atan2(-aax, sin(q4b)*aay-cos(q4b)*aaz);
 
q6a = atan2(cos(q4a)*ssy+sin(q4a)*ssz, cos(q4a)*nny+sin(q4a)*nnz);
q6b = atan2(cos(q4b)*ssy+sin(q4b)*ssz, cos(q4b)*nny+sin(q4b)*nnz);

q4a = atan2( - aay, aaz);
q51 = atan2(sin(q4a)*aay - cos(q4a)*aaz, - aax );
q61 = atan2(cos(q4a)*ssy + sin(q4a)*ssz , cos(q4a)*nny + sin(q4a)*nnz);

q4b = q4a + pi;
q52 = atan2(sin(q4b)*aay - cos(q4b)*aaz, - aax );
q62 = atan2(cos(q4b)*ssy + sin(q4b)*ssz, cos(q4b)*nny + sin(q4b)*nnz);


%showing the result
qsol=[q1,q1;q2,q2;q3,q3;q4a,q4b;q5a,q5b;q6a,q6b]

nbsolution=2;


