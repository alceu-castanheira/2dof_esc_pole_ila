----------------------------------------------------------------------------------
-- Company: Universidade de Bras?lia
-- Engineer: Alceu Bernardes Castanheira de Farias
-- 
-- Create Date: 13.09.2022 15:30:10
-- Design Name: 
-- Module Name: Fishhook_test_top_module - Behavioral
-- Project Name: 
-- Target Devices: Zybo
-- Tool Versions: Vivado 2018.3
-- Description: 
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
use work.fpupack.all;
use work.ESC_PID_Control_Pkg.all;


entity Fishhook_test_top_module is
  Port (clk   : in STD_LOGIC;
        rst   : in STD_LOGIC;
        start : in STD_LOGIC;
        
        data_ready: out STD_LOGIC;
        ready : out STD_LOGIC;
        rom_out : out STD_LOGIC_VECTOR(FP_WIDTH-1 downto 0)
  );
end Fishhook_test_top_module;

architecture Behavioral of Fishhook_test_top_module is

-- Fishhook ROM test FSM
component Fishhook_test_FSM is
    Port ( clk        : in STD_LOGIC;
           rst        : in STD_LOGIC;
           start      : in STD_LOGIC;      
           
           data_ready : out STD_LOGIC;
           ready      : out STD_LOGIC; 
           rom_ena    : out STD_LOGIC;
           rom_addr   : out STD_LOGIC_VECTOR(FISHHOOK_ROM_ADDR_WIDTH-1 DOWNTO 0));
end component Fishhook_test_FSM;

-- Fishhook ROM
COMPONENT blk_mem_gen_0
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(26 DOWNTO 0)
  );
END COMPONENT;

    -- Sinal que armazena o enable de leitura da mem?ria ROM
    --
    signal s_rom_ena: std_logic := '0';
    
    -- Sinal que armazena o endere?o da ROM de testes 
    --
    signal s_rom_addr : std_logic_vector(FISHHOOK_ROM_ADDR_WIDTH-1 downto 0) := (others => '0');
    
    -- Sinal que armazena a sa?da da ROM
    signal s_rom_out: std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
    
begin

    FISHHOOK_FSM: Fishhook_test_FSM port map(
        clk        => clk,
        rst        => rst,
        start      => start,      
               
        data_ready => data_ready,
        ready      => ready, 
        rom_ena    => s_rom_ena,
        rom_addr   => s_rom_addr
    );


    FISHHOOK_ROM : blk_mem_gen_0
      PORT MAP (
        clka => clk,
        ena => s_rom_ena,
        addra => s_rom_addr,
        douta => s_rom_out
      );
      
  rom_out <= s_rom_out;
  
end Behavioral;
