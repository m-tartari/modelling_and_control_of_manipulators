% script pour tourner autour d une vue 3D
[az,el]=view;
angle=az;
angle1=el;
for i = 1:1:100
angle=angle+360/100;
view([angle,el]);
pause(0.001);
end;
%for i = 1:1:100
%angle1=angle1+360/100;
%view([az,angle1]);
%pause(0.001);
%end;

