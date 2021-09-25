clear all; close all; clc;

% - perhaps frequency could match a ODE, undamped driven oscillator?
% - look into connections with Bluff Body 
% - new non-dimensional groups needed
% - 
%% 

% BEGIN Script for Dimensional Analysis

%%
clear all; close all; clc;


dat1 = load('bjet_2D_sngl-data.txt');
dat2 = load('bjet_2D_dble-data.txt');

rho0   = 0.162594;
rhoinf = 1.171961;
g      = 9.8;
U      = 1.0;

w1 = dat1(:,1);
f1 = dat1(:,3);

Ri1 = (1-rho0/rhoinf)*g*w1/U^2;
St1 = f1.*w1/U;

w2 = dat2(:,1);
s2 = dat2(:,2);
f2 = dat2(:,3);

lc = 'w';
fc = 'k';

Ri2 = (1-rho0/rhoinf)*g*w2/U^2;
St2 = f2.*w2/U;

St_norm = zeros(size(St2));

% Iterate over all double jet cases
for i=1:length(St_norm)
    St_sngl = 0.68*Ri2(i)^0.45;
    St_norm(i) = St2(i)/St_sngl;
    St_dble = (0.68*(2*Ri2(i))^0.45)/2;
end

A2  = (s2 - w2) ./w2;



figure

scatter(A2,St_norm,50.0,w2,'filled')
hold on;
grid on;
box on;
clrs = colormap(parula(9));

%set(gca,'xscale', 'log','yscale', 'log') THIS ONE
cbar = colorbar;
ylabel(cbar,'Width [m]','interpreter','latex')
cbar.Color = lc;
% for i=1:6
%     plot([1,3], [f1(i),f1(i)], '--', 'color', clrs(i,:),'linewidth',1.5)
%     plot([0.05,0.1], [f1(2*i+4),f1(2*i+4)], '-.', 'color', clrs(i,:),'linewidth',1.5)
% end
plot([1,3], [1,1], '--', 'color', lc,'linewidth',1.5)
plot([0.01,0.1], [1,1]*St_dble/St_sngl, '-.', 'color', lc,'linewidth',1.5)
% plot(Ax,0.6*Ax.^(-0.3),'r--')
hold off;
%xlim([0.02,3]) THIS ONE
%title('(St_sn / St_dble) as a function of Non-Dimesional Number ((s - w) / w)','interpreter','latex')
xlabel('$(S-W)/W$','interpreter','latex')
ylabel('$St/St_s$','interpreter','latex')
set(gca,'FontName','Times','XColor',lc,'YColor',lc,'ZColor',lc,'Color',fc)
set(gcf,'Color',fc,'PaperPositionMode','auto','InvertHardCopy','off')
print(gcf,'-dpng','-r600','asymptotic.png')

%% 

clear all; close all; clc;

dat = load('bjet_2D_dble_clean-data.txt');
dat2 = load('bjet_2D_dble-data.txt');

ind05 = dat(:,1) == 0.05;
wid05 = abs(dat(ind05,:));

ind06 = dat(:,1) == 0.06;
wid06 = abs(dat(ind06,:));

ind07 = dat(:,1) == 0.07;
wid07 = abs(dat(ind07,:));

ind08 = dat(:,1) == 0.08;
wid08 = abs(dat(ind08,:));

ind09 = dat(:,1) == 0.09;
wid09 = abs(dat(ind09,:));

ind10 = dat(:,1) == 0.10;
wid10 = abs(dat(ind10,:));

ind11 = dat(:,1) == 0.11;
wid11 = abs(dat(ind11,:));

ind12 = dat(:,1) == 0.12;
wid12 = abs(dat(ind12,:));

ind13 = dat(:,1) == 0.13;
wid13 = abs(dat(ind13,:));

crit_wid05_col = find ((wid05(:,7)) > ((3 * pi)/4));
crit_wid05 = wid05(crit_wid05_col(1),2);

crit_wid06_col = find ((wid06(:,7)) > ((3 * pi)/4));
crit_wid06 = wid06(crit_wid06_col(1),2);

crit_wid07_col = find ((wid07(:,7)) > ((3 * pi)/4));
crit_wid07 = wid07(crit_wid07_col(1),2);

crit_wid08_col = find ((wid08(:,7)) > ((3 * pi)/4));
crit_wid08 = wid08(crit_wid08_col(2),2);

crit_wid09_col = find ((wid09(:,7)) > ((3 * pi)/4));
crit_wid09 = wid09(crit_wid09_col(1),2);

crit_wid10_col = find ((wid10(:,7)) > ((3 * pi)/4));
crit_wid10 = wid10(crit_wid10_col(1),2);

crit_wid11_col = find ((wid11(:,7)) > ((3 * pi)/4));
crit_wid11 = wid11(crit_wid11_col(1),2);

crit_wid12_col = find ((wid12(:,7)) > ((3 * pi)/4));
crit_wid12 = wid12(crit_wid12_col(1),2);

crit_wid13_col = find ((wid13(:,7)) > ((3 * pi)/4));
crit_wid13 = wid13(crit_wid13_col(1),2);


widths = [0.05, 0.06, 0.07, 0.08, 0.09, 0.10, 0.11, 0.12, 0.13];
crit_spac = [crit_wid05, crit_wid06, crit_wid07, crit_wid08, crit_wid09, crit_wid10, crit_wid11, crit_wid12, crit_wid13];

figure(1) 
plot( (crit_spac - widths), widths)
set(gca,'xscale', 'log','yscale', 'log')
xlabel("critical spacing - widths")
ylabel("widths")




