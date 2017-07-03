function qd = calculate_qd(q, setpoint, L)

% Control parameter
Kv = 1;

%% Get Brocket and Jacobian
% Brocket
[H1 H2 H3] = getHmatrices(q, L);

% Jacobian
J = getJacobian(q, L);

%% Inverse Kinematics
% Current position
p_0 = H3(1:3, 4);
% Get target velocity
pd = Kv * (setpoint - p_0);
% Move frame of Jacobian
AdH04 = adj('z', 0, p_0);
J4 = inv(AdH04) * J;
% Velocity Jacobian
Jv = J4(4:6, :);
% Pseudo Inverse Jacobian Velocity
Jvp = Jv' * inv(Jv * Jv');
% Calculate qd from using Jacobian
qd = Jvp * pd;

end
