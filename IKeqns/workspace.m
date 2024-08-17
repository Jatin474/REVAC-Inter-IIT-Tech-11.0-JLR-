L1=8.5;L2=7.63; L3=7.12; L4=2.43; L5=0; L6=0;

t1=linspace(-pi,pi,10);
t2=linspace(-pi,pi,10);
t3=linspace(-pi,pi,10);
t4=linspace(-pi,pi,10);
t5=linspace(-pi,pi,10);
t6=linspace(-pi,pi,10);
[T1,T2,T3,T4,T5,T6]=ndgrid(t1,t2,t3,t4,t5,t6);

xM=round(cos(T1).*(cos(T2+T3+T4).*L4+cos(T2+T3).*L3+cos(T2).*L2));
yM=round(sin(T1).*(cos(T2+T3+T4).*L4+cos(T2+T3).*L3+cos(T2).*L2));
zM=round(sin(T2+T3+T4).*L4+sin(T2+T3).*L3+sin(T2).*L2);

plot3(xM(:),yM(:),zM(:)+8.5,'.')
title("Coordinates relative to mounting point");
xlabel("X");
ylabel("Y");
zlabel("Z");
%{
subplot(3,1,1);
plot(xM(:),yM(:),'.');
xlabel("X");
ylabel("Y");

subplot(3,1,2);
plot(yM(:),zM(:)+8.5,'.');
xlabel("Y");
ylabel("Z");

subplot(3,1,3);
plot(xM(:),zM(:)+8.5,'.');
xlabel("X");
ylabel("Z");
%}