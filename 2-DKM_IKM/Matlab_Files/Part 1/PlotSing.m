%plot of singularities using matlab function "ezplot"

%% First case
RL4=.45;
D3=.45; 
figure(1)
ezplot(@(q2,q3) (RL4*sin(q2+q3) - D3*cos(q2)), [-pi pi])
grid on   %display the two singularities together
hold on 
ezplot(@(q2,q3) cos(q3), [-pi pi])
grid on
title(['RL4*sin(q2+q3) - D3*cos(q2)=0, cos(q3)=0'])
%% Second case
RL4=.45;
D3=.55;
figure(2)
ezplot(@(q2,q3) (RL4*sin(q2+q3) - D3*cos(q2)), [-pi pi])
grid on 
hold on   %display the two singularities together
ezplot(@(q2,q3) cos(q3), [-pi pi])
grid on
title(['RL4*sin(q2+q3) - D3*cos(q2)=0, cos(q3)=0'])