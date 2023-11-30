EW = 8;
FW = 18;

fishhook_vector = delta_f(:,2);

size_fishhook = size(fishhook_vector); len_fishhook = size_fishhook(1);

fileID = fopen('C:\Users\alceu\Documents\Doutorado\2dof_esc_pole_ila\VHDL\fishhook.coe','w'); % Criar e salvar arquivo na pasta VHDL

fprintf(fileID, 'memory_initialization_radix = 2;\n');
fprintf(fileID, 'memory_initialization_vector =\n');

for i=1:len_fishhook
    if fishhook_vector(i) == 0
        fprintf(fileID, '000000000000000000000000000');
    else
        fprintf(fileID, float2bin(EW, FW, fishhook_vector(i)));
    end
    
    if i == len_fishhook
        fprintf(fileID, ';');
    else
        fprintf(fileID, ',\n'); 
    end
end