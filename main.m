clear all;

pi = pi();

q = [pi pi pi/2];
L = [3 2 1];

[H10 H20 H30 Hee0] = getHMatrices(q, L);
