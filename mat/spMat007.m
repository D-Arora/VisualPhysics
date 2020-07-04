% spMath007.m

clear 
close all
clc

%% P2000019.htm

m1 = 3; m2 = 1;
u1 = 8/3; u2 = 2;

t = [0 6 6 12];
p1 =[ 10 6 4 0];


% GRAPHICS  =============================================================
figure()
  set(gcf,'Units','normalized');
  set(gcf,'Position',[0.5 0.1 0.30 0.25]);
    
  plot(t,p1,'linewidth',2)
  grid on
  xlabel('t  [ s ]')
  ylabel('p_A  [ N.s ]')
  set(gca,'fontsize',14)
  set(gca,'xtick',0:12);
  set(gca,'xLim',[0 12]);

%%
clear
close all
clc

A = 5;
T = 2e-3;
t = linspace(0,5e-3,200);
y = A .* cos(2*pi*t/T);

figure()
  set(gcf,'Units','normalized');
  set(gcf,'Position',[0.5 0.1 0.30 0.25]);
  
  xP = t*1e3; yP = y;
  plot(xP,yP,'b','linewidth',2)
  grid on 
 % axis off
  grid on
  set(gca,'fontsize',12)
  xlabel('time  t  [ ms ]')
  ylabel('voltage  V  [ mV ]')
  ylim([-10 10])

