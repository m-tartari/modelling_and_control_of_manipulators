function IT = InvTransHom(T)
%--------------------------------------------------------------------------
% #####################################################
% #                                                   #
% #   Procedure d inversion d une matrice de          #
% #          transformation homogene                  #
% #                                                   #
% #   Entree : Matrice de transformation homogene 4x4 #
% #   Sortie : Matrice de transformation homogene 4x4 #
% #                            T=( R  p)              #
% #                              (000 1)              #
% #                           IT=( Rt  -Rt*p)         #
% #                              (000    1  )         #
% #####################################################
%--------------------------------------------------------------------------



% Rotation extraction
R = T(1:3, 1:3); 
    
% Translation extraction
P = T(1:3, 4);
    

% inverse rotation
IR = R'; % transpose R

% translation transformation
IP = -IR * P;

% result composition
IT =  [IR, IP; 0, 0, 0, 1];

%IT=[ IR(1,1), IR(1,2), IR(1,3), IP(1,1);
%     IR(2,1), IR(2,2), IR(2,3), IP(2,1);
%    IR(3,1), IR(3,2), IR(3,3), IP(3,1);
%         0,       0,       0, 1;    ];

end


