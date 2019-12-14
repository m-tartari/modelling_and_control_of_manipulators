function Q = inter_arti_d5(u)
global ListePoints tf

qi = ListePoints(1,:);
qf = ListePoints(2,:);
D = qf-qi;

% find qc qcd

if (u<tf)
    r = 10*(u/tf)^3 - 15*(u/tf)^4 +6* (u/tf)^5;
    qc= qi + r*D;
    qcd = ((30*u^2)/tf^3 - (60*u^3)/tf^4 + (30*u^4)/tf^5)*D;
else
    qc=qf;
    qcd=zeros(size(qc));
end

Q = [qc(1), qcd(1), qcd(2), qc(2)];

