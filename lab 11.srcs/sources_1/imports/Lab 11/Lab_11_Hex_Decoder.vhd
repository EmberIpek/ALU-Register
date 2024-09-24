--------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date:  4/18/24
-- Experiment Name: Arithmetic and Logic Unit in VHDL (Lab #11)
-- Design Name: Lab_11_Hex_Decoder
-- Project Name: Lab_11
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: Design a Hex to Seven-segment Decoder using the VHDL with-select-when statement.
--				You may use the VHDL description written in Lab 7 (BCD to Seven-segment Converter in VHDL).
---------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab_11_Hex_Decoder is
	port(Hex : in std_logic_vector(3 downto 0);
		 Seg : out std_logic_vector(1 to 7);
		 disp_right, disp_left, disp_midright, disp_midleft : out STD_LOGIC);
end lab_11_Hex_Decoder;

architecture behavioral of lab_11_Hex_Decoder is
begin

with Hex select
	Seg <= "0000001" WHEN "0000",
	"1001111" WHEN "0001",
	"0010010" WHEN "0010",
	"0000110" WHEN "0011",
	"1001100" WHEN "0100",
	"0100100" WHEN "0101",
	"0100000" WHEN "0110",
	"0001111" WHEN "0111",
    "0000000" WHEN "1000",
	"0000100" WHEN "1001",
	"0001000" WHEN "1010",
	"1100000" WHEN "1011",
	"0110001" WHEN "1100",
	"1000010" WHEN "1101",
	"0110000" WHEN "1110",
	"0111000" WHEN "1111",
	"0000000" when others;
	
	disp_right <= '0';		-- turn the seven-segment display on
	disp_left <= '1';		-- turn the seven-segment display off
	disp_midright <= '1';	-- turn the seven-segment display off
	disp_midleft <= '1';	-- turn the seven-segment display off 
end behavioral;
