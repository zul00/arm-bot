clear all;

% Robot parameter
q  = [pi/2 pi/2 0]';
L  = [3  2  1];

% Target
p_sp = [0 0 0]';

%% Get Brocket and Jacobian
% Brocket
[H1 H2 H3 He] = getHMatrices(q, L);

% Jacobian
J = getJacobian(q, L);

%% Control
% Current position
p_e = He(1:3, 4);
% Get target velocity
%pd_e = Kv * (p_sp - 
