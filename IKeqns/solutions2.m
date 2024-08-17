function[thetas] = solutions2(Ti,Tf,l4,l5)
%{
    Ti=[a1 b1 c1  P1;
        a2 b2 c2  P2;
        a3 b3 c3  P3;
        0  0  0   1];

    Tf=[a_1 b_1 c_1  P_1;
        a_2 b_2 c_2  P_2;
        a_3 b_3 c_3  P_3;
        0  0  0   1];
%}
    a1=Ti(1,1);a2=Ti(2,1);a3=Ti(3,1);
    b1=Ti(1,2);b2=Ti(2,2);b3=Ti(3,2);
    c1=Ti(1,3);c2=Ti(2,3);c3=Ti(3,3);
    P1=Ti(1,4);P2=Ti(2,4);P3=Ti(3,4);

    a_1=Tf(1,1);a_2=Tf(2,1);a_3=Tf(3,1);
    b_1=Tf(1,2);b_2=Tf(2,2);b_3=Tf(3,2);
    c_1=Tf(1,3);c_2=Tf(2,3);c_3=Tf(3,3);
    P_1=Tf(1,4);P_2=Tf(2,4);P_3=Tf(3,4);
    
    %WHAT IS K
    %2*pi*k - 
    % + 2*pi*k
    theta4= 2*atan((a1 + (a1^2 + b1^2 - b_1^2)^(1/2))/(b1 + b_1));
    theta5= 2*atan((c1*l5 + (c1^2*l5^2 - P_1^2 - P1^2 + 2*P1*P_1 - a1^2*l4^2*cos(theta4)^2 + a1^2*l5^2*cos(theta4)^2 - b1^2*l4^2*sin(theta4)^2 + b1^2*l5^2*sin(theta4)^2 - 2*P1*a1*l4*cos(theta4) + 2*P_1*a1*l4*cos(theta4) - 2*P1*b1*l4*sin(theta4) + 2*P_1*b1*l4*sin(theta4) - 2*a1*b1*l4^2*cos(theta4)*sin(theta4) + 2*a1*b1*l5^2*cos(theta4)*sin(theta4))^(1/2))/(P1 - P_1 + a1*l4*cos(theta4) - a1*l5*cos(theta4) + b1*l4*sin(theta4) - b1*l5*sin(theta4)));
    thetas={theta4,theta5};
end