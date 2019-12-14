function [qc, qcd, qcdd] = inter_arti_d5 (ListePoints, kv, ka)
qi = ListePoints(1,:);
qf = ListePoints(2,:);
D = qf-qi;

tf = max (15*abs(D)/(8*kv),sqrt(10*abs(D)/(ka*3)));


% find qc qcd qcdd
syms t

r = 10*(t/tf)^3 - 15*(t/tf)^4 +6* (t/tf)^5;
qc= qi + r*D;
qcd = diff(qc);
qcdd = diff(qcd);

% plot
figure
subplot(3,1,1), fplot(qc,[0,tf])
title('Position')
hold on
xlim([0,tf])
hold off

subplot(3,1,2), fplot (qcd,[0,tf])
title('Velocity')
hold on
xlim([0,tf])
hold off

subplot(3,1,3), fplot (qcdd,[0,tf])
title('Acceleration')
hold on
xlim([0,tf])
hold off



