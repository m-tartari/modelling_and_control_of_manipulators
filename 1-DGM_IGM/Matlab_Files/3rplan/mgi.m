% Computing IGM of a 3R planar robot

%if the script is used for the mgdmgi the input is not asked

if(mgd_mgi)
disp('entrer les valeurs des variables operationnelles');
Px = input('Px = ');
Py = input('Py = ');
alpha = input('alpha = ');

end

% Initialisation
q21=0;
q22=0;

q11=0;
q12=0;

%follow the equation of type 8: X*cos(theta1)+Ycos(theta1+theta2)=Z1 and
%Xsin(theta1)+Ysin(theta1+theta2)=Z2
Z1 = Px - L3*cos(alpha);
Z2 = Py - L3*sin(alpha);
X = L1;
Y = L2;

cq2 = (Z1^2 + Z2^2 - X^2 - Y^2)/(2*X*Y);

q21 = atan2(sqrt(1 - cq2^2),cq2);
q22 = atan2(-sqrt(1 - cq2^2),cq2);

%follow the equation of type 3: B1*cos(theta1)-B2*sin(theta1)=Z1 and
%B2*cos(theta1)+ B1*sin(theta1)=Z2
B11 = X + Y*cos(q21);
B21 = Y*sin(q21);

X11 = -B21;
X21 = B11;
Y11 = B11;
Y21 = B21;

B12 = X + Y*cos(q22);
B22 = Y*sin(q22);

X12 = -B22;
X22 = B12;
Y12 = B12;
Y22 = B22;

sq11 = (Y21*Z1 - Y11*Z2)/(X11*Y21 - X21*Y11);
cq11 = (X11*Z2 - X21*Z1)/(X11*Y21 - X21*Y11);

sq12 = (Y22*Z1-Y12*Z2)/(X12*Y22-X22*Y12);
cq12 = (X12*Z2-X22*Z1)/(X12*Y22-X22*Y12);

q11 = atan2(sq11,cq11);
q12 = atan2(sq12,cq12);

% Computing q31 and q32
q31 = alpha - q21 - q11;
q32 = alpha - q22 - q12;


% Putting solutions together in one matrix
qsol=[q11,q12;
      q21,q22;
      q31,q32];

qsol

if (q21 == 0 & q22 == 0 )
    nbsolution = 1
else
    nbsolution = 2
end;

