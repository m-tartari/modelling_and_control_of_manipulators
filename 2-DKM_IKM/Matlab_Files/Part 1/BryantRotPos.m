function X = BryantRotPos (Ttot)
%this function extract pos and rot from an homogeneous transformation
%matrix according to the Bryant angles convention

% Extraction des coordonnees operationnelles (cosinus-directeur)
sx = Ttot(1,1);
nx = Ttot(1,2);
ax = Ttot(1,3);
Px = Ttot(1,4);
sy = Ttot(2,1);
ny = Ttot(2,2);
ay = Ttot(2,3);
Py = Ttot(2,4);
sz = Ttot(3,1);
nz = Ttot(3,2);
az = Ttot(3,3);
Pz = Ttot(3,4);

% Configuration of the robot
tetax = atan2(-ay, az);
ctx = cos(tetax);
stx = sin(tetax);
tetay = atan2(ax, -ay * stx + az * ctx);
tetaz = atan2(ctx * ay + stx * sz, ctx * ny + stx * nz);

X = [Px Py Pz tetax tetay tetaz];