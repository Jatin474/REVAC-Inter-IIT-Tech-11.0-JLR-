%This function provides the angles each joint has to move such that the
%manipulator reaches the desired position and orientation.
%PARAMETERS:
%Tf - transformation matrix from ground frame to required frame
%a1,a2,a3,a4,a5,a6 - Link lengths of the manipulator

function[thetas] = sol6dof(Tf,a1,a2,a3,a4,a5,a6)
    nx=Tf(1,1);ny=Tf(2,1);nz=Tf(3,1);
    ox=Tf(1,2);oy=Tf(2,2);oz=Tf(3,2);
    ax=Tf(1,3);ay=Tf(2,3);az=Tf(3,3);
    px=Tf(1,4);py=Tf(2,4);pz=Tf(3,4);
    t1=atan2(py,px); %2nd solution +pi
    t234=atan2(az,(cos(t1)*ax+sin(t1)*ay)); %t2+t3+t4, also +pi
    c3=((px*cos(t1)+py*sin(t1)-cos(t234)*a4)^2+(pz-sin(t234)*a4)^2-a2^2-a3^2)/(2*a2*a3);    
    s3=sqrt(1-c3^2); %
    t3=atan2(s3,c3);
    t2=atan2(((cos(t3)*a3+a2)*(pz-sin(t234)*a4)-sin(t3)*a3*(px*cos(t1)+py*sin(t1)-cos(t234)*a4)),((cos(t3)*a3+a2)*(px*cos(t1)+py*sin(t1)-cos(t234)*a4)+sin(t3)*a3*(pz-sin(t234)*a4)));
    t4=t234-t2-t3;
    t5=atan2(cos(t234)*(cos(t1)*ax+sin(t1)*ay)+sin(t234)*az,sin(t1)*ax-cos(t1)*ay);
    t6=atan2(-sin(t234)*(cos(t1)*nx+sin(t1)*ny)+cos(t234)*nz,-sin(t234)*(cos(t1)*ox+sin(t1)*oy)+cos(t234)*oz);
    thetas={t1,t2,t3,t4,t5,t6};
end