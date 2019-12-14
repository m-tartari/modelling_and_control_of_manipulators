N=length(qout);
i=1:1:N;
tt=i*(tf+1)/N;

figure(1);

plot(tt,e_ddq(:,1),'b');
hold on;
plot(tt,e_ddq(:,2),'g');
title('error of ddq');
xlabel('time');
grid on;

