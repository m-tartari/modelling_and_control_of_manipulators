function J_0n = genjac(sigma, alpha, d, theta, r,q)
%J_0N = genjac(sigma, alpha, d, theta, r)
%
%

%% Compute the T0Tn
T0n = DHSym(alpha, d, theta, r);

%% Compute the every colmn of J0n

J_0n = eye(6);	%Initialize J_0n
Pn=T0n(1:3,4);

for k = 1: length(alpha) % loop length of input times
         AlphaK = alpha(1:k);
         DK = d(1:k);
         ThetaK = theta(1:k);
         R = r(1:k);
         T_0K = DHSym(alpha(1:k), d(1:k), theta(1:k), R(1:k)); %obtain k^th Transformation matrix

        % find ak and pk
         ak= T_0K(1:3,3);
         Pk=T_0K(1:3,4);         

         P=Pn-Pk;
         SigmaK = sigma(k);
         TSigmaK = 1-SigmaK;
        %% compute kth column of J_0N
          Jk=[SigmaK * ak + (TSigmaK) * cross(ak,P); (TSigmaK)*ak];
       
         J_0n(:,k)     =       Jk;
end

J_0n