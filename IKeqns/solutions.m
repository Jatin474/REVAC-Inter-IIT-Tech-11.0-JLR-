%multiple solutions have to be taken care of
function[thetas] = solutions(x,y,z,L1,L2,L3)
    t1=atan2(y,x);
    c3=(x^2+y^2+z^2-(L1^2+L2^2+L3^2)-2*L1*(z-L1))/(2*L2*L3);
    %s3=sqrt(1-c3^2);
    t3=acos(c3); 
    %t2 eqn required, t2+t3
    %t2=atan2((z-L1)*(cos(t1)-sin(t1)),(x-y))-atan2(sin(t3)*L3,((cos(t3)*L3)+L2));%incorrect
    a=atan2(z-L1,sqrt(x^2+y^2));
    b=acos((L1^2+L2^2-L3^2-2*z*L1+x^2+y^2+z^2)/(2*L2*sqrt(x^2+y^2+z^2+L1^2-2*z*L1)));
    t2=a-b;
    thetas={t1,t2,t3};
end