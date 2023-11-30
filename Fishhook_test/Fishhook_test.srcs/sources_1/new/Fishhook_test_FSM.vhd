----------------------------------------------------------------------------------
-- Company: Universidade de Bras?lia
-- Engineer: Alceu Bernardes Castanheira de Farias
-- 
-- Create Date: 12.09.2022 22:53:09
-- Design Name: 
-- Module Name: Fishhook_test_FSM - Behavioral
-- Project Name: 
-- Target Devices: Zybo
-- Tool Versions: Vivado 2018.3
-- Description: FSM that reads values from a ROM containing Fishhook values for delta_f 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ESC_PID_Control_Pkg.all;

entity Fishhook_test_FSM is
    Port ( clk        : in STD_LOGIC;
           rst        : in STD_LOGIC;
           start      : in STD_LOGIC;      
           
           data_ready : out STD_LOGIC;
           ready      : out STD_LOGIC; 
           rom_ena    : out STD_LOGIC;
           rom_addr   : out STD_LOGIC_VECTOR(FISHHOOK_ROM_ADDR_WIDTH-1 DOWNTO 0));
end Fishhook_test_FSM;


-- O m?dulo possui reset ass?ncrono ativado em n?vel l?gico '1'.
--
-- Este m?dulo corresponde a uma FSM que controla a ROM com os valores de x para
-- c?lculo da expans?o de Taylor, para que sejam feitos c?lculos com todos os 
-- valores da ROM.
--
----------------------------------------------------------------------------------
architecture Behavioral of Fishhook_test_FSM is

    -- Sinal que armazena o tipo dos estados da FSM
    --
    type t_state is (idle, -- Estado inicial 
                     load_rom_data, -- Carregar o valor da ROM
                     update_addr, -- Atualizar o endere?o da ROM
                     check_test_progress); -- Verificar se o teste j? terminou
    
    -- Sinal que armazena o estado atual
    --
    signal current_state : t_state := idle;
    
    -- Sinal que armazena o pr?ximo estado
    --
    signal next_state : t_state := idle;
    
    -- Sinal que armazena o endere?o da ROM de testes 
    --
    signal s_rom_addr : std_logic_vector(FISHHOOK_ROM_ADDR_WIDTH-1 downto 0) := (others => '0');
    
    -- Sinal de contagem para lat?ncia de leitura da rom que armazena
    -- os dados do sinal de Fishhook
    signal s_read_latency : std_logic_vector(1 downto 0) := (others => '0');
       
begin

    -- Processo sequencial que controla o valor do estado atual
    --
    process(clk,rst)
    begin
        if rst = '1' then
            current_state <= idle;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    -- Processo combinacional que controla a transi??o de estados
    --
    process(current_state, start, s_read_latency, s_rom_addr)
    begin
        case current_state is
        
            -- Se start = '1', v? para o pr?ximo estado
            --
            when idle =>
                if start = '1' then
                    next_state <= load_rom_data;
                else
                    next_state <= idle;
                end if;

                
            -- Se a lat?ncia de leitura da ROM for cumprida (2 
            -- ciclos de clock), ir para o pr?ximo estado
            --    
            when load_rom_data =>
                if s_read_latency = "10" then
                    next_state <= update_addr;
                else
                    next_state <= load_rom_data;
                end if;
            
            -- Com o endere?o da ROM atualizado, ir para o 
            -- pr?ximo estado
            --
            when update_addr =>            
                next_state <= check_test_progress;
            
            when check_test_progress =>
            
                -- Se o valor de endere?o for 1000, significa que j? lemos todos
                -- os endere?os poss?veis da ROM (de 0 a 1023), e podemos fazer
                -- com a sa?da rom_end = '1' e o sinal com endere?o volte para 0
                --
                --if s_rom_addr = "1111101000" then
                if s_rom_addr = FISHHOOK_ROM_DEPTH then
                    next_state <= idle;
                else
                    next_state <= load_rom_data;
                end if;                 
                                           
            -- Em caso de erro, permanecer no estado inicial
            --    
            when others =>
                next_state <= idle;
                
        end case;
    end process;
    
    -- Processo sequencial que controla as sa?das da FSM
    --
    process(clk, rst)
    begin
    
        -- Reset ass?ncrono: reseta todas as sa?das e sinais
        --
        if rst = '1' then
        
           data_ready <= '0';
           ready      <= '0'; 
           rom_ena    <= '0';
           rom_addr   <= (others => '0');
           
           s_read_latency <= (others => '0'); 
           s_rom_addr     <= (others => '0');
            
        elsif rising_edge(clk) then
            case current_state is
            
                -- No estado inicial, inicia-se o contador para
                -- lat?ncia de leitura da ROM e ena volta para '0'
                --
                when idle =>
                             
                    data_ready <= '0';
                    ready      <= '0';
                    rom_ena    <= '0';
                    rom_addr   <= (others => '0');
                    
                    s_read_latency <= (others => '0');
                    s_rom_addr     <= (others => '0');
                        
                -- A ROM ? habilitada e o endere?o ? passado para que
                -- o dado seja carregado para testes
                --    
                when load_rom_data =>
                    
                    data_ready <= '0';                    
                    rom_ena    <= '1';
                    rom_addr   <= s_rom_addr; 
                    
                    -- Contador para lat?ncia de leitura da ROM: 2 ciclos de clock 
                    --
                    s_read_latency <= std_logic_vector(unsigned(s_read_latency) + 1);
                    
                -- Iniciar o c?lculo da equa??o e atualizar o endere?o para
                -- que no pr?ximo teste um novo valor de x esteja dispon?vel
                --
                when update_addr =>
                    
                    data_ready     <= '1';
                    rom_ena        <= '0';
                    s_rom_addr     <= std_logic_vector(unsigned(s_rom_addr) + 1); 
                    s_read_latency <= (others => '0');  
                
                when check_test_progress =>
                
                    if s_rom_addr = FISHHOOK_ROM_DEPTH then
                        ready <= '1';
                    else
                        ready <= '0';
                    end if; 
                                                                                                                          
                -- Em caso de erro, sa?das e sinais permanecem em seus valores
                -- iniciais
                --                    
                when others =>
                    
                   data_ready <= '0';
                   ready      <= '0'; 
                   rom_ena    <= '0';
                   rom_addr   <= (others => '0');
                   
                   s_read_latency <= (others => '0'); 
                   s_rom_addr     <= (others => '0');
                       
            end case;
        end if;
    end process;


end Behavioral;
