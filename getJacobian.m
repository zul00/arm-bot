clear all

%q    X     ;Y      ;Z
q  = [pi/2  ;pi/2   ;0];
qd = [pi    ;1      ;0];

%% Jacobian
w1q = [0; 0; 1];
T1q = [w1q; 0; 0 ;0];

w2q  = [cos(qd(1));     sin(qd(1));    0];
rw2q = [-L1*sin(qd(1)); L1*cos(qd(1)); 0];
T2q = [w2q; rw2q];

T3q = [0; 0; 1; 0; 0 ;0];

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
