hold on;
axis([-1.5 1.5 -1.5 1.5]);
for indice=1:1:nbsolution

q1m=qsol(3*(indice-1)+1);
q2m=qsol(3*(indice-1)+2);
q3m=qsol(3*(indice-1)+3);

% Trace des origine des reperes
O1=[0;0];
O2=[cos(q1m)*L1;sin(q1m)*L1];
O3=[cos(q1m)*L1+cos(q2m+q1m)*L2;sin(q1m)*L1+sin(q2m+q1m)*L2];
OE=[cos(q1m)*L1+cos(q2m+q1m)*L2+cos(q3m+q2m+q1m)*L3;sin(q1m)*L1+sin(q2m+q1m)*L2+sin(q3m+q2m+q1m)*L3];
plot(O1(1),O1(2),'ro');
plot(O2(1),O2(2),'ro');
plot(O3(1),O3(2),'ro');
plot(OE(1),OE(2),'ro');

%premier segment du robot
xmin=O1(1);
xmax=O2(1);
pas=(xmax-xmin)/1000;
x1=0:pas:cos(q1m)*L1;
y1=tan(q1m)*x1;
plot(x1,y1,'y');

%deuxieme segment du robot
xmin=O2(1);
xmax=O3(1);
pas=(xmax-xmin)/1000;

x2=O2(1):pas:O2(1)+cos(q1m+q2m)*L2;
y2=tan(q1m+q2m)*(x2-O2(1));

y2=y2+O2(2);
plot(x2,y2,'m');

%troisieme segment du robot
xmin=O3(1);
xmax=OE(1);
pas=(xmax-xmin)/1000;

x3=O3(1):pas:O3(1)+cos(q1m+q2m+q3m)*L3;
y3=tan(q1m+q2m+q3m)*(x3-O3(1));

y3=y3+O3(2);
plot(x3,y3,'c');

pause

end;


