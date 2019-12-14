N=length(qout);
i=1:1:N;
tt=i*(tf+1)/N;

figure(1);

plot(tt,e_dq(:,1),'b');
hold on;
plot(tt,e_dq(:,2),'g');
title('error of dq');
xlabel('time');
grid on;

