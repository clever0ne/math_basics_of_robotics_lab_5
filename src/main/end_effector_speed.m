function [v, omega] = end_effector_speed(q, qd, dh_params)
    if (size(qd, 1) < size(qd, 2))
        qd = qd';
    end
    
    jacobian = geometric_jacobian(q, dh_params);
    v = jacobian(1 : 3, :) * qd;
    omega = jacobian(4 : 6, :) * qd;
end

