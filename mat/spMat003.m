% spMath003.m

clear all
close all
clc

% RIVER DIMENSIONS -------------------------------------------------------
  Np = 100;
  Lx = 500;
  Ly = 100;
  X = Lx .* rand(Np,1);
  Y = 2 + (Ly-2) .* rand(Np,1);

  
% TIME SCALES  -----------------------------------------------------------
  tMin = 0;
  tMax= 100;
  Nt = 100;
  t = linspace(tMin,tMax,Nt);
  t1 = 't  =  '; t3 = '  s';


% VELOCITIES ------------------------------------------------------------- 
% river velocity  
   v_WSx = 2;  v_WSy = 0;


% initial position of boat
   xB = 250; yB = 0;    
 
% boat velocity w.r.t. water
   v_BWx = -2;
   v_BWy = 1;

% boat velocity w.r.t. shore
   v_BSx = v_BWx + v_WSx;
   v_BSy = v_BWy + v_WSy;


% ========================================================================
% ANIMATION
% ========================================================================

% flag: 0 animated gif NOT saved or 1 saved /  file name
   f_gif = 0;
   ag_name = 'ag_Boat4.gif';
% Delay in seconds before displaying the next image  
   delay = 0.2;  
% Frame counter start
   nt = 1; 
  
   
% GRAPHICS  =============================================================
figure(1)
  set(gcf,'Units','normalized');
  set(gcf,'Position',[0.025 0.2 0.6 0.25]);
   
   for c = 1 : Nt
     hold off
     X(X>Lx) = 0;  
     X = X + v_WSx; 
     xP = X; yP = Y;
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',2,'MarkerFaceColor','b');
     set(hPlot,'Markersize',2,'MarkerEdgeColor','b');
     
     hold on
     xP = [0 Lx]; yP = [0 0];
     plot(xP,yP,'g','linewidth',8);
     xP = [0 Lx]; yP = [Ly Ly];
     plot(xP,yP,'g','linewidth',8);
     
     xP = xB; yP = yB;
     hPlot = plot(xP,yP,'o');
     set(hPlot,'Markersize',8,'MarkerFaceColor','r');
     set(hPlot,'Markersize',8,'MarkerEdgeColor','r');
     
     yB = yB + v_BSy;
     yB(yB > Ly) = Ly;
    % if yB == Ly
     %    xB(xB > Lx) = Lx;
    % else
         xB = xB + v_BSx;
    % end    
     axis equal
     axis([0 Lx 0 Ly]);
     box on
     grid on
     set(gca,'fontsize',14);
     set(gca,'yTick',0:25:100);
     
     t2 = num2str(t(c),'%3.0f');
     tm = [t1 t2 t3];
     title(tm);
     pause(0.1)
    
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