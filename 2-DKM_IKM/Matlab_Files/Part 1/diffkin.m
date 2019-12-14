% Initial configuration
q = [0.6 1.25 -0.3 0.6 0.3 2.0].';

% Differential joint vector
dq = [0.08 .012 -0.02 .006 -0.03 0.03].';

% Computation of kinematic jacobian matrix
J = JACRX90 (q);

% Differential pose vector
dx = J * dq

% Extraction of position and orientation
dXp=dx(1:3)
dXr=dx(4:6)

%Hom trans matrix for q and q+dq
Tx = DGMRX (q);
Txdx= DGMRX (q+dq);

% Pose with Bryant angles convention for x and x+dx
X = BryantRotPos (Tx);
XdX = BryantRotPos (Txdx);

% Error with differential model 
err = XdX - (X+dx.') 

          
          
          
          