function[] = plotpath(ra,vo,x,y,z)
        plot3(ra(1,:),ra(2,:),ra(3,:),'k -o','LineWidth',1.5);
        hold on;
        plot3(vo(:,1),vo(:,2),vo(:,3),'r');
        hold on;
        plot3(x(:),y(:),z(:)+8.5,'.');
        xlabel("X");
        ylabel("Y");
        zlabel("Z");
        grid on;
        box on;
        axis equal;
        hold off;
        %view(0,0);
        view(45,45);
end

