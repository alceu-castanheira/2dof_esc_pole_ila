----------------------------------------------------------------------------------
-- Company: UnB/PUCPR
-- Engineers: Daniel Munoz e Helon Ayala
-- 
-- Create Date: 07-May-2016 | 11h37min54.532sec
-- Module name:   entities
-- Description:   package defining IO of the components
-- Automatically generated using the entities_gen.m 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.fpupack.all;
use work.compute_MPC_matrices_package.all;
--use IEEE.NUMERIC_STD.ALL;

package Entities is

component lfsr_fixtofloat_20bits	is
port (reset     :  in std_logic;
      clk       :  in std_logic;
      start     :  in std_logic;
      istart    :  in std_logic;
      init      :  in std_logic_vector(15 downto 0);
      lfsr_out  : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready     : out std_logic);
end component;

component regFF is
port (reset      :  in std_logic;
      clk        :  in std_logic;
      start  	 :  in std_logic;
      iport1  	 :  in std_logic_vector(FP_WIDTH-1 downto 0);    
      oport1     : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready      : out std_logic);
end component;

component sub1 is
port (reset   :  in std_logic;
      clk     :  in std_logic;
      iport1  :  in std_logic_vector(FP_WIDTH-1 downto 0);
      iport2  :  in std_logic_vector(FP_WIDTH-1 downto 0);
      start   :  in std_logic;
      oport1  : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready   : out std_logic);
end component;

component add is
port (reset   :  in std_logic;
      clk     :  in std_logic;
      iport1  :  in std_logic_vector(FP_WIDTH-1 downto 0);
      iport2  :  in std_logic_vector(FP_WIDTH-1 downto 0);
      start   :  in std_logic;
      oport1  : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready   : out std_logic);
end component;

component addsubfsm_v6 is
port (reset     :  in std_logic;
      clk       :  in std_logic;
      op        :  in std_logic;
      op_a    	 :  in std_logic_vector(FP_WIDTH-1 downto 0);
      op_b    	 :  in std_logic_vector(FP_WIDTH-1 downto 0);
      start_i	 :  in std_logic;
      addsub_out : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready_as  : out std_logic);
end component;

component mul is
port (reset 	 :  in std_logic; 
      clk        :  in std_logic;          
      iport1     :  in std_logic_vector(FP_WIDTH-1 downto 0);
      iport2     :  in std_logic_vector(FP_WIDTH-1 downto 0);
      start      :  in std_logic;
      oport1     : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready      : out std_logic);
end component;

component multiplierfsm_v2 is
port (reset     :  in std_logic;
      clk       :  in std_logic;
      op_a    	 :  in std_logic_vector(FP_WIDTH-1 downto 0);
      op_b    	 :  in std_logic_vector(FP_WIDTH-1 downto 0);
      start_i	 :  in std_logic;
      mul_out   : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready_mul : out std_logic);
end component;

component cordic_exp
	port(reset	:  in std_logic;
	     clk	:  in std_logic;
		 start	:  in std_logic;
		 Ain	:  in std_logic_vector(FP_WIDTH-1 downto 0);
		 exp    : out std_logic_vector(FP_WIDTH-1 downto 0);
		 ready  : out std_logic);
end component;

component decFP is
port (reset    :  in std_logic;
      start	   :  in std_logic;
      clk      :  in std_logic;
      Xin      :  in std_logic_vector(FP_WIDTH-1 downto 0);
      intX     : out std_logic_vector(EXP_WIDTH-1 downto 0);
      decX     : out std_logic_vector(FP_WIDTH-1 downto 0);
      ready    : out std_logic);
end component;

component serialcom
port( reset		:  in std_logic;
	   clk 			:  in std_logic;
	   start   	  	:  in std_logic;
        d1          :  in std_logic_vector(FP_WIDTH-1 downto 0);
		din     	:  in std_logic;
		data        : out std_logic_vector(7 downto 0);
		rdy_data    : out std_logic;
		dout        : out std_logic);
end component;

component fixMul is
port (op_a    	 :  in std_logic_vector(FRAC_WIDTH downto 0);
      op_b    	 :  in std_logic_vector(FRAC_WIDTH downto 0);
      mul_out   : out std_logic_vector(FRAC_WIDTH*2+1 downto 0));
end component fixMul;

component divNR is
	port (reset      :  in std_logic;
		  clk        :  in std_logic;
		  op_a 		 :  in std_logic_vector(FP_WIDTH-1 downto 0);
		  op_b 		 :  in std_logic_vector(FP_WIDTH-1 downto 0);
		  start_i    :  in std_logic;
		  div_out    : out std_logic_vector(FP_WIDTH-1 downto 0);
		  ready_div  : out std_logic);
end component divNR;

-- Componentes para N=50
--
--
--COMPONENT Ar_const_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Ar_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(1349 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Ar_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Bineqr_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(1349 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT F_memory
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(1349 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT F2_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT fg_mem
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(755 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Fr_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(215 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT G_mem
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(1349 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT G3_rom_memory
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Hr_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(215 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Hr_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Pi_e_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1349 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT pi_e_rom_2
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT yref_mem
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1079 DOWNTO 0)
--  );
--END COMPONENT;

--component compute_MPC_matrices_v2 is
--  port ( 
--            clk                  : in  std_logic := '0';             
--            rst                  : in  std_logic := '0';             
--            start                : in  std_logic := '0';             
--            ready_matrix_mult    : in  std_logic := '0';             
--            ready_matrix_add     : in  std_logic := '0';             
--            ready_model          : in  std_logic := '0';  
--            x1                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x2                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x3                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x4                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x5                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x6                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x7                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x8                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x9                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x10                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x11                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x12                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u1                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u2                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u3                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u4                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');           
--            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_3    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            f1_data              : in std_logic_vector (28*FP_WIDTH-1 downto 0) := (others => '0');
--            f1x_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            f2_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            f2y_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            yref_data            : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            g1x_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            g2u_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            g3_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            pi_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            bineq_dout           : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            fr_dout              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            ready                : out std_logic := '0';
--            reset_fp             : out std_logic := '0';
--            sel               : out std_logic := '0';
--            start_matrix_mult    : out std_logic := '0';
--            start_matrix_add     : out std_logic := '0';
--            mode_matrix_mult     : out std_logic := '0';
--            op_matrix_add        : out std_logic := '0';
--            f1_ena               : out std_logic := '0';
--            f1x_ena              : out std_logic := '0';
--            f1x_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            f1x_addr             : out std_logic_vector (1 downto 0) := (others => '0');
--            f1_addr              : out std_logic_vector (9 downto 0) := (others => '0');
--            f2_ena               : out std_logic := '0';
--            f2y_ena              : out std_logic := '0';
--            f2y_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            f2y_addr             : out std_logic_vector (1 downto 0) := (others => '0');
--            f2_addr              : out std_logic_vector (9 downto 0) := (others => '0');
--            yref_ena             : out std_logic := '0';
--            yref_addr            : out std_logic_vector (11 downto 0) := (others => '0');
--            g1x_ena              : out std_logic := '0';
--            g1x_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            g1x_addr             : out std_logic_vector (3 downto 0) := (others => '0');
--            g2u_ena              : out std_logic := '0';
--            g2u_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            g2u_addr             : out std_logic_vector (3 downto 0) := (others => '0');
--            g3_ena               : out std_logic := '0';
--            g3_addr              : out std_logic_vector (3 downto 0) := (others => '0');
--            pi_ena               : out std_logic := '0';
--            pi_addr              : out std_logic_vector (4 downto 0) := (others => '0');
--            bineq_ena            : out std_logic := '0';
--            bineq_wea            : out std_logic_vector (0 downto 0) := (others => '0');
--            bineq_addr           : out std_logic_vector (4 downto 0) := (others => '0');
--            fr_ena            : out std_logic := '0';
--            fr_wea            : out std_logic_vector (0 downto 0) := (others => '0');
--            fr_addr           : out std_logic_vector (0 downto 0) := (others => '0');
--            prev_sum             : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_36a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_36b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_37a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_37b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_38a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_38b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_39a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_39b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_40a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_40b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_41a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_41b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_42a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_42b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_43a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_43b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_44a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_44b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_45a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_45b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_46a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_46b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_47a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_47b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_48a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_48b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_49a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_49b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_50a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_50b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_36a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_36b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_37a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_37b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_38a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_38b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_39a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_39b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_40a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_40b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_41a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_41b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_42a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_42b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_43a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_43b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_44a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_44b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_45a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_45b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_46a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_46b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_47a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_47b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_48a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_48b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_49a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_49b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_50a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_50b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            f1x_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            f2y_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            g1x_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            g2u_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            bineq_din            : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            fr_din               : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component compute_MPC_matrices_v2;

--component solver_sat_pen is
--  port ( 
--            clk                  : in  std_logic := '0';             
--            rst                  : in  std_logic := '0';             
--            start                : in  std_logic := '0';             
--            ready_matrix_mult    : in  std_logic := '0';             
--            ready_matrix_add     : in  std_logic := '0';             
--            ready_const_mult     : in  std_logic := '0';             
--            ready_div            : in  std_logic := '0';             
--            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_3    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            res_const_mult       : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            res_div              : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            ar_data              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            hr_data              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            pi_e_data            : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            ar_const_data        : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            hp_dout              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            g_dout               : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            ap_dout              : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            br_dout              : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            fr_dout              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            ready                : out std_logic := '0';
--            reset_fp             : out std_logic := '0';
--            start_matrix_mult    : out std_logic := '0';
--            start_matrix_add     : out std_logic := '0';
--            start_const_mult     : out std_logic := '0';
--            start_div            : out std_logic := '0';
--            mode_matrix_mult     : out std_logic := '0';
--            op_matrix_add        : out std_logic := '0';
--            hr_ena               : out std_logic := '0';
--            ar_ena               : out std_logic := '0';
--            ar_const_ena         : out std_logic := '0';
--            pi_e_ena             : out std_logic := '0';
--            hp_ena              : out std_logic := '0';
--            hp_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            hp_addr             : out std_logic_vector (2 downto 0) := (others => '0');
--            g_ena              : out std_logic := '0';
--            g_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            g_addr             : out std_logic_vector (2 downto 0) := (others => '0');
--            ap_ena              : out std_logic := '0';
--            ap_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            ap_addr             : out std_logic_vector (4 downto 0) := (others => '0');
--            br_ena              : out std_logic := '0';
--            br_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            br_addr             : out std_logic_vector (4 downto 0) := (others => '0');
--            fr_ena              : out std_logic := '0';
--            fr_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            fr_addr             : out std_logic_vector (0 downto 0) := (others => '0');
--            hr_addr              : out std_logic_vector (2 downto 0) := (others => '0');
--            ar_addr              : out std_logic_vector (9 downto 0) := (others => '0');
--            ar_const_addr        : out std_logic_vector (7 downto 0) := (others => '0');
--            pi_e_addr            : out std_logic_vector (7 downo 0) := (others => '0');
--            prev_sum             : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_36a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_36b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_37a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_37b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_38a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_38b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_39a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_39b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_40a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_40b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_41a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_41b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_42a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_42b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_43a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_43b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_44a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_44b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_45a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_45b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_46a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_46b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_47a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_47b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_48a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_48b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_49a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_49b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_50a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_50b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_36a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_36b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_37a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_37b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_38a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_38b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_39a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_39b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_40a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_40b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_41a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_41b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_42a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_42b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_43a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_43b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_44a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_44b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_45a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_45b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_46a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_46b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_47a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_47b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_48a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_48b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_49a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_49b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_50a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_50b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            div_op_a            :out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            div_op_b            :out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            hp_din              : out std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            g_din               : out std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            u1                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u2                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u3                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u4                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            ap_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component solver_sat_pen;

--component matrix_mult_3 is
--  port ( 
--        clk                  : in  std_logic                     := '0';             
--        rst                  : in  std_logic                     := '0';             
--        start                : in  std_logic                     := '0';             
--        mode                 : in  std_logic                     := '0';              
--        din_mult_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_9a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_9b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_10a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_10b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_11a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_11b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_12a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_12b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_13a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_13b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_14a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_14b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_15a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_15b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_16a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_16b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_17a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_17b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_18a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_18b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_19a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_19b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_20a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_20b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_21a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_21b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_22a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_22b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_23a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_23b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_24a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_24b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_25a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_25b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_26a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_26b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_27a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_27b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_28a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_28b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_29a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_29b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_30a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_30b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_31a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_31b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_32a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_32b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_33a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_33b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_34a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_34b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_35a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_35b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_36a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_36b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_37a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_37b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_38a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_38b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_39a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_39b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_40a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_40b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_41a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_41b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_42a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_42b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_43a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_43b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_44a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_44b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_45a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_45b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_46a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_46b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_47a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_47b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_48a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_48b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_49a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_49b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_50a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_50b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        prev_sum             : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        ready                : out std_logic := '0'; 
--        dout_1               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        dout_2               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        dout_3               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component matrix_mult_3;

--component matrix_addsub is
--  port ( 
--        clk                  : in  std_logic                     := '0';             
--        rst                  : in  std_logic                     := '0';             
--        start                : in  std_logic                     := '0';             
--        op                   : in  std_logic                     := '0';             
--        din_add_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_9a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_9b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_10a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_10b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_11a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_11b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_12a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_12b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_13a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_13b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_14a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_14b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_15a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_15b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_16a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_16b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_17a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_17b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_18a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_18b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_19a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_19b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_20a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_20b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_21a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_21b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_22a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_22b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_23a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_23b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_24a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_24b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_25a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_25b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_26a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_26b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_27a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_27b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_28a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_28b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_29a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_29b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_30a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_30b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_31a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_31b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_32a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_32b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_33a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_33b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_34a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_34b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_35a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_35b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_36a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_36b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_37a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_37b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_38a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_38b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_39a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_39b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_40a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_40b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_41a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_41b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_42a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_42b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_43a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_43b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_44a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_44b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_45a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_45b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_46a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_46b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_47a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_47b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_48a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_48b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_49a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_49b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_50a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_50b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        ready                : out std_logic := '0'; 
--        dout                 : out std_logic_vector(N*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component matrix_addsub;

--component const_by_matrix_mult is
--  port ( 
--        clk                  : in  std_logic                     := '0';             
--        rst                  : in  std_logic                     := '0';             
--        start                : in  std_logic                     := '0';             
--        din_mult_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        ready                : out std_logic := '0'; 
--        dout                 : out std_logic_vector(8*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component const_by_matrix_mult;

--component model_simulator is
--  port ( 
--            clk                  : in  std_logic := '0';             
--            rst                  : in  std_logic := '0';             
--            start                : in  std_logic := '0';             
--            ready_matrix_mult    : in  std_logic := '0';             
--            ready_matrix_add     : in  std_logic := '0';             
--            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            a_data               : in std_logic_vector (12*FP_WIDTH-1 downto 0) := (others => '0');
--            b_data               : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
--            u1                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u2                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u3                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u4                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            ready                : out std_logic := '0';
--            reset_fp             : out std_logic := '0';
--            start_matrix_mult    : out std_logic := '0';
--            start_matrix_add     : out std_logic := '0';
--            mode_matrix_mult     : out std_logic := '0';
--            op_matrix_add        : out std_logic := '0';
--            a_ena               : out std_logic := '0';
--            a_addr              : out std_logic_vector (3 downto 0) := (others => '0');
--            b_ena               : out std_logic := '0';
--            b_addr             : out std_logic_vector (3 downto 0) := (others => '0');
--            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_36a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_36b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_37a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_37b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_38a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_38b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_39a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_39b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_40a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_40b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_41a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_41b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_42a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_42b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_43a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_43b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_44a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_44b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_45a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_45b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_46a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_46b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_47a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_47b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_48a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_48b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_49a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_49b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_50a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_50b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_36a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_36b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_37a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_37b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_38a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_38b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_39a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_39b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_40a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_40b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_41a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_41b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_42a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_42b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_43a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_43b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_44a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_44b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_45a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_45b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_46a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_46b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_47a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_47b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_48a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_48b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_49a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_49b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_50a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_50b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x1 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x2 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x3 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x4 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x5 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x6 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x7 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x8 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x9 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x10 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x11 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x12 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component model_simulator; 

-- Componentes para N=40
--
COMPONENT Ar_const_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Ar_ram
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(539 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Ar_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Bineqr_ram
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(539 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT F_memory
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(539 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT f2_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT fg_mem
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(269 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Fr_ram
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(107 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
  );
END COMPONENT;

COMPONENT G_mem
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(539 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT G3_rom_memory
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Hr_ram
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(107 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Hr_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Pi_e_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;

COMPONENT pi_e_rom_2
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
  );
END COMPONENT;

COMPONENT yref_mem
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(539 DOWNTO 0)
  );
END COMPONENT;
    
component compute_MPC_matrices_v2 is
  port ( 
            clk                  : in  std_logic := '0';             
            rst                  : in  std_logic := '0';             
            start                : in  std_logic := '0';             
            ready_matrix_mult    : in  std_logic := '0';             
            ready_matrix_add     : in  std_logic := '0';             
            ready_model          : in  std_logic := '0';  
            x1                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x2                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x3                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x4                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            u1                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            u2                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');                       
            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_mult_3    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            f1_data              : in std_logic_vector (10*FP_WIDTH-1 downto 0) := (others => '0');
            f1x_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            f2_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            f2y_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            yref_data            : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            g1x_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            g2u_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            g3_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
            pi_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            bineq_dout           : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            fr_dout              : in std_logic_vector (FP_WIDTH*4-1 downto 0) := (others => '0');
            ready                : out std_logic := '0';
            reset_fp             : out std_logic := '0';
            sel                  : out std_logic := '0';
            start_matrix_mult    : out std_logic := '0';
            start_matrix_add     : out std_logic := '0';
            mode_matrix_mult     : out std_logic := '0';
            op_matrix_add        : out std_logic := '0';
            f1_ena               : out std_logic := '0';
            f1x_ena              : out std_logic := '0';
            f1x_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            f1x_addr             : out std_logic_vector (0 downto 0) := (others => '0');
            f1_addr              : out std_logic_vector (7 downto 0) := (others => '0');
            f2_ena               : out std_logic := '0';
            f2y_ena              : out std_logic := '0';
            f2y_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            f2y_addr             : out std_logic_vector (0 downto 0) := (others => '0');
            f2_addr              : out std_logic_vector (6 downto 0) := (others => '0');
            yref_ena             : out std_logic := '0';
            yref_addr            : out std_logic_vector (8 downto 0) := (others => '0');
            g1x_ena              : out std_logic := '0';
            g1x_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            g1x_addr             : out std_logic_vector (2 downto 0) := (others => '0');
            g2u_ena              : out std_logic := '0';
            g2u_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            g2u_addr             : out std_logic_vector (2 downto 0) := (others => '0');
            g3_ena               : out std_logic := '0';
            g3_addr              : out std_logic_vector (2 downto 0) := (others => '0');
            pi_ena               : out std_logic := '0';
            pi_addr              : out std_logic_vector (2 downto 0) := (others => '0');
            bineq_ena            : out std_logic := '0';
            bineq_wea            : out std_logic_vector (0 downto 0) := (others => '0');
            bineq_addr           : out std_logic_vector (3 downto 0) := (others => '0');
            fr_ena               : out std_logic := '0';
            fr_wea               : out std_logic_vector (0 downto 0) := (others => '0');
            fr_addr              : out std_logic_vector (0 downto 0) := (others => '0');
            prev_sum             : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            f1x_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            f2y_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            g1x_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            g2u_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            bineq_din            : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            fr_din               : out std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0')
      );
end component compute_MPC_matrices_v2;

component solver_sat_pen is
  port ( 
            clk                  : in  std_logic := '0';             
            rst                  : in  std_logic := '0';             
            start                : in  std_logic := '0';             
            ready_matrix_mult    : in  std_logic := '0';             
            ready_matrix_add     : in  std_logic := '0';             
            ready_const_mult     : in  std_logic := '0';                         
            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_3    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            res_const_mult       : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            ar_data              : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            hr_data              : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            pi_e_data            : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');            
            ar_const_data        : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            hp_dout              : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            g_dout               : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            ap_dout              : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            br_dout              : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            fr_dout              : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            ready                : out std_logic := '0';
            reset_fp             : out std_logic := '0';
            start_matrix_mult    : out std_logic := '0';
            start_matrix_add     : out std_logic := '0';
            start_const_mult     : out std_logic := '0';
            mode_matrix_mult     : out std_logic := '0';
            op_matrix_add        : out std_logic := '0';
            hr_ena               : out std_logic := '0';
            ar_ena               : out std_logic := '0';
            ar_const_ena         : out std_logic := '0';
            pi_e_ena             : out std_logic := '0';            
            hp_ena              : out std_logic := '0';
            hp_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            hp_addr             : out std_logic_vector (1 downto 0) := (others => '0');
            g_ena              : out std_logic := '0';
            g_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            g_addr             : out std_logic_vector (1 downto 0) := (others => '0');
            ap_ena              : out std_logic := '0';
            ap_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            ap_addr             : out std_logic_vector (3 downto 0) := (others => '0');
            br_ena              : out std_logic := '0';
            br_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            br_addr             : out std_logic_vector (3 downto 0) := (others => '0');
            fr_ena              : out std_logic := '0';
            fr_wea              : out std_logic_vector (0 downto 0) := (others => '0');
            fr_addr             : out std_logic_vector (0 downto 0) := (others => '0');
            hr_addr              : out std_logic_vector (1 downto 0) := (others => '0');
            ar_addr              : out std_logic_vector (7 downto 0) := (others => '0');
            ar_const_addr        : out std_logic_vector (5 downto 0) := (others => '0');
            pi_e_addr            : out std_logic_vector (5 downto 0) := (others => '0');            
            prev_sum             : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_const_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            hp_din              : out std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            g_din               : out std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            u1                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');            
            u2                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');                        
            ap_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0')
      );
end component solver_sat_pen;

component matrix_mult_3 is
  port ( 
        clk                  : in  std_logic                     := '0';             
        rst                  : in  std_logic                     := '0';             
        start                : in  std_logic                     := '0';             
        mode                 : in  std_logic                     := '0';              
        din_mult_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_9a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_9b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_10a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_10b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_11a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_11b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_12a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_12b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_13a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_13b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_14a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_14b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_15a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_15b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_16a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_16b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_17a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_17b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_18a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_18b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_19a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_19b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_20a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        din_mult_20b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        prev_sum             : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        ready                : out std_logic := '0'; 
        dout_1               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        dout_2               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
        dout_3               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0')
      );
end component matrix_mult_3;

component matrix_addsub is
  port ( 
      clk                  : in  std_logic                     := '0';             
      rst                  : in  std_logic                     := '0';             
      start                : in  std_logic                     := '0';             
      op                   : in  std_logic                     := '0';             
      din_add_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_9a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_9b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_10a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_10b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_11a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_11b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_12a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_12b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_13a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_13b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_14a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_14b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_15a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_15b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_16a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_16b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_17a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_17b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_18a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_18b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_19a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_19b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_20a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_add_20b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      ready                : out std_logic := '0'; 
      dout                 : out std_logic_vector(N*FP_WIDTH-1 downto 0) := (others => '0')
    );
end component;

component const_by_matrix_mult is
  port ( 
      clk                  : in  std_logic                     := '0';             
      rst                  : in  std_logic                     := '0';             
      start                : in  std_logic                     := '0';             
      din_mult_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      din_mult_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
      ready                : out std_logic := '0'; 
      dout                 : out std_logic_vector(4*FP_WIDTH-1 downto 0) := (others => '0')
    );
end component;

component model_simulator is
  port ( 
            clk                  : in  std_logic := '0';             
            rst                  : in  std_logic := '0';             
            start                : in  std_logic := '0';             
            ready_matrix_mult    : in  std_logic := '0';             
            ready_matrix_add     : in  std_logic := '0';             
            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
            a_data               : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
            b_data               : in std_logic_vector (2*FP_WIDTH-1 downto 0) := (others => '0');
            u1                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            u2                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            ready                : out std_logic := '0';
            reset_fp             : out std_logic := '0';
            start_matrix_mult    : out std_logic := '0';
            start_matrix_add     : out std_logic := '0';
            mode_matrix_mult     : out std_logic := '0';
            op_matrix_add        : out std_logic := '0';
            a_ena               : out std_logic := '0';
            a_addr              : out std_logic_vector (1 downto 0) := (others => '0');
            b_ena               : out std_logic := '0';
            b_addr             : out std_logic_vector (1 downto 0) := (others => '0');
            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x1 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
            x2 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
            x3 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
            x4 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0')
      );
end component model_simulator;

-- Componentes para N=35
--

--COMPONENT Ar_const_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Ar_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(944 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Ar_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Bineqr_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(944 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT F_memory
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(944 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT f2_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT fg_mem
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(755 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Fr_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(215 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT G_mem
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(944 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT G3_rom_memory
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Hr_ram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(215 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Hr_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT Pi_e_rom
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(944 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT pi_e_rom_2
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(215 DOWNTO 0)
--  );
--END COMPONENT;

--COMPONENT yref_mem
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(1079 DOWNTO 0)
--  );
--END COMPONENT;

--component compute_MPC_matrices_v2 is
--  port ( 
--            clk                  : in  std_logic := '0';             
--            rst                  : in  std_logic := '0';             
--            start                : in  std_logic := '0';             
--            ready_matrix_mult    : in  std_logic := '0';             
--            ready_matrix_add     : in  std_logic := '0';             
--            ready_model          : in  std_logic := '0'; 
--            x1                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x2                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x3                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x4                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x5                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x6                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x7                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x8                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x9                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x10                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x11                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x12                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u1                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u2                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u3                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u4                  : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');             
--            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_3    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            f1_data              : in std_logic_vector (28*FP_WIDTH-1 downto 0) := (others => '0');
--            f1x_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            f2_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            f2y_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            yref_data            : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            g1x_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            g2u_dout             : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            g3_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            pi_data              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            bineq_dout           : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            fr_dout              : in std_logic_vector (FP_WIDTH*N-1 downto 0) := (others => '0');
--            ready                : out std_logic := '0';
--            reset_fp             : out std_logic := '0';
--            sel               : out std_logic := '0';
--            start_matrix_mult    : out std_logic := '0';
--            start_matrix_add     : out std_logic := '0';
--            mode_matrix_mult     : out std_logic := '0';
--            op_matrix_add        : out std_logic := '0';
--            f1_ena               : out std_logic := '0';
--            f1x_ena              : out std_logic := '0';
--            f1x_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            f1x_addr             : out std_logic_vector (1 downto 0) := (others => '0');
--            f1_addr              : out std_logic_vector (8 downto 0) := (others => '0');
--            f2_ena               : out std_logic := '0';
--            f2y_ena              : out std_logic := '0';
--            f2y_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            f2y_addr             : out std_logic_vector (1 downto 0) := (others => '0');
--            f2_addr              : out std_logic_vector (9 downto 0) := (others => '0');
--            yref_ena             : out std_logic := '0';
--            yref_addr            : out std_logic_vector (11 downto 0) := (others => '0');
--            g1x_ena              : out std_logic := '0';
--            g1x_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            g1x_addr             : out std_logic_vector (3 downto 0) := (others => '0');
--            g2u_ena              : out std_logic := '0';
--            g2u_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            g2u_addr             : out std_logic_vector (3 downto 0) := (others => '0');
--            g3_ena               : out std_logic := '0';
--            g3_addr              : out std_logic_vector (3 downto 0) := (others => '0');
--            pi_ena               : out std_logic := '0';
--            pi_addr              : out std_logic_vector (4 downto 0) := (others => '0');
--            bineq_ena            : out std_logic := '0';
--            bineq_wea            : out std_logic_vector (0 downto 0) := (others => '0');
--            bineq_addr           : out std_logic_vector (4 downto 0) := (others => '0');
--            fr_ena            : out std_logic := '0';
--            fr_wea            : out std_logic_vector (0 downto 0) := (others => '0');
--            fr_addr           : out std_logic_vector (0 downto 0) := (others => '0');
--            prev_sum             : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            f1x_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            f2y_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            g1x_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            g2u_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            bineq_din            : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            fr_din               : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component compute_MPC_matrices_v2;

--component solver_sat_pen is
--  port ( 
--            clk                  : in  std_logic := '0';             
--            rst                  : in  std_logic := '0';             
--            start                : in  std_logic := '0';             
--            ready_matrix_mult    : in  std_logic := '0';             
--            ready_matrix_add     : in  std_logic := '0';             
--            ready_const_mult     : in  std_logic := '0';             
--            ready_div            : in  std_logic := '0';             
--            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_3    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            res_const_mult       : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            res_div              : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            ar_data              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            hr_data              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            pi_e_data            : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            ar_const_data        : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            hp_dout              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            g_dout               : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            ap_dout              : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            br_dout              : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            fr_dout              : in std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            ready                : out std_logic := '0';
--            reset_fp             : out std_logic := '0';
--            start_matrix_mult    : out std_logic := '0';
--            start_matrix_add     : out std_logic := '0';
--            start_const_mult     : out std_logic := '0';
--            start_div            : out std_logic := '0';
--            mode_matrix_mult     : out std_logic := '0';
--            op_matrix_add        : out std_logic := '0';
--            hr_ena               : out std_logic := '0';
--            ar_ena               : out std_logic := '0';
--            ar_const_ena         : out std_logic := '0';
--            pi_e_ena             : out std_logic := '0';
--            hp_ena              : out std_logic := '0';
--            hp_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            hp_addr             : out std_logic_vector (2 downto 0) := (others => '0');
--            g_ena              : out std_logic := '0';
--            g_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            g_addr             : out std_logic_vector (2 downto 0) := (others => '0');
--            ap_ena              : out std_logic := '0';
--            ap_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            ap_addr             : out std_logic_vector (4 downto 0) := (others => '0');
--            br_ena              : out std_logic := '0';
--            br_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            br_addr             : out std_logic_vector (4 downto 0) := (others => '0');
--            fr_ena              : out std_logic := '0';
--            fr_wea              : out std_logic_vector (0 downto 0) := (others => '0');
--            fr_addr             : out std_logic_vector (0 downto 0) := (others => '0');
--            hr_addr              : out std_logic_vector (2 downto 0) := (others => '0');
--            ar_addr              : out std_logic_vector (9 downto 0) := (others => '0');
--            ar_const_addr        : out std_logic_vector (7 downto 0) := (others => '0');
--            pi_e_addr            : out std_logic_vector (7 downto 0) := (others => '0');
--            prev_sum             : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_const_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            div_op_a            :out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            div_op_b            :out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            hp_din              : out std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            g_din               : out std_logic_vector (8*FP_WIDTH-1 downto 0) := (others => '0');
--            u1                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u2                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u3                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u4                  : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            ap_din              : out std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component solver_sat_pen;

--component matrix_mult_3 is
--  port ( 
--        clk                  : in  std_logic                     := '0';             
--        rst                  : in  std_logic                     := '0';             
--        start                : in  std_logic                     := '0';             
--        mode                 : in  std_logic                     := '0';              
--        din_mult_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_9a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_9b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_10a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_10b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_11a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_11b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_12a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_12b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_13a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_13b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_14a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_14b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_15a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_15b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_16a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_16b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_17a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_17b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_18a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_18b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_19a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_19b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_20a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_20b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_21a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_21b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_22a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_22b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_23a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_23b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_24a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_24b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_25a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_25b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_26a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_26b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_27a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_27b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_28a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_28b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_29a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_29b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_30a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_30b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_31a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_31b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_32a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_32b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_33a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_33b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_34a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_34b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_35a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_35b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        prev_sum             : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        ready                : out std_logic := '0'; 
--        dout_1               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        dout_2               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        dout_3               : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component matrix_mult_3;

--component matrix_addsub is
--  port ( 
--        clk                  : in  std_logic                     := '0';             
--        rst                  : in  std_logic                     := '0';             
--        start                : in  std_logic                     := '0';             
--        op                   : in  std_logic                     := '0';             
--        din_add_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_9a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_9b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_10a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_10b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_11a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_11b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_12a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_12b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_13a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_13b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_14a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_14b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_15a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_15b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_16a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_16b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_17a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_17b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_18a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_18b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_19a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_19b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_20a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_20b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_21a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_21b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_22a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_22b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_23a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_23b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_24a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_24b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_25a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_25b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_26a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_26b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_27a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_27b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_28a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_28b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_29a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_29b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_30a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_30b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_31a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_31b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_32a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_32b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_33a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_33b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_34a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_34b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_35a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_add_35b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        ready                : out std_logic := '0'; 
--        dout                 : out std_logic_vector(N*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component matrix_addsub;

--component const_by_matrix_mult is
--  port ( 
--        clk                  : in  std_logic                     := '0';             
--        rst                  : in  std_logic                     := '0';             
--        start                : in  std_logic                     := '0';             
--        din_mult_1a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_1b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_2b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_3b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_4b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_5b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_6b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_7b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8a         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        din_mult_8b         : in std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--        ready                : out std_logic := '0'; 
--        dout                 : out std_logic_vector(8*FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component const_by_matrix_mult;

--component model_simulator is
--  port ( 
--            clk                  : in  std_logic := '0';             
--            rst                  : in  std_logic := '0';             
--            start                : in  std_logic := '0';             
--            ready_matrix_mult    : in  std_logic := '0';             
--            ready_matrix_add     : in  std_logic := '0';             
--            res_matrix_mult_1    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_mult_2    : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            res_matrix_add       : in std_logic_vector (N*FP_WIDTH-1 downto 0) := (others => '0');
--            a_data               : in std_logic_vector (12*FP_WIDTH-1 downto 0) := (others => '0');
--            b_data               : in std_logic_vector (4*FP_WIDTH-1 downto 0) := (others => '0');
--            u1                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u2                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u3                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            u4                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            ready                : out std_logic := '0';
--            reset_fp             : out std_logic := '0';
--            start_matrix_mult    : out std_logic := '0';
--            start_matrix_add     : out std_logic := '0';
--            mode_matrix_mult     : out std_logic := '0';
--            op_matrix_add        : out std_logic := '0';
--            a_ena               : out std_logic := '0';
--            a_addr              : out std_logic_vector (3 downto 0) := (others => '0');
--            b_ena               : out std_logic := '0';
--            b_addr             : out std_logic_vector (3 downto 0) := (others => '0');
--            din_mult_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_mult_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_1b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_2b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_3b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_4b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_5b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_6b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_7b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_8b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_9b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_10b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_11b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_12b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_13b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_14b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_15b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_16b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_17b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_18b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_19b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_20b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_21b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_22b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_23b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_24b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_25b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_26b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_27b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_28b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_29b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_30b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_31b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_32b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_33b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_34b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35a : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            din_add_35b : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
--            x1 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x2 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x3 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x4 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x5 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x6 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x7 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x8 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x9 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x10 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x11 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0');
--            x12 : out std_logic_vector(FP_WIDTH-1 downto 0) := (others => '0')
--      );
--end component model_simulator; 

-- Model simulation componentes

COMPONENT A_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
  );
END COMPONENT;

COMPONENT B_rom
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(53 DOWNTO 0)
  );
END COMPONENT;

COMPONENT wrapper_model_simulator is
  port ( 
            clk                  : in  std_logic := '0';             
            rst                  : in  std_logic := '0';             
            start                : in  std_logic := '0';             
            u1                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            u2                   : in std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            ready                : out std_logic := '0';
            x1                   : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x2                   : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x3                   : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0');
            x4                   : out std_logic_vector (FP_WIDTH-1 downto 0) := (others => '0')
      );
end COMPONENT wrapper_model_simulator; 

end Entities;