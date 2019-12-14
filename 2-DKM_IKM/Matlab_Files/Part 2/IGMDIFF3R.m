function [Q, err, k, m] = IGMDIFF3R (Xd)

q1max = 2.7; 
q2max = 2.7;
q1min = -2.5;
q2min = -2.5;
q3max = 2.9; 
q3min = -2.9;

eps =   10e-10;
err = 1; 
S = 0.2;

for k = 0:500
    qc= rand(3,1);
    for m = 0:1000
        %current cartesian coordinates
        Xc = DGM3R (qc);
        dX = Xd  - Xc;
        if (max(abs(dX)) < eps)
            qd = qc;
             % angle has to be less than 2*pi   
             qd= rem(qd, 2*pi);
            if (qd(1)>q1min && qd(1)<q1max && qd(2)>q2min && qd(2)<q2max && qd(3)>q3min && qd(3)<q3max)
                Q = qd; 
                err = 0;
                K=k;
                M=m;
                return;
            end
        end
            %if dx is too big is put to 0.2 to use the differential model
            if (norm(dX)>S)
            dX = dX/norm(dX)*S;
            end 
            %updating qc 
            J=J3R(qc);
            dq=pinv(J)*dX.';
            qc=qc+dq;    
    end
end
Q=('No Solution');


            
            
            
            