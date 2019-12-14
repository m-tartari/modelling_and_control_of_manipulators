function T0Tn = DHSym(alpha, d, theta, r)
%--------------------------------------------------------------------------
% This function calculates the symbolic transformation matrix for the 
% Direct Geometric Model for the 6 links Cartesian Robot with a 3dof concurrent wrist.

%This function can be transformed into a general one with the parameters of the robots as arguments: 
%function T0Tn =  
%and the sigma, alpha, d, theta, r should be defined as symbols as follows for the first three degrees of stanford robot with 3 dof

% syms RL2 t1 t2 r3
% alpha = sym([0;-pi/2;pi/2]);
% sigma = sym([0;0;1]);
% theta = sym([0;0;0]);
% d = sym([0;0;0]);
% r = sym([0;RL2;r3]);


%--------------------------------------------------------------------------
n = length(alpha);

T0Tn = eye(4);


% Calculates the transformation matrix for the current link.
for j = n:-1:1
   
    Ct = cos(theta(j));
    St = sin(theta(j));
    Ca = cos(alpha(j));
    Sa = sin(alpha(j));
    
    T = [Ct, -St, 0, d(j);
         Ca*St, Ca*Ct, -Sa, -r(j)*Sa;
         Sa*St, Sa*Ct, Ca, r(j)*Ca; 
         0, 0, 0, 1];

    IT = InvTransHom(T);

    % to display intemediate matrices, may be commented out
    T;
    IT;
    T0Tn = (T*T0Tn);
end

T0Tn;

end


