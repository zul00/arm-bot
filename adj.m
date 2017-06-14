
axis = 'x';
angle = pi()/2;
P = [1 2 3];

R = rot(axis, angle);

adjH = [
R             zeros(3,3);
tilde(P)*R    R
]
