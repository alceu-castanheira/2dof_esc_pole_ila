library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.fpupack.all;
use work.ESC_PID_Control_Pkg.all;

entity Fishhook_test_tb is
end Fishhook_test_tb;

architecture Behavioral of Fishhook_test_tb is

    component Fishhook_test_top_module is
      Port (clk   : in STD_LOGIC;
            rst   : in STD_LOGIC;
            start : in STD_LOGIC;
            
            data_ready: out STD_LOGIC;
            ready : out STD_LOGIC;
            rom_out : out STD_LOGIC_VECTOR(FP_WIDTH-1 downto 0)
      );
    end component Fishhook_test_top_module;

    signal s_clk   : std_logic := '0';
    signal s_rst   : std_logic := '0';
    signal s_start : std_logic := '0';
    
    signal s_data_ready : std_logic := '0';
    signal s_ready : std_logic := '0';
    signal s_rom_out : std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
    
begin

    TEST_FISHHOOK: Fishhook_test_top_module port map
    (
        clk => s_clk, 
        rst => s_rst,
        start => s_start,
        
        data_ready => s_data_ready,
        ready      => s_ready,
        rom_out    => s_rom_out
    );
    
    s_clk <= not s_clk after 10 ns;
    s_rst <= '1' after 20 ns, '0' after 40 ns;
    s_start <= '1' after 30 ns, '0' after 100 ns;
    
end Behavioral;