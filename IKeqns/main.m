
L1=10;
L2=6;
L3=3;
%WORKSPACE IS eqn of sphere centred at 0,0,L1 radii from L2-L3 to L2+L3***********************************************************************

x=6; y=4; z=7;

ra=zeros(3,4);
ra(:,1)=[0,0,0];

%need to set the initial position
xi=3; yi=0; zi=10;
%{
thetas=solutions(xi,yi,zi,L1,L2,L3);
    t1=thetas{1};
    t2=thetas{2};
    t3=thetas{3};
    T1=[cos(t1) -sin(t1) 0 0; sin(t1) cos(t1) 0 0; 0 0 1 L1; 0 0 0 1];
    T2=[cos(t2) -sin(t2) 0 0; 0 0 -1 0; sin(t2) cos(t2) 0 0; 0 0 0 1];
    T3=[cos(t3) -sin(t3) 0 L2; sin(t3) cos(t3) 0 0; 0 0 1 0; 0 0 0 1];
    T4=[1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    ra(:,2)=T1(1:3,4);
    T5=T1*T2*T3;
    T6=T1*T2*T3*T4;
    ra(:,3)=T5(1:3,4);
    %ra(:,3)=[L2*cos(t2)*cos(t1),L2*cos(t2)*sin(t1),L2*sin(t2)+L1];
    ra(:,4)=T6(1:3,4);
    plot(ra);
    pause(0.1);
%}
v1=[xi,yi,zi]; %test trajectory
v2=[x,y,z];
v=[v2;v1];

for t=xi:0.1:x
    xt=t;yt=(y/(x-xi))*(t-xi);zt=zi+((z-zi)/(x-xi))*(t-xi);
    thetas=solutions(xt,yt,zt,L1,L2,L3);
    t1=thetas{1};
    t2=thetas{2};
    t3=thetas{3};
    T1=[cos(t1) -sin(t1) 0 0; sin(t1) cos(t1) 0 0; 0 0 1 L1; 0 0 0 1];
    T2=[cos(t2) -sin(t2) 0 0; 0 0 -1 0; sin(t2) cos(t2) 0 0; 0 0 0 1];
    T3=[cos(t3) -sin(t3) 0 L2; sin(t3) cos(t3) 0 0; 0 0 1 0; 0 0 0 1];
    T4=[1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    ra(:,2)=T1(1:3,4);
    T5=T1*T2*T3;
    T6=T1*T2*T3*T4;
    ra(:,3)=T5(1:3,4);
    ra(:,4)=T6(1:3,4);
    plotpath(ra,v);
    pause(0.1);
end


%NOW WE NEED TO LOOK AT 2DOF PROBLEM

%{
    Tf=[a_1 b_1 c_1  P_1;
        a_2 b_2 c_2  P_2;
        a_3 b_3 c_3  P_3;
        0  0  0   1];
%}
%{
xf=9;yf=5;zf=7;
a=0.785398;b=0.785398;c=0.785398; %roll; pitch; yaw;
L4=6;L5=3;

Tf=rpy(a,b,c,xf,yf,zf);
thetas2=solutions2(T6,Tf,L4,L5);
t4=thetas2{1};
t5=thetas2{2};
%%{
T5a=[cos(t4) 0 -sin(t4) L4*cos(t4);sin(t4) 0 cos(t4) L4*sin(t4);0 -1 0 0;0 0 0 1];
T6a=[cos(t5) 0 sin(t5) L5*cos(t5);sin(t5) 0 -cos(t5) L5*sin(t5);0 1 0 0;0 0 0 1];

Tmult1=T6*T5a;
Tmult2=T6*T5a*T6a;
%hello=Tmult1(1:3,4);
ahello=Tmult2(1:3,4);%what matters-should be equal to xf yf zf
%plot(ra)
%}
%NOW WE NEED TO LOOK AT LINEAR MOVEMENT
%}

%TEST VARIABLES
%{
l2f=sqrt((ra(1,2)-ra(1,3))^2+(ra(2,2)-ra(2,3))^2+(ra(3,2)-ra(3,3))^2);
l3f=sqrt((ra(1,3)-ra(1,4))^2+(ra(2,3)-ra(2,4))^2+(ra(3,3)-ra(3,4))^2);
t1=thetas{1};
t2=thetas{2};
t3=thetas{3};
xs=cos(t1)*cos(t2+t3)*L3+cos(t1)*cos(t2)*L2;
ys=sin(t1)*cos(t2+t3)*L3+sin(t1)*cos(t2)*L2;
zs=sin(t2+t3)*L3+sin(t2)*L2+L1;
%}
