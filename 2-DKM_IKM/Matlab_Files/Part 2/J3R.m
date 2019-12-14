function J = J3R(q)
    L1 = 0.6;
    L2 = 0.5;
    L3 = 0.3;
    S1 = sin(q(1));
    S12 = sin(q(1) + q(2));
    S123 = sin(q(1) + q(2) + q(3));
    C1 = cos(q(1));
    C12 = cos(q(1) + q(2));
    C123 = cos(q(1) + q(2) + q(3));
    J = [-L1*S1-L2*S12-L3*S123, -L2*S12-L3*S123, -L3*S123;
            L1*C1+L2*C12+L3*C123, L2*C12+L3*C123, L3*C123;
            1,1,1];
end