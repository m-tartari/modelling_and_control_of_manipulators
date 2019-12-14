syms A B C D
syms q1 q2 q3 tf tf1

%system of equations
eq1 = 30*A*tf^4 + 20*B*tf^3 + 12*C*tf^2 == 0
eq2 = 6*A*tf^5 + 5*B*tf^4 +4*C*tf^3 + 3*D*tf^2 == 0;
eq3 = A*tf^6 + B*tf^5 + C*tf^4 + D*tf^3 + q1 == q3;
eq4 = A*tf1^6 + B*tf1^5 + C*tf1^4 + D*tf1^3 + q1 == q2;

%solve
sol = solve ([eq1, eq2, eq3, eq4], [A, B, C, D]);
a = sol.A
b = sol.B
c = sol.C
d = sol.D




