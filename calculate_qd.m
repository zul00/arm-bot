clear all;

% Robot parameter
q  = [0  pi/2  0]';
L  = [3  2  1];

% Control parameter
Kv = 1;
p_sp = [0 0 6]';

%% Get Brocket and Jacobian
% Brocket
[H1 H2 H3 He] = getHMatrices(q, L);

% Jacobian
J = getJacobian(q, L);

%% Control
% Current position
p_0 = He(1:3, 4);
% Get target velocity
pd = Kv * (p_sp - p_0);
% Move frame of Jacobian
AdH04 = adj('z', 0, p_0);
J4 = inv(AdH04) * J;
% Velocity Jacobian
Jv = J4(4:6, :);
% Pseudo Inverse Jacobian Velocity
Jvp = Jv' * inv(Jv * Jv');
% Calculate qd from using Jacobian
qd = Jvp * pd;
