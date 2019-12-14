function Q = inter_arti_d5(u)
global ListePoints kv ka tf1 tf2 tf

q1 = ListePoints(1,:);
q2 = ListePoints(2,:);
q3 = ListePoints(3,:);
D1 = q2-q1;
D2 = q3-q2;

tf1 = max (3*abs(D1)/(8*kv),sqrt(10*abs(D1/ka*sqrt(3))));
tf2 = max (3*abs(D2)/(8*kv),sqrt(10*abs(D2/ka*sqrt(3))));
tf = tf1+tf2;
t = u - tf1;
% find qc qcd qcdd

if (u<tf1)
r = 10*(u/tf1)^3 - 15*(u/tf1)^4 +6* (u/tf1)^5;
qc= q1 + r*D1;
qcd = ((30*u^2)/tf1^3 - (60*u^3)/tf1^4 + (30*u^4)/tf1^5)*D1;
qcdd = ((120*u^3)/tf1^5 - (180*u^2)/tf1^4 + (60*u)/tf1^3)*D1;
elseif (u<tf && u>tf1)
r = 10*(t/tf2)^3 - 15*(t/tf2)^4 +6* (t/tf2)^5;
qc= q2 + r*D2;
qcd = ((30*t^2)/tf2^3 - (60*t^3)/tf2^4 + (30*t^4)/tf2^5)*D2;
qcdd = ((120*t^3)/tf2^5 - (180*t^2)/tf2^4 + (60*t)/tf2^3)*D2;
else
qc=q3;
qcd=zeros(size(qc));
qcdd=zeros(size(qc));
end

Q = [qc(1), qc(2), qcd(1), qcd(2) qcdd(1),qcdd(2)];

