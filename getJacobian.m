clear all

q  = [pi/2    ;0   ;0];
qd = [0    ;0   ;1];

L = [6  5  4]';

%% Unit twist
% Body 1
w1 = [0  0  1]'; 
r1 = [0  0  0]';
T1 = [w1; cross(r1, w1)];

% Body 2
w2 = [cos(q(1))  -sin(q(1))  0]';
r2 = [0  0  L(1)]';1
T2 = [w2; cross(r2, w2)];

% Body 3
w3 = w2;
r3 = [L(2)*sin(q(1))*sin(q(2))  -L(2)*cos(q(1))*sin(q(2))  L(1)+L(2)*cos(q(2))]';
T3 = [w3; cross(r3, w3)];

%% Jacobian
J = [T1 T2 T3];

%% Test Jacobian
Tq = J * qd;
