clear all
clc
q1 = [0.2, -0.3, -pi/2, 0.6, 0.0, 0.7].';

J0n = JACRX90(q1);
r = rank (J0n);

% Computation of U S V matrices with malab function USV
[U S V] = svd (J0n);

S

%null space base
Nj = V (:,1+r:6)

%cartesian velocities space
Bv = V(:,1:r)

% base for achievable end effector velocities
Rj = U(:,1:r)

%base for not achievable end effector velocities 
Mj = U(:,r+1:6)

