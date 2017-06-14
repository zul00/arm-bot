joint = 'x'

switch joint
    case 'x'
        R =  [
        1 0 0;
        1 2 3;
        3 4 5
        ];
    case 'y'
        R =  [
        2 0 0;
        2 2 3;
        3 4 5
        ];
    otherwise
        fprintf('error')
end

