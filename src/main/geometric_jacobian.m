function jacobian = geometric_jacobian(q, dh_params)
    [~, frames] = forward_kinematics(q, dh_params);
    p = frames(1 : 3, 4, end);
    
    pi = frames(1 : 3, 4, 1 : end - 1);
    ni = frames(1 : 3, 3, 1 : end - 1);
    
    jacobian(1 : 3, :) = reshape(cross(ni, p - pi), 3, []);
    jacobian(4 : 6, :) = reshape(ni, 3, []);
end

