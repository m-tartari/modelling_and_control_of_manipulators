% test for the function[Q, err,k, m ]=IGMDIFF3R(Xd)
clear all
clc

Xd =[ 0.6     0.4     1.3;
         -0.5     0.9     0.7;
          0.7     0.0     0.8;
          2.9    -0.4     0.8];
      
for i=1:1:4
X_desired= Xd(i,:)'
[Q, err,k, m ]=IGMDIFF3R(Xd(i,:))
if err==0
    X_verify = DGM3R(Q)
end
end