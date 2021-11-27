function [tform, frames] = forward_kinematics(q, dh_params, draw)
    if (nargin < 3)
        draw = true;
    end
    
    if (size(q, 1) < size(q, 2))
        q = q';
    end

    num_of_frames = size(dh_params, 1);
    dh_params(:, 4) = dh_params(:, 4) + q;
    [tform, subtform] = dh_params_to_tform(dh_params);
    
    base_frame = eye(4);
    frames = zeros(4, 4, 1 + num_of_frames);
    subframes = zeros(4, 4, 1 + num_of_frames);
    h = eye(4);
    frames(:, :, 1) = base_frame;
    subframes(:, :, 1) = base_frame;
    for idx = 1 : num_of_frames
        subframes(:, :, idx + 1) = h * subtform(:, :, idx) * base_frame;
        h = h * tform(:, :, idx);
        frames(:, :, idx + 1) = h * base_frame;
    end
    
    tform = frames(:, :, end);
    
    if (draw)
        figure();       
        draw_robot(reshape([subframes, frames], 4, 4, []));
        draw_axis(frames);
    end
end

