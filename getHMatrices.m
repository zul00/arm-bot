clear all;

pi = pi();

q = [0; pi/2; 0];

L1 = 3;
L2 = 2;
L3 = 1;

% Hee(0)
P = [0;0;L1+L2+L3];
Hee0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Unit twist
T100 = [0; 0; 1;    0; 0; 0];
T210 = [1; 0; 0;    0; L1; 0];
T320 = [1; 0; 0;    0; L1+L2; 0];

[stat tT100] = tildeTwist(T100);
[stat tT210] = tildeTwist(T210);
[stat tT320] = tildeTwist(T320);

% Brocket Eq
Heeq = expm(tT100*q(1)) * expm(tT210*q(2)) * expm(tT320*q(3)) * Hee0;
