%Computation of the difference between JACR90 and Genjac

 disp('entrer les valeurs articulaires');
 q1 = input('q1 = ');
 q2 = input('q2 = ');
 q3 = input('q3 = ');
 q4 = input('q4 = ');
 q5 = input('q5 = ');
 q6 = input('q6 = ');

q = [q1;q2;q3;q4;q5;q6]; 

% RX90 geometrix parameters
D3 = 0.45;
RL4 = 0.45;

% MDH table parameters of RX90
alpha = [0 pi/2 0 -pi/2 pi/2 -pi/2];
theta = q; 
d = [0 0 D3 0 0 0 ];
r = [0 0 0 RL4 0 0];
sigma =[0 0 0 0 0 0];

% Computation of the error 
err = JACRX90(q)-Genjac(sigma,alpha,d,theta,r,q)