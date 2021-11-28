function jacobian = geometric_jacobian(q, dh_params)
    [~, frames] = forward_kinematics(q, dh_params);
    p = frames(1 : 3, 4, end);
    
    p_i = frames(1 : 3, 4, 1 : end - 1);
    n_i = frames(1 : 3, 3, 1 : end - 1);
    
    jacobian(1 : 3, :) = reshape(cross(n_i, p - p_i), 3, []);
    jacobian(4 : 6, :) = reshape(n_i, 3, []);
end

