%% Settings and parameters
clear all
close all

% Is the real robot connected?
realRobotOutput = false;
plotRobot = true;
% Serial port for robot: find out what name the port has
com_port = '/dev/tty.usbmodem1421'; % UNIX example
% com_port = 'COM3'; % Windows example

%
% Better not change the settings below
%

% ROBOT PARAMETERS
l1 = 5;
l2 = 12.5;
l3 = 12.5;
robot_params=[l1 l2 l3];

% control loop parameters
T = 0.04;
t_end = 20;


%% Connect to robot
% do not change this section
if realRobotOutput
    % Create the arm and connect to it
    arm = ArmInterface();
    res = arm.open(com_port);
    pause(1.5) % Give matlab the time to open the serial port.

    % Retrieve the arm firmware version and print it.
    v = arm.get_version();
    disp(['Arm firmware version: ' num2str(v(1)) '.' num2str(v(2))])
    pause(2)
end

%% Initialise
% Do not change this section, unless you change the trajectory
% Initial values of joint angles
q=[0.0144 0.41 2.3]';

if realRobotOutput
    % Slowly move to starting position
    qstart = arm.get_q()';
    for i=1:50
        arm.set_q(qstart + (q-qstart)*i/50);
        pause(0.04);
    end
end
%% Control loop
t = 0;
N = round(t_end / T);
q_robot = [0,0,0];
q_robot_old = [0,0,0];

qd = [0;0;0];

log_Xsp = [];
log_Ysp = [];
log_Zsp = [];
log_Xm = [];
log_Ym = [];
log_Zm = [];
log_t = [];

%figure(2);
%figX = animatedline;
%aX = gca;
%figure(3);
%figY = animatedline;
%aY = gca;
%figure(4);
%figZ = animatedline;
%aZ = gca;

tic
for i=1:N
    % while loop to wait for timing
	while toc < T
	end
    dt = toc;     % Real loop time
    tic           % reset timer
    t = t + dt;   % save time (real time of the loop)
    
    % Euler integration of angles
    q = q + dt*qd;
 
    % Move the real robot
    if realRobotOutput
        arm.set_q(q);
    end
    
    % Generate setpoint
    % DEFAULT SETPOINT
    x = 8*cos(1*t);
    y = -15;
    z = 8+ 6*sin(2*t);
    
    setpoint=[x;y;z];
    
    % Calculate desired angle speeds
    qd = calculate_qd(q, setpoint, robot_params);
    
    % Calculate all the frames of the real robot
    if realRobotOutput
        [q_robot_new, succes]= arm.get_q(); % Get robot position
            if succes
                q_robot_old=q_robot;
                q_robot=q_robot_new;
            else
                q_robot=q_robot_old;
            end
    else
        q_robot = [0,0,0];
    end
    
    % Get simulated and real robot configuration
    [H1_0, H2_0, H3_0] = getHmatrices(q, robot_params);
    [rH1_0, rH2_0, rH3_0] = getHmatrices(q_robot,robot_params);
    
    % Log Data
    log_Xsp = [log_Xsp x];
    log_Ysp = [log_Ysp y];
    log_Zsp = [log_Zsp z];
    log_Xm = [log_Xm H3_0(1,4)];
    log_Ym = [log_Ym H3_0(2,4)];
    log_Zm = [log_Zm H3_0(3,4)];
    log_t = [log_t t];
    % Plot the robot
    if plotRobot
        plot_robot3(x,y,z,H1_0,H2_0,H3_0,rH1_0,rH2_0,rH3_0);

        % 2D plot
        %addpoints(figX, t, H3_0(1,4)-x);
        %addpoints(figY, t, H3_0(2,4)-y);
        %addpoints(figZ, t, H3_0(3,4)-z);

        %aX.XLim = [t-1 t];
        %aY.XLim = [t-1 t];
        %aZ.XLim = [t-1 t];
        %drawnow
    end
   
end

%[tlog, dXlog] = getpoints(figX);

figure(2)
hold on
plot(log_t, log_Xsp)
plot(log_t, log_Xm)
hold off
figure(3)
hold on
plot(log_t, log_Ysp)
plot(log_t, log_Ym)
hold off
figure(4)
hold on
plot(log_t, log_Zsp)
plot(log_t, log_Zm)
hold off


%% De-init
pause(0.5)
if realRobotOutput
    % Slowly move to starting position
    qstart = arm.get_q();
    for i=1:50
        arm.set_q(qstart*(1-i/50));
        pause(0.04);
    end
end
