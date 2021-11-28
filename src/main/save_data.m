function save_data(v, omega, filepath)
    id = fopen(filepath, 'w');
    fprintf(id, 'v     = [%8.4f%8.4f%8.4f ]\n', v(1 : 3));  
    fprintf(id, 'omega = [%8.4f%8.4f%8.4f ]\n', omega(1 : 3));
    fclose(id);
end

