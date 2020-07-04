% spMath003.m

clear all
close all
clc


  g = 9.8;
  
% EVENT 1: intial values for Systems A  B  C
  sx_1 = [0 0 0]; sy_1 = [0 44.1 44.1];
  vx_1 = [10 0 10]; vy_1 = [0 0 0];
  ax = [0 0 0]; ay = [0 -g -g];
  
    
% TIME SCALES  -----------------------------------------------------------
  tMin = 0;
  tMax = 3;
  Nt = 101;
  t = linspace(tMin,tMax,Nt);
  t1 = 't  =  '; t3 = '  s';
  dt = t(2) - t(1);

% VELOCITY & DSIPLACEMENT CALCULATIONS -----------------------------------
  vx = zeros(3,Nt); sx = zeros(3,Nt);
  vy = zeros(3,Nt); sy = zeros(3,Nt);

  for c = 1 : 3
    vx(c,:) = vx_1(c) + ax(c) .* t;
    vy(c,:) = vy_1(c) + ay(c) .* t;
    sx(c,:) = sx_1(c) + vx_1(c).* t + 0.5 .* ax(c) .* t.^2;
    sy(c,:) = sy_1(c) + vy_1(c).* t + 0.5 .* ay(c) .* t.^2;
  end

figure(1)
  set(gcf,'Units','normalized');
  set(gcf,'Position',[0.025 0.1 0.3 0.4]);
  Ns = 10;
hold on
xP = sx(3,:); yP = sy(3,:);
plot(xP,yP,'b','linewidth',2)
xP = sx(3,1:Ns:end); yP = sy(3,1:Ns:end);
hPlot = plot(xP,yP,'o','linewidth',2);
set(hPlot,'Markersize',5,'MarkerFaceColor','b');
set(hPlot,'Markersize',5,'MarkerEdgeColor','b')

xP = sx(2,:); yP = sy(2,:);
plot(xP,yP,'r','linewidth',2)
xP = sx(2,1:Ns:end); yP = sy(2,1:Ns:end);
hPlot = plot(xP,yP,'o','linewidth',2);
set(hPlot,'Markersize',5,'MarkerFaceColor','r');
set(hPlot,'Markersize',5,'MarkerEdgeColor','r')

xP = sx(1,:); yP = sy(1,:);
plot(xP,yP,'m','linewidth',2)
xP = sx(1,1:Ns:end); yP = sy(1,1:Ns:end);
hPlot = plot(xP,yP,'o','linewidth',2);
set(hPlot,'Markersize',5,'MarkerFaceColor','m');
set(hPlot,'Markersize',5,'MarkerEdgeColor','m')

grid on
axis([0 50 0 50]);
axis equal
set(gca,'xlim',[0 50]);
set(gca,'xTick',0:10:50);
set(gca,'yTick',0:10:50);

set(gca,'fontsize',14);
xlabel('X  [m]','fontsize',14);
ylabel('Y  [m]','fontsize',14);
box on

figure(3)  % -----------------------------------------------------------
set(gcf,'Units','normalized');
set(gcf,'Position',[0.1 0.1 0.3 0.7]);
hold on
grid on
set(gca,'fontsize',14)

subplot(3,2,1);  % acceleration x
xP = t; yP = ax(1) .* ones(1,Nt);
plot(xP,yP,'k','linewidth',2)
ylabel('a_x  [m.s^2]','fontsize',12);
grid on
set(gca,'fontsize',14)
set(gca,'xLim',[0 3]);

subplot(3,2,2); % acceleration y
xP = t; yP = ay(1) .* ones(1,Nt);
plot(xP,yP,'m','linewidth',2)
hold on
xP = t; yP = ay(2) .* ones(1,Nt);
plot(xP,yP,'k','linewidth',2)
xP = t; yP = ay(3) .* ones(1,Nt);
plot(xP,yP,'k','linewidth',2)
ylabel('a_y  [m.s^2]','fontsize',12)
grid on
set(gca,'fontsize',14)
set(gca,'xLim',[0 3]);

subplot(3,2,3);  % velocity x
xP = t; yP = vx(1,:);
plot(xP,yP,'k','linewidth',2);
hold on
xP = t; yP = vx(2,:);
plot(xP,yP,'r','linewidth',2)
xP = t; yP = vx(3,:);
plot(xP,yP,'k','linewidth',2)
set(gca,'xLim',[0 3]);
ylabel('v_x  [m.s^1]','fontsize',12)
grid on
set(gca,'fontsize',14)
set(gca,'xLim',[0 3]);

subplot(3,2,4);  % velocity y
xP = t; yP = vy(1,:);
plot(xP,yP,'m','linewidth',2);
hold on
xP = t; yP = vy(2,:);
plot(xP,yP,'k','linewidth',2)
xP = t; yP = vy(3,:);
plot(xP,yP,'k','linewidth',2)
set(gca,'xLim',[0 3]);
ylabel('v_y  [m.s^1]','fontsize',12)
grid on
set(gca,'fontsize',14)

subplot(3,2,5);  % displacement x
xP = t; yP = sx(1,:);
plot(xP,yP,'k','linewidth',2);
hold on
xP = t; yP = sx(2,:);
plot(xP,yP,'r','linewidth',2)
xP = t; yP = sx(3,:);
plot(xP,yP,'k','linewidth',2)
set(gca,'xLim',[0 3]);
ylabel('s_x  [m]','fontsize',12)
grid on
set(gca,'fontsize',14)
xlabel('t  [s]','fontsize',14);
set(gca,'xLim',[0 3]);

subplot(3,2,6);  % displacement y
xP = t; yP = sy(1,:);
plot(xP,yP,'m','linewidth',2);
hold on
xP = t; yP = sy(2,:);
plot(xP,yP,'k','linewidth',2)
xP = t; yP = sy(3,:);
plot(xP,yP,'k','linewidth',2)
set(gca,'xLim',[0 3]);
ylabel('s_y  [k]','fontsize',12)
grid on
set(gca,'fontsize',14)
set(gca,'xLim',[0 3]);

xlabel('t  [s]','fontsize',14);

box on


% ========================================================================
% ANIMATION
% ========================================================================

% flag: 0 animated gif NOT saved or 1 saved /  file name
   f_gif = 1;
   ag_name = 'ag_2D_1.gif';
% Delay in seconds before displaying the next image  
   delay = 0.15;  
% Frame counter start
   nt = 1; 
  
   
% GRAPHICS  =============================================================
figure(2)
  set(gcf,'Units','normalized');
  set(gcf,'Position',[0.5 0.1 0.28 0.42]);
  t1 = ' t =  ';  t3 = '  s'; 
for c = 1 : Nt
    
     xP = sx(3,c); yP = sy(3,c);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','r');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','r');
     
     hold on
     
     xP = sx(2,c); yP = sy(2,c);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','b');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','b');
     
     xP = sx(1,c); yP = sy(1,c);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','m');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','m');
     
     xlabel('x  [m]','fontsize',14);
     ylabel('y  [m]','fontsize',14);
     t2 = num2str(t(c),'%3.1f');
     tm = [t1 t2 t3];
     title(tm);
          
     axis([0 50 0 50]);
     axis equal
     set(gca,'xlim',[0 50]);
     set(gca,'xTick',0:10:50);
     set(gca,'yTick',0:10:50);
     
     box on
     grid on
     set(gca,'fontsize',14);
     xlabel('x  [m]','fontsize',14);
     ylabel('y  [m]','fontsize',14);
   
     pause(0.01)
% 
     hold off
     
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