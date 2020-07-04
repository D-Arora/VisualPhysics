% sPMat002.m
% Relative Velocity

clc
close all
clear all


tMin = 0;
tMax = 100;
Nt = 101;
vAx = 2;
vAy = 4;
vBx = 3;
vBy = 1;


vA = sqrt(vAx^2+vAy^2);
thetaAv = atan2d(vAy,vAx);

vB = sqrt(vBx^2+vBy^2);
thetaBv = atan2d(vBy,vBx);

t = linspace(tMin,tMax,Nt);
dt = t(2)-t(1);

sAx = vAx .* t;
sAy = vAy .* t;
sA = sqrt(sAx.^2+sAy.^2);

sBx = vBx .* t;
sBy = vBy .* t;
sB = sqrt(sBx.^2+sBy.^2);

% Final displacements  (Event #2)
sAx2 = sAx(end);
sAy2 = sAy(end);
sA2 = sqrt(sAx2^2 + sAy2^2);
thetaA2 = atan2d(sAy2,sAx2);

sBx2 = sBx(end);
sBy2 = sBy(end);
sB2 = sqrt(sBx2^2 + sBy2^2);
thetaB2 = atan2d(sBy2,sBx2);

% OUTPUTS ==============================================================
disp('  ');
fprintf('vA_x  =  %3.2f m/s \n',vAx);
fprintf('vA_y  =  %3.2f m/s \n',vAy);
fprintf('vA  =  %3.2f m/s \n',vA);
fprintf('thetaA_v  =  %3.2f deg \n',thetaAv);
disp('  ');
fprintf('vB_x  =  %3.2f m/s \n',vBx);
fprintf('vB_y  =  %3.2f m/s \n',vBy);
fprintf('vB  =  %3.2f m/s \n',vB);
fprintf('thetab_v  =  %3.2f deg \n',thetaBv);
disp('  ');
fprintf('sAx2  =  %3.2f m \n',sAx2);
fprintf('sAy2  =  %3.2f m \n',sAy2);
fprintf('sA2  =  %3.2f m \n',sA2);
fprintf('thetA2  =  %3.2f deg \n',thetaA2);
disp('  ');
fprintf('sAx2  =  %3.2f m \n',sAx2);
fprintf('sAy2  =  %3.2f m \n',sAy2);
fprintf('sA2  =  %3.2f m \n',sA2);
fprintf('thetA2  =  %3.2f deg \n',thetaA2);

disp('  ');
fprintf('sBx2  =  %3.2f m \n',sBx2);
fprintf('sBy2  =  %3.2f m \n',sBy2);
fprintf('sB2  =  %3.2f m \n',sB2);
fprintf('thetB2  =  %3.2f deg \n',thetaB2);


% GRAPHICS ==============================================================

figure(1)   % Paths of system a and B     1111111111111111111111111111111
set(gcf,'Units','normalized');
set(gcf,'Position',[0.025 0.2 0.22 0.32]);
hold on

xP = sAx(1:10:end); yP = sAy(1:10:end);
hPlot = plot(xP,yP,'o');
plot(xP,yP,'r','linewidth',1);
set(hPlot,'Markersize',5,'MarkerFaceColor','r');
set(hPlot,'Markersize',5,'MarkerEdgeColor','r');

xP = sBx(1:10:end); yP = sBy(1:10:end);
hPlot = plot(xP,yP,'o');
plot(xP,yP,'b','linewidth',1);
set(hPlot,'Markersize',5,'MarkerFaceColor','b');
set(hPlot,'Markersize',5,'MarkerEdgeColor','b');

grid on
axis([0 400 0 400]);
axis square
%set(gca,'xTick',-5:5);
%set(gca,'yTick',-5:5);

set(gca,'fontsize',14);
xlabel('X  [m]','fontsize',14);
ylabel('Y  [m]','fontsize',14);
box on


figure(3)   % s / t graph 333333333333333333333333333333333333333333333333
set(gcf,'Units','normalized');
set(gcf,'Position',[0.25 0.2 0.22 0.32]);
hold on

xP = t; yP = sA;

plot(xP,yP,'r','linewidth',2);

yP = sB;
plot(xP,yP,'b','linewidth',2);

grid on
%axis([0 100 0 5]);
%axis square
%set(gca,'xTick',0:20:100);
%set(gca,'yTick',-5:5);

set(gca,'fontsize',14);
xlabel('t  [s]','fontsize',14);
ylabel('displacement (mag)  [m]','fontsize',14);
legend('A','B','location','south');
box on

figure(4)   % v / t graph   444444444444444444444444444444444444444444444
set(gcf,'Units','normalized');
set(gcf,'Position',[0.48 0.2 0.22 0.32]);
hold on

xP = [0 t(end)]; yP = [vA vA];

plot(xP,yP,'r','linewidth',2);

yP = [vB vB];
plot(xP,yP,'b','linewidth',2);

grid on
axis([0 100 0 5]);
axis square
set(gca,'xTick',0:20:100);
%set(gca,'yTick',-5:5);

set(gca,'fontsize',14);
xlabel('t  [s]','fontsize',14);
ylabel('velocity (mag)  [m/s]','fontsize',14);
legend('A','B','location','south');
box on


figure(5)   % v graph   5555555555555555555555555555555555555555555555555
set(gcf,'Units','normalized');
set(gcf,'Position',[0.48 0.6 0.22 0.32]);
hold on

xP = [0 vAx]; yP = [0 vAy];

plot(xP,yP,'r','linewidth',2);

xP = [0 vBx]; yP = [0 vBy];
plot(xP,yP,'b','linewidth',2);

grid on
axis([0 4 0 4]);
axis square
%set(gca,'xTick',0:20:100);
%set(gca,'yTick',-5:5);

set(gca,'fontsize',14);
xlabel('v_x  [m/s]','fontsize',14);
ylabel('v_y  [m/s]','fontsize',14);
legend('A','B','location','east');
box on


% ========================================================================
% ANIMATION
% ========================================================================

% flag: 0 animated gif NOT saved or 1 saved /  file name
   f_gif = 0;
   ag_name = 'ag_reMot01.gif';
% Delay in seconds before displaying the next image  
   delay = 0.1;  
% Frame counter start
   nt = 1; 


figure(2)
set(gcf,'Units','normalized');
set(gcf,'Position',[0.71 0.2 0.22 0.32]);
grid on

t1 = 't  =  '; t3 = '  s';
%set(gca,'xTick',0:10:100);
%set(gca,'yTick',-5:5);



for c = 1 : Nt
   xP = sAx(c); yP = sAy(c);
   hPlot = plot(xP,yP,'o');
   set(hPlot,'Markersize',8,'MarkerFaceColor','r');
   set(hPlot,'Markersize',8,'MarkerEdgeColor','r'); 
   hold on
   xP = sBx(c); yP = sBy(c);
   hPlot = plot(xP,yP,'o');
   set(hPlot,'Markersize',8,'MarkerFaceColor','b');
   set(hPlot,'Markersize',8,'MarkerEdgeColor','b'); 
   hold off
   
   xlabel('X  [m]','fontsize',14);
   ylabel('Y  [m]','fontsize',14);
   
   t2 = num2str(t(c),'%3.0f');
   tm = [t1 t2 t3];
   title(tm);
   
   box on
   axis square
   axis([0 400 0 400]);
   set(gca,'fontsize',14);
   grid on
   pause(0.1)
 
     if f_gif > 0 
          frame = getframe(2);
          im = frame2im(frame);
          [imind,cm] = rgb2ind(im,256);
     %  On the first loop, create the file. In subsequent loops, append.
          if nt == 1
            imwrite(imind,cm,ag_name,'gif','DelayTime',delay,'loopcount',inf);
          else
           imwrite(imind,cm,ag_name,'gif','DelayTime',delay,'writemode','append');
          end
       nt = nt+1;
     end
end
   

   if f_gif > 0 
      frame = getframe(2);
      im = frame2im(frame);
      [imind,cm] = rgb2ind(im,256);
     %  On the first loop, create the file. In subsequent loops, append.
      if nt == 1
          imwrite(imind,cm,ag_name,'gif','DelayTime',delay,'loopcount',inf);
       else
         imwrite(imind,cm,ag_name,'gif','DelayTime',delay,'writemode','append');
      end
       nt = nt+1;
   end
