function xdot = cstr_dynamics(t,x)

global tau R K1 K2 Q1 Q2 delH den CP C_Ai C_Ri Ti
Ti_1=0;
if(t<10)
    Ti_1 = Ti(1);
elseif(t<20)
    Ti_1 = Ti(2);
elseif(t<30)
    Ti_1 = Ti(3);
elseif(t<40)
    Ti_1 = Ti(4);
elseif(t<50)
    Ti_1 = Ti(5);
elseif(t<60)
    Ti_1 = Ti(6);
elseif(t<70)
    Ti_1 = Ti(7);
elseif(t<80)
    Ti_1 = Ti(8);
elseif(t<90)
    Ti_1 = Ti(9);
elseif(t>=90)
    Ti_1 = Ti(10);
% elseif(t>55 && t <= 60)
%     Ti_1 = Ti(11);
% elseif(t>60 && t <= 65)
%     Ti_1 = Ti(12);
% elseif(t>65 && t <= 70)
%     Ti_1 = Ti(13);
% elseif(t>70 && t <= 75)
%     Ti_1 = Ti(14);
% elseif(t>75 && t <= 80)
%     Ti_1 = Ti(15);
% elseif(t>80 && t <= 85)
%     Ti_1 = Ti(16);
% elseif(t>85 && t <= 90)
%     Ti_1 = Ti(17);
% elseif(t>90)
%     Ti_1 = 400;
end

dCadt = (C_Ai-x(1))/tau - (K1*exp(-1*Q1/(R*x(3))))*x(1) + (K2*exp(-1*Q2/(R*x(3))))*x(2);
dCrdt = (C_Ri-x(2))/tau + (K1*exp(-1*Q1/(R*x(3))))*x(1) - (K2*exp(-1*Q2/(R*x(3))))*x(2);
dTdt = (-1*delH/(den*CP)) * ((K1*exp(-1*Q1/(R*x(3))))*x(1)-(K2*exp(-1*Q2/(R*x(3))))*x(2)) + (Ti_1 - x(3))/tau;

xdot = [dCadt;dCrdt;dTdt];
end