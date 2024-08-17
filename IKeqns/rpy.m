%This function gives us the rotation matrix from the ground frame to the
%charging port's frame.
%xf,yf,zf - Cartesian coordinates of the port's location
%a,b,c - roll,pitch,yaw angles of the port's orientation

function[matrix] = rpy(a,b,c,xf,yf,zf)
    matrix=[cos(a)*cos(b) cos(a)*sin(b)*sin(c)-sin(a)*cos(c) cos(a)*sin(b)*cos(c)+sin(a)*sin(c) xf; sin(a)*cos(b) sin(a)*sin(b)*sin(c)+cos(a)*cos(c) sin(a)*sin(b)*cos(c)-cos(a)*sin(c) yf; -sin(b) cos(b)*sin(c) cos(b)*cos(c) zf; 0 0 0 1];
    
end