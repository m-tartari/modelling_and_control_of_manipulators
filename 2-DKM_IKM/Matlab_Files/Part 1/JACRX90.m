function J06 = JACRX90(q)

c2 = cos(q(2));
s2 = sin(q(2));
c3 = cos(q(3));
s3 = sin(q(3));
c4 = cos(q(4));
s4 = sin(q(4));
c5 = cos(q(5));
s5 = sin(q(5));
c23 = cos(q(2)+q(3));
s23 = sin(q(2)+q(3));
D3 = 0.45;
RL4 = 0.45;

% MDH table for RX90
alpha = [0 pi/2 0 -pi/2 pi/2 -pi/2];
theta = q; 
d = [0 0 D3 0 0 0 ];
r = [0 0 0 RL4 0 0];
sigma =[0 0 0 0 0 0];

% Homogeneous transformation matrix from frame 0 to 3
T03 = DHSym (alpha(1:3),d(1:3), theta(1:3), r(1:3));

% Extraction on rotational part
R03= T03(1:3,1:3);

J36 = [0              -RL4 + s3*D3   -RL4   0   0        0;
       0                  c3*D3         0    0   0        0;
       s23*RL4-c2*D3        0          0    0   0        0;
       s23                  0          0    0   s4  -s5*c4;
       c23                  0          0    1   0       c5;
       0                    1          1    0   c4   s5*s4];

% Computation of kinematic jacobian matrix
J06 = [  R03    zeros(3); 
       zeros(3)   R03   ]  * J36
   
end   
 
