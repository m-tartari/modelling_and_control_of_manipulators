global ListePoints kv ka tf1 tf2 tf 

q1 = ListePoints(1,:);
q2 = ListePoints(2,:);
q3 = ListePoints(3,:);

D1 = q2-q1;
D2 = q3-q2;
D = D1+D2;
step = 100;

tf1 = max (3*abs(D1)/(8*kv),sqrt(10*abs(D1/ka*sqrt(3))));
tf2 = max (3*abs(D2)/(8*kv),sqrt(10*abs(D2/ka*sqrt(3))));
tf = tf1+tf2;
t1 = tf1;

t=0:tf/(step-1):tf;

for i=1:length(t)
    ti=t(i);     
while (tf>t1)  
    tf = tf-0.1;
    tf1 = tf1 - 0.05;
% count = count+1;
% if (count == 2000)
%     return
% end
if (ti<tf)
a = -(2*(q1*tf^5 + 9*q1*tf1^5 - q2*tf^5 - 9*q3*tf1^5 - 15*q1*tf*tf1^4 + 15*q3*tf*tf1^4 + 5*q1*tf^2*tf1^3 - 5*q3*tf^2*tf1^3))/(tf^5*tf1^3*(tf^3 - 3*tf*tf1^2 + 2*tf1^3));
b = (3*(q1*tf^6 + 6*q1*tf1^6 - q2*tf^6 - 6*q3*tf1^6 - 15*q1*tf^2*tf1^4 + 8*q1*tf^3*tf1^3 + 15*q3*tf^2*tf1^4 - 8*q3*tf^3*tf1^3))/(tf^5*tf1^3*(tf^3 - 3*tf*tf1^2 + 2*tf1^3));
c = -(15*(q1 - q3))/tf^4;
d = -(q1*tf^6 - 10*q1*tf1^6 - q2*tf^6 + 10*q3*tf1^6 + 24*q1*tf*tf1^5 - 24*q3*tf*tf1^5 - 15*q1*tf^2*tf1^4 + 15*q3*tf^2*tf1^4)/(tf^3*tf1^3*(tf^3 - 3*tf*tf1^2 + 2*tf1^3));    
    
qc = a*ti^6+b*ti^5+c*ti^4+d*ti^3+q1;    
qcd = 6*a*ti^5 + 5*b*ti^4 + 4*c*ti^3 + 3*d*ti^2;
qcdd = 30*a*ti^4 + 20*b*ti^3 + 12*c*ti^2 + 6*d*ti; 
end

if (qcd(1) == kv(1))
    return
end
if (qcd(2) == kv(2))
    return
end
if (qcdd(1) == ka(1))
    return
end
if (qcdd(2) == ka(2))
    return
end
end  %end of while loop
end  %end of for loop