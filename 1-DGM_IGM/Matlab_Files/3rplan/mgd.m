% Compute DGM of a 3R planar robot
% input section

disp('entrer les valeurs articulaires');
q1=input('q1 = ');
q2=input('q2 = ');
q3=input('q3 = ');
q=[q1;q2;q3];

% To be modified
Px = L1*cos(q1)+L2*cos(q1+q2)+L3*cos(q1+q2+q3); 
Py = L1*sin(q1)+L2*sin(q1+q2)+L3*sin(q1+q2+q3);
alpha = q1+q2+q3;


% Displaying the results
xf=[Px;Py;alpha]

qsol=q

nbsolution=1



