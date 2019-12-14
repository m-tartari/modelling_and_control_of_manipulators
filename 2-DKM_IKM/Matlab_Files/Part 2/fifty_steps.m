clear all
clc
%initial and final configuration 
qi = [pi/6, -pi/6, pi/6]';
qf = [ 3*pi/4, pi/2, pi/3]';

Xi = RDGM3R (qi);
Xf = RDGM3R (qf)

Nstep = 50;
stepX = (Xf-Xi)/Nstep;
% Initialization of qc, Xd and Xc
qc = qi;
Xd = Xi;
Xc = Xi;
%Matrices to stores the values to plot them
XY_pts = Xi;
q_values =qc;

for k = 1 : Nstep
    Xd = Xd + stepX;
    dX = Xd - Xc;
    J = RJ3R(qc);
    % Computation of dq corresponding to dX using
    % pseudo inverse to minimize the norm of dq
    dq = pinv(J)*dX;
    qc = qc + dq;
    % Angle always less than 2*pi
    qc = rem(qc, 2*pi)
    Xc = RDGM3R (qc);
    % Storing values for plot
    XY_pts= [XY_pts Xc];
    q_values =[q_values qc];
end
% delete semicolon to show values
XY_pts;
q_values;
% Plot of evolution of position
figure(1)
plot(XY_pts(1,:),XY_pts(2,:),'*')
title('End effector motion')
xlabel('Px')
ylabel('Py')
% Plot of joints evolution from step to step
figure(2)
n = [1:51];
plot(n, q_values)
title('Joint variables evolution')
xlabel('Nstep')
ylabel('q1,q2,q3')







