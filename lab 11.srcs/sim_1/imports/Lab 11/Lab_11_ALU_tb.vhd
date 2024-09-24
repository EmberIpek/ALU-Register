--------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 4/19/24
-- Experiment Name: Arithmetic and Logic Unit in VHDL (Lab #11)
-- Project Name: Lab_11
--
-- Description:	Test bench for the Arithmetic and Logic Unit (Lab #11)
-- 				The test vectors to be used are specified in the lab.
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity lab_11_alu_tb is
end lab_11_alu_tb;

architecture behavior of lab_11_alu_tb is

-- component declaration for unit under test
component lab_11_ALU is
port(A, B : in std_logic_vector(3 downto 0);
		 Sel : in std_logic_vector(2 downto 0);
		 Result : out std_logic_vector(3 downto 0);
		 Z, N : out std_logic);
end component;

-- signal declaration
signal A_tb, B_tb : std_logic_vector(3 downto 0);
signal Sel_tb : std_logic_vector(2 downto 0);
signal Result_tb : std_logic_vector(3 downto 0);
signal Z_tb, N_tb : std_logic;

begin
	-- instantiate the device under test (dut)
	dut : lab_11_ALU port map(
		A => A_tb,
		B => B_tb,
		Sel => Sel_tb,
		Result => Result_tb,
		Z => Z_tb,
		N => N_tb
		);
			
	stimuli : process
	begin
	A_tb <= "0010";
	B_tb <= "1100";
	Sel_tb <= "000";
	wait for 10ns;
	A_tb <= "0110";
	B_tb <= "1000";
	Sel_tb <= "000";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "1100";
	Sel_tb <= "001";
	wait for 10ns;
	A_tb <= "0110";
	B_tb <= "1000";
	Sel_tb <= "001";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "1100";
	Sel_tb <= "010";
	wait for 10ns;
	A_tb <= "0110";
	B_tb <= "1000";
	Sel_tb <= "010";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "1100";
	Sel_tb <= "011";
	wait for 10ns;
	A_tb <= "0110";
	B_tb <= "1000";
	Sel_tb <= "011";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "1100";
	Sel_tb <= "100";
	wait for 10ns;
	A_tb <= "0110";
	B_tb <= "1000";
	Sel_tb <= "100";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "1100";
	Sel_tb <= "101";
	wait for 10ns;
	A_tb <= "0110";
	B_tb <= "1000";
	Sel_tb <= "101";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "0010";
	Sel_tb <= "110";
	wait for 10ns;
	A_tb <= "0010";
	B_tb <= "1111";
	Sel_tb <= "110";
	wait for 10ns;
	A_tb <= "1110";
	B_tb <= "0001";
	Sel_tb <= "110";
	wait for 10ns;
	A_tb <= "1111";
	B_tb <= "1110";
	Sel_tb <= "110";
	wait for 10ns;
	
	A_tb <= "0010";
	B_tb <= "0010";
	Sel_tb <= "111";
	wait for 10ns;
	A_tb <= "0010";
	B_tb <= "1111";
	Sel_tb <= "111";
	wait for 10ns;
	A_tb <= "1110";
	B_tb <= "0001";
	Sel_tb <= "111";
	wait for 10ns;
	A_tb <= "1111";
	B_tb <= "1110";
	Sel_tb <= "111";
	wait for 10ns;
	end process stimuli;
	
end behavior;
