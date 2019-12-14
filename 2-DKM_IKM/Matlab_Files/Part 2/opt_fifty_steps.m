clear all
clc
%initial and final configuration 
qi = [pi/6, -pi/6, pi/6]';
qf = [ 3*pi/4, pi/2, pi/3]';

Xi = RDGM3R (qi);
Xf = RDGM3R (qf);

Nstep = 50;
stepX = (Xf-Xi)/Nstep;
qc = qi;
Xd = Xi;
Xc = Xi;
XY_pts = [Xi];
q_values = [qc];

for k = 1 : Nstep
    Xd = Xd + stepX;
    dX = Xd - Xc;
    % Now we compute dq using a jacobian with 
    % an optimization component avoiding the joint limits
    dq = optimization (qc,dX);
    
    qc = qc + dq;
    qc = rem(qc, 2*pi);
    Xc = RDGM3R (qc);
    XY_pts= [XY_pts Xc];
    q_values =[q_values qc];
end
XY_pts;
q_values;
figure(1)
plot(XY_pts(1,:),XY_pts(2,:),'*')
title('End effector motion')
xlabel('Px')
ylabel('Py')
figure(2)
n = [1:51];
plot(n, q_values)
title('Joint variables evolution')
xlabel('Nstep')
ylabel('q1,q2,q3')


