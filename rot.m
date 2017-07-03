function R = rot(axis, ang)

switch axis
    case 'x'
        R =  [
        1   0          0;
        0   cos(ang)   -sin(ang);
        0   sin(ang)   cos(ang)
        ];
    case 'y'
        R =  [
        cos(ang)   0   sin(ang);
        0          1   0;
        -sin(ang)  0   cos(ang)
        ];
    case 'z'
        R =  [
        cos(ang)   -sin(ang)   0;
        sin(ang)   cos(ang)    0;
        0          0           1
        ];
    case 'i'
        R = eye(3);
    otherwise
        error('Unknown axis')
end

