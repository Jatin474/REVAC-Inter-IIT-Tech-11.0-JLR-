Tf=rpy(0.785,0.785,0.785,1,1,1);

T_offset=[1 0 0 -0.3;
          0 1 0  0;
          0 0 1  0;
          0 0 0  1];

T_offset2=[1 0 0 0.3;
          0 1 0  0;
          0 0 1  0;
          0 0 0  1];

a1=0;
a2=0.76325;
a3=0.70822;
a4=0.31253;

T_use=Tf*T_offset;

thetas=sol6dof(T_use,0,0.76325,0.70822,0.31253,0,0);

t1=thetas{1};
t2=thetas{2};
t3=thetas{3};
t4=thetas{4};
t5=thetas{5};
t6=thetas{6};

T1= [cos(t1) 0 sin(t1) 0;
    sin(t1) 0 -cos(t1) 0;
    0 1 0 0;
    0 0 0 1];

T2= [cos(t2) -sin(t2) 0 cos(t2)*a2;
    sin(t2) cos(t2) 0 sin(t2)*a2;
    0 0 1 0;
    0 0 0 1];

T3= [cos(t3) -sin(t3) 0 cos(t3)*a3;
    sin(t3) cos(t3) 0 sin(t3)*a3;
    0 0 1 0;
    0 0 0 1];

T4= [cos(t4) 0 -sin(t4) cos(t4)*a4;
    sin(t4) 0 cos(t4) sin(t4)*a4;
    0 -1 0 0;
    0 0 0 1];

T5= [cos(t5) 0 sin(t5) 0;
    sin(t5) 0 -cos(t5) 0;
    0 1 0 0;
    0 0 0 1]; 

T6= [cos(t6) -sin(t6) 0 0;
    sin(t6) cos(t6) 0 0;
    0 0 1 0;
    0 0 0 1];

T_test=T1*T2*T3*T4*T5*T6*T_offset2;

assert(T_test(1,1)==Tf(1,1));
assert(T_test(1,2)==Tf(1,2));
assert(T_test(1,3)==Tf(1,3));
assert(T_test(1,4)==Tf(1,4));

assert(T_test(2,1)==Tf(2,1));
assert(T_test(2,2)==Tf(2,2));
assert(T_test(2,3)==Tf(2,3));
assert(T_test(2,4)==Tf(2,4));


assert(T_test(3,1)==Tf(3,1));
assert(T_test(3,2)==Tf(3,2));
assert(T_test(3,3)==Tf(3,3));
assert(T_test(3,4)==Tf(3,4));
