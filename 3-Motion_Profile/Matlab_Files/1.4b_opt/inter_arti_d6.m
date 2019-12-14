function Q = inter_arti_d5(u)
global ListePoints kv ka tf1 tf2 tf 

q1 = ListePoints(1,:);
q2 = ListePoints(2,:);
q3 = ListePoints(3,:);
D1 = q2-q1;
D2 = q3-q2;
D = D1+D2;

tf1 = max (3*abs(D1)/(8*kv),sqrt(10*abs(D1/ka*sqrt(3))));
tf2 = max (3*abs(D2)/(8*kv),sqrt(10*abs(D2/ka*sqrt(3))));
tf = tf1+tf2;

opt

%optimised motion planning
if (u<tf)
a = -(2*(q1*tf^5 + 9*q1*tf1^5 - q2*tf^5 - 9*q3*tf1^5 - 15*q1*tf*tf1^4 + 15*q3*tf*tf1^4 + 5*q1*tf^2*tf1^3 - 5*q3*tf^2*tf1^3))/(tf^5*tf1^3*(tf^3 - 3*tf*tf1^2 + 2*tf1^3));
b = (3*(q1*tf^6 + 6*q1*tf1^6 - q2*tf^6 - 6*q3*tf1^6 - 15*q1*tf^2*tf1^4 + 8*q1*tf^3*tf1^3 + 15*q3*tf^2*tf1^4 - 8*q3*tf^3*tf1^3))/(tf^5*tf1^3*(tf^3 - 3*tf*tf1^2 + 2*tf1^3));
c = -(15*(q1 - q3))/tf^4;
d = -(q1*tf^6 - 10*q1*tf1^6 - q2*tf^6 + 10*q3*tf1^6 + 24*q1*tf*tf1^5 - 24*q3*tf*tf1^5 - 15*q1*tf^2*tf1^4 + 15*q3*tf^2*tf1^4)/(tf^3*tf1^3*(tf^3 - 3*tf*tf1^2 + 2*tf1^3));    
    
qc = a*u^6+b*u^5+c*u^4+d*u^3+q1;    
qcd = 6*a*u^5 + 5*b*u^4 + 4*c*u^3 + 3*d*u^2;
qcdd = 30*a*u^4 + 20*b*u^3 + 12*c*u^2 + 6*d*u; 
else
qc=q3;
qcd=zeros(size(qc));
qcdd=zeros(size(qc));
end

Q = [qc(1), qc(2), qcd(1), qcd(2) qcdd(1),qcdd(2)];

