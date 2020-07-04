% spMath003.m

clear all
close all
clc

% RIVER DIMENSIONS -------------------------------------------------------
  Np = 100;
  Lx1 = -20;  Lx2 = 750;
  Ly1 = -50; Ly2 = 50;
  
% TIME SCALES  -----------------------------------------------------------
  tMin = 0;
  tMax = 100;
  Nt = 101;
  t = linspace(tMin,tMax,Nt);
  t1 = 't  =  '; t3 = '  s';
  dt = t(2) - t(1);
  
% Initial Positions ------------------------------------------------------
  sAx = [0 0 0];         sAy = [0 0 0];
  sBx = [500 500 500];   sBy = [0 0 0];
    

% VELOCITIES ------------------------------------------------------------- 
  vAx = [5 5 5]; vAy = [0 0 0];
  vBx = [2 -2 -sqrt(2)]; vBy = [0 0 -sqrt(2)];


% ========================================================================
% ANIMATION
% ========================================================================

% flag: 0 animated gif NOT saved or 1 saved /  file name
   f_gif = 0;
   ag_name = 'ag_tractor1.gif';
% Delay in seconds before displaying the next image  
   delay = 0.2;  
% Frame counter start
   nt = 1; 
  
   
% GRAPHICS  =============================================================
figure(1)
  set(gcf,'Units','normalized');
  set(gcf,'Position',[0.02 0.1 0.5 0.7]);
   
   for c = 1 : Nt
     subplot(3,1,1);  k = 1;  % -----------------------------------------
     xP = sAx(k); yP = sAy(k);
     
     hPlot = plot(xP,yP,'o');  
     set(hPlot,'Markersize',8,'MarkerFaceColor','r');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','r');
     
     hold on
     xP = sBx(k); yP = sBy(k);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','b');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','b');
     hold off
     
     sAx(k) = sAx(k)  + vAx(k) * dt;
     sAy(k) = sAy(k)  + vAy(k) * dt;
     sBx(k) = sBx(k)  + vBx(k) * dt;
     sBy(k) = sBy(k)  + vBy(k) * dt;
     
     axis equal
     axis([Lx1 Lx2 Ly1 Ly2]);
     box on
     grid on
     set(gca,'fontsize',14);
     set(gca,'xTick',0:50:700);
     xlabel('x  [m]','fontsize',14);
     ylabel('y  [m]','fontsize',14);
     t2 = num2str(t(c),'%3.0f');
     tm = [t1 t2 t3];
     title(tm);
          
     subplot(3,1,2); k = 2;   % -----------------------------------------
     xP = sAx(k); yP = sAy(k);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','r');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','r');
     
     hold on
     xP = sBx(k); yP = sBy(k);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','b');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','b');
     hold off
     
     sAx(k) = sAx(k)  + vAx(k) * dt;
     sAy(k) = sAy(k)  + vAy(k) * dt;
     sBx(k) = sBx(k)  + vBx(k) * dt;
     sBy(k) = sBy(k)  + vBy(k) * dt;
     
     axis equal
     axis([Lx1 Lx2 Ly1 Ly2]);
     box on
     grid on
     set(gca,'fontsize',14);
     set(gca,'xTick',0:50:700);
     xlabel('x  [m]','fontsize',14);
     ylabel('y  [m]','fontsize',14);
     
    subplot(3,1,3); k = 3;   % -----------------------------------------
     xP = sAx(k); yP = sAy(k);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','r');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','r');
     
     hold on
     xP = sBx(k); yP = sBy(k);
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','b');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','b');
     hold off
     
     sAx(k) = sAx(k)  + vAx(k) * dt;
     sAy(k) = sAy(k)  + vAy(k) * dt;
     sBx(k) = sBx(k)  + vBx(k) * dt;
     sBy(k) = sBy(k)  + vBy(k) * dt;
     
     axis equal
     axis([Lx1 Lx2 3*Ly1 Ly2]);
     box on
     grid on
     set(gca,'fontsize',14);
     set(gca,'xTick',0:50:700);
     xlabel('x  [m]','fontsize',14);
     ylabel('y  [m]','fontsize',14); 
     
     pause(0.01)
    
 if f_gif > 0 
          frame = getframe(1);
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
   
  hold off
     
     
   
   end