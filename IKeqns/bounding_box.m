L1=8.5;L2=7.63; L3=7.12; L4=2.43; L5=0; L6=0;
%L1=8.5; L2=7.63; L3=7.12; L4=;
a=0.785398;b=0.785398;c=0.785398;
iter2=1;
t1i=0;t2i=0.717;t3i=0.643;t4i=1.025;t5i=0;t6i=0;
o1=t1i;o2=t2i;o3=t3i;o4=t4i;o5=t5i;o6=t6i;
Tnot=55;
for i=8:0.5:12
    for j=-7:0.5:3
        for k=-3.5:0.5:3.5% 5-8.5 12-8.5
            %first half
            d=0.5;
            cpoint=transform([i;j;k],[d;0;0],a,b,c);
            xff=cpoint(1,1);yff=cpoint(2,1);zff=cpoint(3,1);
            Tf=rpy(a,b,c,xff,yff,zff);
            iter=1;
            thetas=sol6dof(Tf,L1,L2,L3,L4,L5,L6);
            t1=thetas{1};t2=thetas{2};t3=thetas{3};t4=thetas{4};t5=thetas{5};t6=thetas{6};
            for t=0:0.1:Tnot
                tt1=t1i+(t1-t1i)*(6*((t/Tnot)^5)-15*((t/Tnot)^4)+10*((t/Tnot)^3));
                tt2=t2i+(t2-t2i)*(6*((t/Tnot)^5)-15*((t/Tnot)^4)+10*((t/Tnot)^3));
                tt3=t3i+(t3-t3i)*(6*((t/Tnot)^5)-15*((t/Tnot)^4)+10*((t/Tnot)^3));
                tt4=t4i+(t4-t4i)*(6*((t/Tnot)^5)-15*((t/Tnot)^4)+10*((t/Tnot)^3));
                tt5=t5i+(t5-t5i)*(6*((t/Tnot)^5)-15*((t/Tnot)^4)+10*((t/Tnot)^3));
                tt6=t6i+(t6-t6i)*(6*((t/Tnot)^5)-15*((t/Tnot)^4)+10*((t/Tnot)^3));
                omega(1,iter)=((tt1-o1)/0.1)*(180/pi);
                omega(2,iter)=((tt2-o2)/0.1)*(180/pi);
                omega(3,iter)=((tt3-o3)/0.1)*(180/pi);
                omega(4,iter)=((tt4-o4)/0.1)*(180/pi);
                omega(5,iter)=((tt5-o5)/0.1)*(180/pi);
                omega(6,iter)=((tt6-o6)/0.1)*(180/pi);
                o1=tt1;o2=tt2;o3=tt3;o4=tt4;o5=tt5;o6=tt6;
                iter=iter+1;
            end
            testvar1=(max(abs(omega)));%%
            testvar1(1,1)=0;
            testvars1(1,iter2)=max(testvar1);
            %second half
            xf=i;yf=j;zf=k;
            xi=0;
            num=round((xf-xi)/0.1);
            wpts=[xff,(xff+xf)/2,xf; yff,(yff+yf)/2,yf; zff,(zff+zf)/2,zf];
            %[q,qd,qdd,tvec,pp] = trapveltraj(wpts,100,PeakVelocity=0.6);
            omegas2=zeros(6,100);
            thetainits=thetas;
            for p=1:1:99
                Tf=rpy(a,b,c,q(1,p),q(2,p),q(3,p));
                thetas=sol6dof(Tf,L1,L2,L3,L4,L5,L6);
                omegas2(1,p)=(thetas{1}-thetainits{1})/(tvec(1,p+1)-tvec(1,p))*180/pi;
                omegas2(2,p)=(thetas{2}-thetainits{2})/(tvec(1,p+1)-tvec(1,p))*180/pi;
                omegas2(3,p)=(thetas{3}-thetainits{3})/(tvec(1,p+1)-tvec(1,p))*180/pi;
                omegas2(4,p)=(thetas{4}-thetainits{4})/(tvec(1,p+1)-tvec(1,p))*180/pi;
                omegas2(5,p)=(thetas{5}-thetainits{5})/(tvec(1,p+1)-tvec(1,p))*180/pi;
                omegas2(6,p)=(thetas{6}-thetainits{6})/(tvec(1,p+1)-tvec(1,p))*180/pi;
                thetainits=thetas;
            end
            testvar2=(max(abs(omegas2)));
            testvars2(1,iter2)=max(testvar2);
            iter2=iter2+1;
        end
    end
end
max=max(testvars1);
max2=max(testvars2);