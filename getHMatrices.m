clear all;

pi = pi();

q = [0; 0; 0];

L1 = 1;
L2 = 2;
L3 = 3;

%% Initial transformation matrix
% H1
theta = pi/2;
R = [
    cos(theta)   0   sin(theta);
    0            1   0;
    -sin(theta)  0   cos(theta)
];
T = [L1;0;0];

H1 = [
    R           T;
    zeros(1,3)  1
];

% H2
theta = pi()/2;
R = [
    cos(theta)   0   sin(theta);
    0            1   0;
    -sin(theta)  0   cos(theta)
];
T = [L2;0;0];
H2 = [
    R           T;
    zeros(1,3)  1
];

% H3
T = [L2+L3;0;L1];
H3 = [
    R          T;
    zeros(1,3)  1
];

% Unit twist
T1 = [0; 0;  1; 0; 0; 0];
T2 = [0; 0; 0; 1; 0; 0];
T3 = [0; -1; 0; 0; 0; 0];

[stat tT1] = tildeTwist(T1);
[stat tT2] = tildeTwist(T2);
[stat tT3] = tildeTwist(T3);

% Brocket Eq
H1q = expm(tT1*q(1))*H1;
H2q = expm(tT1*q(1))*expm(tT2*q(2))*H2;
H3q = expm(tT1*q(1))*expm(tT2*q(2))*expm(tT3*q(3))*H3;
