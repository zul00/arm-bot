function [H10 H20 H30 Hee0] = getHMatrices(q, L)

% Homogenous Transformation Matrix
% Joint1
P = [0 0 0]';
H10_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Joint2
P = [0 0 L(1)]';
H20_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Joint3
P = [0 0 L(1)+L(2)]';
H30_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% End Effector
P = [0 0 L(1)+L(2)+L(3)]';
Hee0_0 = [
    eye(3)      P;
    zeros(1,3)  1
];

% Unit twist
T10_0 = [0   0   1   0  0          0]';
T21_0 = [1   0   0   0  L(1)       0]';
T32_0 = [1   0   0   0  L(1)+L(2)  0]';

tT10_0 = tildeTwist(T10_0);
tT21_0 = tildeTwist(T21_0);
tT32_0 = tildeTwist(T32_0);

% Brocket Eq
H10  = expm(tT10_0*q(1)) * H10_0;
H20  = expm(tT10_0*q(1)) * expm(tT21_0*q(2)) * H20_0;
H30  = expm(tT10_0*q(1)) * expm(tT21_0*q(2)) * expm(tT32_0*q(3)) * H30_0;
Hee0 = expm(tT10_0*q(1)) * expm(tT21_0*q(2)) * expm(tT32_0*q(3)) * Hee0_0;
end
