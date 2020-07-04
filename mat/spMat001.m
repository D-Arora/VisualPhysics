% spMat001.m

close all 
clear all
clc

Sx = [1 3 -4];
Sy = [2,-4,-3];

S = sqrt(Sx.^2 + Sy.^2)
theta = atan2d(Sy,Sx)
SQP = sqrt((Sx(2)-Sx(1))^2+(Sy(2)-Sy(1))^2)
SRQ = sqrt((Sx(3)-Sx(2))^2+(Sy(3)-Sy(2))^2)


figure(1)
hPlot = plot(Sx,Sy,'o');
grid on
axis([-5 5 -5 5]);
axis square
set(gca,'xTick',-5:5);
set(gca,'yTick',-5:5);
set(hPlot,'Markersize',10,'MarkerFaceColor','b');
set(gca,'fontsize',14);
xlabel('X  [m]','fontsize',14);
ylabel('Y  [m]','fontsize',14);


%%
close all 
clear all
clc

Sx = [40 -60 80];
Sy = [40 -80,-60];

S = sqrt(Sx.^2 + Sy.^2)
theta = atan2d(Sy,Sx)
SQP = sqrt((Sx(2)-Sx(1))^2+(Sy(2)-Sy(1))^2)
SRQ = sqrt((Sx(3)-Sx(2))^2+(Sy(3)-Sy(2))^2)


figure(1)
%hPlot = plot(Sx,Sy,'o');
grid on
axis([-100 100 -100 100]);
axis square
set(gca,'xTick',-100:20:100);
set(gca,'yTick',-100:20:100);
%set(hPlot,'Markersize',6,'MarkerFaceColor','b');
set(gca,'fontsize',12);
hold on
plot([-100 100],[0 0],'k', 'linewidth',1);
plot([0 0],[-100 100],'k', 'linewidth',1);
xlabel('X  [m]','fontsize',14);
ylabel('Y  [m]','fontsize',14);
box on

%%
close all 
clear all
clc

SxA = [0 -80 -80 60 60];
SyA = [0  0   90 90 80];

SxB = [0  0   80   80 60
    0 ];
SyB = [0 -60  -60  80 80 ];


% S = sqrt(Sx.^2 + Sy.^2)
% theta = atan2d(Sy,Sx)
% SQP = sqrt((Sx(2)-Sx(1))^2+(Sy(2)-Sy(1))^2)
% SRQ = sqrt((Sx(3)-Sx(2))^2+(Sy(3)-Sy(2))^2)


figure(1)

hold on
plot([-100 100],[0 0],'k', 'linewidth',1);
plot([0 0],[-100 100],'k', 'linewidth',1);
plot(SxA,SyA,'r','lineWidth',2.5);
plot(SxB,SyB,'b','lineWidth',2.5);

xlabel('X  [m]','fontsize',14);
ylabel('Y  [m]','fontsize',14);
grid on
axis([-100 100 -100 100]);
axis square
set(gca,'xTick',-100:20:100);
set(gca,'yTick',-100:20:100);
set(gca,'fontsize',12);

box on 

%%  m2_CEC    [2D] inelastic collision example cars
clear all
close all
clc

mA = 1200
mB = 1500
vAx = 21
vAy =0
vBx = 0
vBy = 18

mC = mA + mB

pAx = mA * vAx
pAy = mA * vAy

pBx = mB * vBx
pBy = mB * vBy

pCx = pAx + pBx
pCy = pAy + pBy

vCx = pCx / mC
vCy = pCy / mC

vC = sqrt(vCx^2 + vCy^2)

theta = atan2d(vCy,vCx)



