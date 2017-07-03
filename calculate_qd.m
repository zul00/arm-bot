function qd = calculate_qd(q, setpoint, L)

% Control parameter
Kv = 20;

%% Get Brocket and Jacobian
% Brocket
[H1 H2 H3] = getHmatrices(q, L);

% Jacobian
J = getJacobian(q, L);

%% Inverse Kinematics
% Current position
p_0 = H3(1:3, 4);
% Get target velocity and limit the speed to 10 cm/s
pd = Kv * (setpoint - p_0);
if norm(pd) > 10
    pd = 10*(pd/norm(pd));
end
% Move frame of Jacobian
AdH04 = adj('i', 0, p_0);
J4 = inv(AdH04) * J;
% Velocity Jacobian
Jv = J4(4:6, :);
% Pseudo Inverse Jacobian Velocity
Jvp = Jv' * inv(Jv * Jv');
% Calculate qd from using Jacobian
qd = Jvp * pd;

end
