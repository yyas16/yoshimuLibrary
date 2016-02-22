% show figures

%  position
figure 
subplot(3,1,1)
plot(tout, pos(:,1),'r')
xlabel('Time [s]')
ylabel('Position [km]')

subplot(3,1,2)
plot(tout, pos(:,2),'g')
xlabel('Time [s]')
ylabel('Position [km]')

subplot(3,1,3)
plot(tout, pos(:,3),'b')
xlabel('Time [s]')
ylabel('Position [km]')

% 3D position
figure
plot3(pos(:,1), pos(:,2), pos(:,3))
xlabel('X [km]')
ylabel('Y [km]')
grid on
axis equal

% velocity
figure 
subplot(3,1,1)
plot(tout, vel(:,1),'r')
xlabel('Time [s]')
ylabel('Velocity [km/s]')

subplot(3,1,2)
plot(tout, vel(:,2),'g')
xlabel('Time [s]')
ylabel('Velocity [km/s]')

subplot(3,1,3)
plot(tout, vel(:,3),'r')
xlabel('Time [s]')
ylabel('Velocity [km/s]')

% velocity norm
figure
plot(tout, sqrt(vel(:,1).^2+vel(:,2).^2))
xlabel('Time [s]')
ylabel('Velocity norm [km/s]')



