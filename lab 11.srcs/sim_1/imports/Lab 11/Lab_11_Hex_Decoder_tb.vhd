--------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 
-- Experiment Name: Arithmetic and Logic Unit in VHDL (Lab #11)
-- Project Name: Lab_11
--
-- Description:	Testbench for the Hex to Seven-segment Decoder (Lab #11).
-- 				It tests ALL of the possible input combinations (0000 to 1111).
--				This is known as an "exhaustive test".
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab_11_Hex_Decoder_tb is
end lab_11_Hex_Decoder_tb;

architecture behavior of lab_11_Hex_Decoder_tb is

-- component declaration for unit under test
component lab_11_Hex_Decoder is
	port(Hex : in std_logic_vector(3 downto 0);
		 Seg : out std_logic_vector(1 to 7));
end component;

-- signal declaration
signal Hex_tb : std_logic_vector(3 downto 0) := "0000";
signal Seg_tb: std_logic_vector(1 to 7);


begin
	-- instantiate the unit device test (dut)
	dut : lab_11_Hex_Decoder port map  (
			Hex => Hex_tb,
			Seg => Seg_tb
			);
	
	stimuli : process
	begin
	
	wait for 10 ns;
		Hex_tb <= Hex_tb + 1;
		
	end process stimuli;
	
end behavior;
