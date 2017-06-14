function tT = tildeTwist(T)

% Obtain omega and v
omega = T(1:3);
v = T(4:6);

% Omega tilde
omega_t = tilde(omega);

% Generate T tilde
tT = [
omega_t     v;
zeros(1,3)  0
];

end
