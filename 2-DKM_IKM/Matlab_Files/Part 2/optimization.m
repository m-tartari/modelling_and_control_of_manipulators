function dq = optimization (qc,dX) 

q1max=2.7;  q1min=-2.5;
q2max=2.7;  q2min=-2.5;
q3max=2.9;  q3min=-2.9;

J = RJ3R(qc);
J_inv = pinv(J);

% Computation of Z = gradient(phi)
Z=2*[(qc(1)-(q1max+q1min)/2)/((q1max-q1min)^2);
(qc(2)-(q2max+q2min)/2)/((q2max-q2min)^2);
(qc(3)-(q3max+q3min)/2)/((q3max-q3min)^2)];

% Computation of alpha so that the two parts of
% the optimizatoin have equal norm for the 
% corresponding dq terms
alpha = -norm(J_inv*dX)/norm((eye(3)-J_inv*J)*Z);

dq = J_inv*dX + alpha*(eye(3)-J_inv*J)*Z;