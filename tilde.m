function [stat, tT] = Ttilde(T)

% Obtain omega and v
omega = T(1:3);
v = T(4:6);

% Omega tilde
omega_t = [
0       -T(3)   -T(2);
T(3)    0       -T(1);
-T(2)   T(1)    0
];

% Generate T tilde
tT = [
omega_t     v;
zeros(1,3)  0
];

stat = 0;
end
