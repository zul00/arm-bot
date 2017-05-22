L1 = 1;
L2 = 2;

% Initial transformation matrix
H3 = [eye(3) [L1+L2;0;0];
    zeros(1,3) 1];

% Unit twist
T1 = [0; 0; 0; 0; 0; 1];
T2 = [0; -1; 0; 0; 0; 0];
T3 = [0; -1; 0; 0; 0; 0];
