% (********************************************)
% (** SYMORO+ : SYmbolic MOdelling of RObots **)
% (**========================================**)
% (**      IRCCyN-ECN - 1, rue de la Noe     **)
% (**      B.P.92101                         **)
% (**      44321 Nantes cedex 3, FRANCE      **)
% (**      www.irccyn.ec-nantes.fr           **)
% (********************************************)


%    Name of file : C:\Appli\symoro\Robots\scara\scarabase.dyn




%      Geometric parameters   

% j     ant   mu    sigma gamma b     alpha d     theta r
% 1     0     1     0     0     0     0     0     t1    0
% 2     1     1     0     0     0     0     L1    t2    0



%              Inertial parameters

% j      XX     XY     XZ     YY     YZ     ZZ     MX     MY     MZ     M      Ia

% 1      0      0      0      0      0      ZZ1R   0      0      0      0      0

% 2      0      0      0      0      0      ZZ2    MX2    MY2    0      0      0



%  External forces,friction parameters, joint velocities and accelerations

% j      FX     FY     FZ     CX     CY     CZ     FS     FV     QP     QDP

% 1      0      0      0      0      0      0      FS1    FV1    QP1    QDP1

% 2      0      0      0      0      0      0      FS2    FV2    QP2    QDP2

% Base velocity, base accelerations, and gravity

% j     W0    WP0   V0    VP0   G

% 1     0     0     0     0     0

% 2     0     0     0     0     0

% 3     0     0     0     0     G3

%  Dynamic model: Newton Euler method
% Equations:

% Declaration of the function
function GAMA = scarabase_dyn(u)

t2=u(2);  %theta2
QP1=u(3); %velocity first joint q1d
QDP1=u(5); %acceleration first joint q1dd
QP2=u(4);  %velocity first joint q2d
QDP2=u(6); %acceleration second joint q2dd
L1=0.5;
L2=0.3;
ZZ1R=3.9;
ZZ2=0.25;
MX2=0.45;
MY2=0.1;
FV1=0.25;
FV2=0.1;
FS1=0;
FS2=0;
IA2=0;

% Function description:

	S2=sin(t2);
	C2=cos(t2);
	DV331=-QP1.^2;
	No31=QDP1.*ZZ1R;
	W32=QP1 + QP2;
	WP32=QDP1 + QDP2;
	DV332=-W32.^2;
	VSP12=DV331.*L1;
	VSP22=L1.*QDP1;
	VP12=C2.*VSP12 + S2.*VSP22;
	VP22=-(S2.*VSP12) + C2.*VSP22;
	F12=DV332.*MX2 - MY2.*WP32;
	F22=DV332.*MY2 + MX2.*WP32;
	No32=WP32.*ZZ2;
	N32=No32 - MY2.*VP12 + MX2.*VP22;
	FDI22=C2.*F22 + F12.*S2;
	N31=FDI22.*L1 + N32 + No31;
	GAM1=N31 + FV1.*QP1 + FS1.*sign(QP1);
	GAM2=N32 + FV2.*QP2 + FS2.*sign(QP2);


% *=*
% Number of operations : 15 '+' or '-', 23 '*' or '/'
GAMA=[GAM1;GAM2];