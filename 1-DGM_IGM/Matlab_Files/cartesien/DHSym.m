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
     
%       if theta(j) == pi/2 || theta(j) ==-pi/2
%     T(1,1)= 0;
%     T(2,2)= 0;
%     T(3,2)= 0;
%     end
%    if theta(j)== pi|| theta(j)== -pi
%     T(1,2)= 0;
%     T(2,1)= 0;
%     T(3,1)= 0;
%    end
%      
%    if alpha(j) == pi/2 ||alpha(j) ==-pi/2
%     T(2,1)= 0;
%     T(2,2)= 0;
%     T(3,3)= 0;
%     T(3,4)= 0;
%     end
%    if alpha(j)== pi||alpha(j)== -pi
%     T(2,3)= 0;
%     T(2,4)= 0;
%     T(3,1)= 0;
%     T(3,2)= 0;
%    end

    IT = InvTransHom(T);

    % to display intemediate matrices, may be commented out
   % T
  %  IT
  %  T0Tn = simplify(T*T0Tn);
    T0Tn = (T*T0Tn);

end

T0Tn;

end


