----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2022 14:52:31
-- Design Name: 
-- Module Name: ESC_PID_Control_Pkg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

package ESC_PID_Control_Pkg is

    constant FISHHOOK_ROM_ADDR_WIDTH: integer := 10;
    constant FISHHOOK_ROM_DEPTH: std_logic_vector(FISHHOOK_ROM_ADDR_WIDTH-1 downto 0) := "1111101000"; -- 1001
    
end ESC_PID_Control_Pkg;
