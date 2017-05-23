clear all;

q = [0; 0; 0];

L1 = 1;
L2 = 2;
L3 = 3;

% Initial transformation matrix
H1 = [
eye(3)      [0;0;L1];
zeros(1,3)  1
];

H2 = [
eye(3)      [L2;0;L1];
zeros(1,3)  1
];

H3 = [
eye(3)      [L2+L3;0;L1];
zeros(1,3)  1
];

% Unit twist
T1 = [0; 0;  1; 0; 0; 0];
T2 = [0; -1; 0; L1; 0; L2];
T3 = [0; -1; 0; 0; 0; 0];

[stat tT1] = tilde(T1);
[stat tT2] = tilde(T2);
[stat tT3] = tilde(T3);

% Brocket Eq
H1q = expm(tT1*q(1))*H1;
H2q = expm(tT1*q(1))*expm(tT2*q(2))*H2;
H3q = expm(tT1*q(1))*expm(tT2*q(2))*expm(tT3*q(3))*H3;
