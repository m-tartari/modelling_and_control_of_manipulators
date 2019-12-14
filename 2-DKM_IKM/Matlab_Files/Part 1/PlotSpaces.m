clc
clear all

% Geometrical parameters of robot
L1 = 0.5;
L2 = 0.4;
q1max=2.8;
q2max=2.8;
q1min=-2.6;
q2min=-2.6;
%% joint space
 rectangle('Position',[q1min q2min q1max+abs(q1min) q2max+abs(q2min)],'FaceColor',[0 .5 .5])
 axis([-5 5 -5 5])

 xlabel('q1')
 ylabel('q2')
 title ('Joint space')
%% workspace
figure

i=1;

% Store the position of the end effector for every
% possible configuration
for k=q1min:0.05:q1max
    for j=q2min:0.1:q2max
        q=[k,j];
        X(:,i)=DGM2R(L1,L2,q);
        i=i+1;
    end
end

plot(X(1,:),X(2,:))
xlabel('x')
ylabel('y')
title ('Working space')
