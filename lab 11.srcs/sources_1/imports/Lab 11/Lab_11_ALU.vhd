-------------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date:  4/18/24
-- Experiment Name: Arithmetic and Logic Unit in VHDL (Lab #11)
-- Design Name: Lab_11_ALU
-- Project Name: Lab_11 
-- Target Devices: xc7a35t-1cpg236c
--
-- Description:	Design a 4-bit Arithmetic and Logic Unit (ALU) that implements 8 operations.
--				The design using the VHDL with-select-when statement.
--				The 8 operations are listed below:
--						0		AND 
--						1		OR 
--						2		NAND 
--						3		NOR 
--						4		XOR 
--						5		XNOR 
--						6		Addition
--						7		Subtraction
--				The ALU takes two 4-bit inputs (A and B).
--				The ALU produces a 4-bit output (Result) and two flag bits (Z and N).
--------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab_11_alu is
	port(A, B : in std_logic_vector(3 downto 0);
		 Sel : in std_logic_vector(2 downto 0);
		 Result : out std_logic_vector(3 downto 0);
		 Z, N : out std_logic);
end lab_11_alu;

architecture behavioral of lab_11_alu is
signal mid_Result : std_logic_vector(3 downto 0) := "0000";
begin

	Z <= '1' when mid_Result = "0000" else '0';
	
	N <= '1' when mid_Result(3) = '1' else '0';
	
	with Sel select
		mid_Result <= A and B when "000",
				  A or B when "001",
				  A nand B when "010",
				  A nor B when "011",
				  A xor B when "100",
				  A xnor B when "101",
				  A + B when "110",
				  A - B when "111",
				  "0000" when others;
Result <= mid_Result;
end behavioral;
