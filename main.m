clear all;


q  = [pi/2 pi/2 0]';
qd = [1  0  0]';
L  = [3  2  1];

% Brocket
[H10 H20 H30 Hee0] = getHMatrices(q, L);

% Jacobian
J = getJacobian(q, L);

% Test Jacobian
Tq = J * qd;
