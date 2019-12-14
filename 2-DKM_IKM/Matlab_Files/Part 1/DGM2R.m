function X = DGM2R(L1,L2,q)
    X = [L1*cos(q(1))+L2*cos(q(1)+q(2))
         L1*sin(q(1))+L2*sin(q(1)+q(2))];
end