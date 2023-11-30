ILA_data = readtable('C:\Users\alceu\Documents\Doutorado\2dof_esc_pole_ila\MATLAB\iladata\fishhook_test_iladata.csv', 'Format', '%u%u%u%u%u');

ready = ILA_data.s_ready;
rom_out = ILA_data.s_rom_out_26_0_;

ready_size = size(ready,1);
rom_size = size(rom_out,1);

for i=1:rom_size
    rom_out_dec(i) = bin2float(char(rom_out(i)),8,18);
end

sim_size = size(simOut.tout,1);
%cap_rate = 22;

%for i=1:sim_size
%    x1_out_cap(i) = x1_out_dec(i*cap_rate);
%    x2_out_cap(i) = x2_out_dec(i*cap_rate);
%end

%figure(1)
%plot(x1_out_test, 'LineWidth', 1.5)
%hold on
%plot(x1_out_cap, '--', 'LineWidth', 1.5)
%legend('MATLAB', 'ILA')

%figure(2)
%plot(x2_out_test, 'LineWidth', 1.5)
%hold on
%plot(x2_out_cap, '--', 'LineWidth', 1.5)
%legend('MATLAB', 'ILA')

% x1_res = zeros(sim_size);
% 
% for i=1:sim_size
%     if i == 1
%         x1_res(1) = x1_out(1);
%     elseif x1_out(i) ~= x1_out(i-1)
%         x1_res = [x1_res x1_out(i)];
%     end
% end
