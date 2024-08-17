%This function gives us the point from which we plan the insertion
%operation of the plug.
%PARAMETERS:
%ppoint: location of the charging port (A 3X1 matrix - [x;y;z])
%distance: offset from ppoint to cpoint (A 3X1 matrix - [offset;0;0])
%a,b,c: roll, pitch and yaw angles of the charging port's orientation
%cpoint: required point (A 3X1 matrix - [x;y;z])

function[cpoint] = transform(ppoint,distance,a,b,c)
    rotmat=[cos(a)*cos(b) cos(a)*sin(b)*sin(c)-sin(a)*cos(c) cos(a)*sin(b)*cos(c)+sin(a)*sin(c); sin(a)*cos(b) sin(a)*sin(b)*sin(c)+cos(a)*cos(c) sin(a)*sin(b)*cos(c)-cos(a)*sin(c); -sin(b) cos(b)*sin(c) cos(b)*cos(c)];
    cpoint=ppoint-rotmat*distance;
end