clear all;

pi = pi();

q = [pi/2; pi/2; 0];

L1 = 3;
L2 = 2;
L3 = 1;

% Hee(0)
T = [0;0;L1+L2+L3];
Hee = [
    eye(3)      T;
    zeros(1,3)  1
];

% Unit twist
T1 = [0; 0; 1;    0; 0; 0];
T2 = [1; 0; 0;    0; L1; 0];
T3 = [1; 0; 0;    0; L1+L2; 0];

[stat tT1] = tildeTwist(T1);
[stat tT2] = tildeTwist(T2);
[stat tT3] = tildeTwist(T3);

% Brocket Eq
Heeq = expm(tT1*q(1))*expm(tT2*q(2))*expm(tT3*q(3))*Hee;
