N=length(qout);
i=1:1:N;
tt=i*(tf+1)/N;

figure(1);

subplot(3,1,1);
plot(tt,qout(:,1),'b');
hold on;
plot(tt,qout(:,2),'g');
title('q');
grid on;

subplot(3,1,2);
plot(tt,dqout(:,1),'b');
hold on;
plot(tt,dqout(:,2),'g');
title('dq');
grid on;

subplot(3,1,3);
plot(tt,ddqout(:,1),'b');
hold on;
plot(tt,ddqout(:,2),'g');
title('ddq');
xlabel('time');
grid on;


