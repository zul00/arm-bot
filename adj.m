function adjH = adj(axis, angle, P)

R = rot(axis, angle);

adjH = [
R             zeros(3,3);
tilde(P)*R    R
]

end
