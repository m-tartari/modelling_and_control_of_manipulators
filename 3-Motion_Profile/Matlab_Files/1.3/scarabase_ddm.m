% (********************************************)
% (** SYMORO+ : SYmbolic MOdelling of RObots **)
% (**========================================**)
% (**      IRCCyN-ECN - 1, rue de la Noe     **)
% (**      B.P.92101                         **)
% (**      44321 Nantes cedex 3, FRANCE      **)
% (**      www.irccyn.ec-nantes.fr           **)
% (********************************************)


%    Name of file : C:\Appli\symoro\Robots\scara\scarabase.ddm




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




%  Direct Calculation of the Joints Accelerations

% Equations:

% Declaration of the function
function QDPOINT=scarabase_ddm(u )

t2=u(4);
QP1=u(5);
QP2=u(6);
GAM2=u(2);
GAM1=u(1);

% Declaration of global input variables
%global t2 QP1 QP2 L1 MX2 MY2 ZZ2 GAM2 FV2 FS2
%global ZZ1R GAM1 FV1 FS1

% Declaration of global output variables
%global QDP1 QDP2
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
	W32=QP1 + QP2;
	JPR132=L1.*S2;
	JPR232=C2.*L1;
	SW12=-(MX2.*W32.^2);
	SW22=-(MY2.*W32.^2);
	LW12=-(C2.*L1.*QP1.^2);
	LW22=L1.*QP1.^2.*S2;
	JD2=1./ZZ2;
	JU32=JD2.*ZZ2;
	JU42=-(JD2.*MY2);
	JU52=JD2.*MX2;
	GW2=GAM2 - FV2.*QP2 - FS2.*sign(QP2);
	GK332=ZZ2 - JU32.*ZZ2;
	GK342=-MY2 + JU32.*MY2;
	GK352=MX2 - JU32.*MX2;
	GK432=-MY2 - JU42.*ZZ2;
	GK442=JU42.*MY2;
	GK452=-(JU42.*MX2);
	GK532=MX2 - JU52.*ZZ2;
	GK542=JU52.*MY2;
	GK552=-(JU52.*MX2);
	NG32=GK342.*LW12 + GK352.*LW22;
	NG42=GK442.*LW12 + GK452.*LW22;
	NG52=GK542.*LW12 + GK552.*LW22;
	VS32=GW2.*JU32 + NG32;
	VS42=GW2.*JU42 + NG42;
	VS52=GW2.*JU52 + NG52;
	AP42=SW12 + VS42;
	AP52=SW22 + VS52;
	GX332=GK332 + GK432.*JPR132 + GK532.*JPR232;
	GX342=GK342 + GK442.*JPR132 + GK542.*JPR232;
	GX352=GK352 + GK452.*JPR132 + GK552.*JPR232;
	TKT332=GX332 + GX342.*JPR132 + GX352.*JPR232;
	MJE331=TKT332 + ZZ1R;
	VBE31=-(AP42.*JPR132) - AP52.*JPR232 - VS32;
	JD1=1./MJE331;
	GW1=GAM1 - FV1.*QP1 + VBE31 - FS1.*sign(QP1);
	QDP1=GW1.*JD1;
	VR42=LW12 + JPR132.*QDP1;
	VR52=LW22 + JPR232.*QDP1;
	GU2=JU32.*QDP1 + JU42.*VR42 + JU52.*VR52;
	QDP2=-GU2 + GW2.*JD2;


% *=*
% Number of operations : 35 '+' or '-', 56 '*' or '/'

QDPOINT=[QDP1;QDP2];