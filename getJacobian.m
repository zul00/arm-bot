clear all

%q    X     ;Y      ;Z
q  = [pi/3  ;pi/3   ;0];
qd = [pi    ;1      ;0];

L = [3  2  1]';

%% Unit twist
% Joint 1
T1_00 = [0  0  1  0  0  0]';

% Joint 2
T2_11 = [1  0  0  0  0  0]';
%> Change coordinates to 0
P10    = [0  0  L(1)];
adjH10 = adj('z', q(1), P10);
T2_10  = adjH10 * T2_11;

% Joint 3
T3_22 = [1  0  0  0  0  0]';
%> Change coordinates to 0
P21    = [0  0  L(2)];
adjH21 = adj('x', q(2), P21);
adjH20 = adjH10 * adjH21;
T3_20 = adjH10 * adjH21 * T3_22;





w1q = [0; 0; 1];
T1q = [w1q; 0; 0 ;0];

w2q  = [cos(qd(1));     sin(qd(1));    0];
rw2q = [-L(1)*sin(qd(1)); L(1)*cos(qd(1)); 0];
T2q = [w2q; rw2q];

T3q = [0; 0; 1; 0; 0 ;0];

%% Generate Jacobian
J = [T1q T2q T3q];

Tq = J * qd;


%% Tes
P = [
    0 -5 0;
    5 0 0;
    0 0 0];
A = [
    eye(3) zeros(3,3)
    P eye(3)];


P = [
    0 -6 0;
    6 0 0;
    0 0 0];
B = [
    eye(3) zeros(3,3)
    P eye(3)];

C = A * B;
