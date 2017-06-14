clear all;

pi = pi();

q = [0; pi/2; 0];

L1 = 3;
L2 = 2;
L3 = 1;

% Homogenous Transformation Matrix
% Joint1
P = [0;0;0];
H10_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Joint2
P = [0;0;L1];
H20_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Joint3
P = [0;0;L1+L2];
H30_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% End Effector
P = [0;0;L1+L2+L3];
Hee0_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Unit twist
T10_0 = [0; 0; 1;    0; 0; 0];
T21_0 = [1; 0; 0;    0; L1; 0];
T32_0 = [1; 0; 0;    0; L1+L2; 0];

[stat tT10_0] = tildeTwist(T10_0);
[stat tT21_0] = tildeTwist(T21_0);
[stat tT32_0] = tildeTwist(T32_0);

% Brocket Eq
H10_q  = expm(tT10_0*q(1)) * H10_0;
H20_q  = expm(tT10_0*q(1)) * expm(tT21_0*q(2)) * H20_0;
H30_q  = expm(tT10_0*q(1)) * expm(tT21_0*q(2)) * expm(tT32_0*q(3)) * H30_0;
Hee0_q = expm(tT10_0*q(1)) * expm(tT21_0*q(2)) * expm(tT32_0*q(3)) * Hee0_0;
