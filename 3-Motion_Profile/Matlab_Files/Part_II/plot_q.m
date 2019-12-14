N=length(qout);
i=1:1:N;
tt=i*(tf+1)/N;

figure(1);

subplot(1,2,1);
plot(tt,qout(:,1),'b');
hold on;
plot(tt,qout(:,2),'r');
title('\textbf{The desired $q$}','Interpreter','latex');
grid on;
xlim([0,max(tt)]);
legend('Joint 1','Joint 2','Location','NorthEast');
hold off;

subplot(1,2,2);
plot(tt,qout1(:,1),'b');
hold on;
plot(tt,qout1(:,2),'r');
title('\textbf{The simulated output $q$}','Interpreter','latex');
grid on;
xlim([0,max(tt)]);
legend('Joint 1','Joint 2','Location','NorthEast');
hold off;

figure(2);
subplot(3,1,1);
plot(tt,e_q(:,1),'b');
hold on;
plot(tt,e_q(:,2),'r');
title('\textbf{Error of $q$}','Interpreter','latex');
grid on;
xlim([0,max(tt)]);
legend('Joint 1','Joint 2','Location','NorthEast');
hold off;

subplot(3,1,2);
plot(tt,e_dq(:,1),'b');
hold on;
plot(tt,e_dq(:,2),'r');
title('\textbf{Error of $\dot{q}$}','Interpreter','latex');
grid on;
xlim([0,max(tt)]);
legend('Joint 1','Joint 2','Location','NorthEast');
hold off;

subplot(3,1,3);
plot(tt,e_ddq(:,1),'b');
hold on;
plot(tt,e_ddq(:,2),'r');
title('\textbf{Error of $\ddot{q}$}','Interpreter','latex');
xlabel('time','Interpreter','latex');
grid on;
xlim([0,max(tt)]);
legend('Joint 1','Joint 2','Location','NorthEast');
hold off;

figure(3)
plot(tt,torque(:,1),'b');
hold on;
plot(tt,torque(:,2),'r');
title('\textbf{Torque}','Interpreter','latex');
grid on;
xlim([0,max(tt)]);
legend('Joint 1','Joint 2','Location','NorthEast');
hold off;
