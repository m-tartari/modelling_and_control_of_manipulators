function X = DGM3R(q)

L1 = 0.6;
L2 = 0.5;
L3 = 0.3;

    Xpos = [L1*cos(q(1))+L2*cos(q(1)+q(2))+L3*cos(q(1)+q(2)+q(3))
                  L1*sin(q(1))+L2*sin(q(1)+q(2))+L3*sin(q(1)+q(2)+q(3))];
    alpha = q(1) + q(2) + q(3);
    X = [Xpos(1) Xpos(2) alpha];
end