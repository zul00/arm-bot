function [H1 H2 H3] = getHmatrices(q, L)

%% Homogenous Transformation Matrix
% Body 1
P1   = [0 0 L(1)]';
H1_0 = [
    eye(3)      P1;
    zeros(1,3)  1
];

% Body 2
P2   = [0 0 L(1)+L(2)]';
H2_0 = [
    eye(3)      P2;
    zeros(1,3)  1
];

% Body 3
P3   = [0 0 L(1)+L(2)+L(3)]';
H3_0 = [
    eye(3)      P3;
    zeros(1,3)  1
];

% End Effector
%Pe   = [0 0 L(1)+L(2)+L(3)]';
%He_0 = [
%    eye(3)      Pe;
%    zeros(1,3)  1
%];

%% Unit twist
% Body 1
w1 = [0  0  1]';
r1 = [0  0  0]';
T1 = [w1;  cross(r1, w1)];

% Body 2
w2 = [1  0  0]';
r2 = [0  0  L(1)]';
T2 = [w2;  cross(r2, w2)];

% Body 3
w3 = [1  0  0]';
r3 = [0  0  L(1)+L(2)]';
T3 = [w3;  cross(r3, w3)];

%% Tilde operator
tT1 = tildeTwist(T1);
tT2 = tildeTwist(T2);
tT3 = tildeTwist(T3);

%% Brocket Equation
H1 = expm(tT1*q(1)) * H1_0;
H2 = expm(tT1*q(1)) * expm(tT2*q(2)) * H2_0;
H3 = expm(tT1*q(1)) * expm(tT2*q(2)) * expm(tT3*q(3)) * H3_0;
%He = expm(tT1*q(1)) * expm(tT2*q(2)) * expm(tT3*q(3)) * He_0;
end
