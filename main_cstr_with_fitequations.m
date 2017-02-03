function main_cstr_with_fitequations
clear all
clc
close all

set(0,'DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',10)
set(0,'DefaultAxesFontSize',14);
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultTextFontSize',14);
set(0,'DefaultAxesFontWeight','bold');

global tau R K1 K2 Q1 Q2 delH den CP C_Ai C_Ri Ti

%----------------------------Parameters---------------------------------%
tau = 60 ;      % Time constant of the reactor (sec)

R = 1.987;      % Arrehinus constant (cal mol^-1 K^-1)

K1 = 5*10^3;    % Kinetic constant of the forward reaction (sec^-1)

K2 = 1*10^6;    % Kinetic constant of the backward reaction (sec^-1)

Q1 = 1*10^4;    % Kinetic factor of the forward rection (cal mol^-1)

Q2 = 1.5*10^4;  % Kinetic factor of the backward reactoin (cal mol^-1)

delH = -5*10^3; % enthalpy of reaction (cal mol^-1)

den = 1;        % density

CP = 1*10^3;    % Specific heat capacity (cal kg^-1 K^-1)


%----------------------------Parameters---------------------------------%

%-----------Initial Operating Conditions--------------------------------%
% C_Ai = 1;        % feed concentration of species A (mol/lit)
    
C_Ri = 0;        % feed concentration of species B (mol/lit)
C_Ai = 1;
%-----------Initial Operating Conditions--------------------------------%

k=0;
%--------Each iteration will change the grid of Ti, resulting in a------%
%-------------------------different output------------------------------%
%-----------------Build a grid search for Ti----------------------------%
count=0;
p = sobolset(9);
X0 = [600*net(p,1000)];
tic
% for i=1:1000;
% for a = 0:50:150;
%     for b = 0:50:150;
%         b
%         for c = 0:50:150;
%             for d = 50:50:200;
%                 for e = 100:50:250;
%                     for f = 200:50:350;
%                         for g = 200:50:350;
%                             for h = 300:50:450;
%                                 for kk = 300:50:450;
                             
        Ti = [0 0 150 200 400 400 400 400 400 400]; 
%         Ti=[X0(i,1:9) 400];
%         Ti = [a b c d e f g h kk 400];
        count=count+1;
        size(Ti,2);
        % Ti = 699.2305;
%         tic
        [t,X] = ode15s('cstr_dynamics',[0 500],[0.8461 0.1539 700]);
        Ti_save=zeros(size(t));
        for i=1:size(Ti,2);
            Ti_save(i)=Ti(i);
        end

        tosave = [t,X,Ti_save];
        csvwrite(strcat('C:\Users\Neal\Desktop\Data_gen3\data',num2str(count),'.csv'),tosave);
        
% end

        
        
%                                 end
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
toc

x_save = X
t_save = t
figure(1);
subplot(2,2,1),plot(t,X(:,1),'r'); grid on;
xlabel('Time(seconds)');
ylabel('C_A');


subplot(2,2,2),plot(t,X(:,2),'b'); grid on;
xlabel('Time(seconds)');
ylabel('C_R');

subplot(2,2,3),plot(t,X(:,3),'k'); grid on;
xlabel('Time(seconds)');
ylabel('T_R');

% CA = X(end,1)
% 
% CR = X(end,2)
% 
% TR = X(end,3)
% for i=1:1:500
%     if(i>90)
%         Ti_plot(i)=Ti(10);
%     elseif(i>80)
%         Ti_plot(i)=Ti(9);
%     elseif(i>70)
%         Ti_plot(i)=Ti(8);
%     elseif(i>60)
%         Ti_plot(i)=Ti(7);
%     elseif(i>50)
%         Ti_plot(i)=Ti(6);
%     elseif(i>40)
%         Ti_plot(i)=Ti(5);
%     elseif(i>30)
%         Ti_plot(i)=Ti(4);
%     elseif(i>20)
%         Ti_plot(i)=Ti(3);
%     elseif(i>10)
%         Ti_plot(i)=Ti(2);
%     elseif(i>0)
%         Ti_plot(i)=Ti(1);
%     end
% end

% t1 = 1:1:500;
% subplot(2,2,4),plot(t1,Ti_plot,'r:'); grid on;
% xlabel('Time(seconds)');
% ylabel('T_i (Manipulated Input)');
%---------------------- Save outputs and Inputs ------------------------%
% toc
end
%%


