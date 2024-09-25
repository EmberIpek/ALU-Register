library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Lab_11_top_level is
    port(top_A, top_B : in std_logic_vector(3 downto 0);
		 top_Sel : in std_logic_vector(2 downto 0);
		 top_Z, top_N : out std_logic;
		 top_Seg : out std_logic_vector(1 to 7);
		 disp_right, disp_left, disp_midright, disp_midleft : out STD_LOGIC);
end Lab_11_top_level;

architecture structural of Lab_11_top_level is

--component declarations
component Lab_11_Hex_Decoder
    port(Hex : in std_logic_vector(3 downto 0);
		 Seg : out std_logic_vector(1 to 7));
end component;

component Lab_11_ALU
    port(A, B : in std_logic_vector(3 downto 0);
		 Sel : in std_logic_vector(2 downto 0);
		 Result : out std_logic_vector(3 downto 0);
		 Z, N : out std_logic);
end component;

--signal declarations
signal Res : std_logic_vector(3 downto 0);

begin
    ALU : Lab_11_ALU port map(
    A => top_A,
    B => top_B,
    Sel => top_Sel,
    Result => Res,
    Z => top_Z,
    N => top_N
    );
    
    Decoder : Lab_11_Hex_Decoder port map(
    Hex => Res,
    Seg => top_Seg
    );

disp_right <= '0';		-- turn the seven-segment display on
disp_left <= '1';		-- turn the seven-segment display off
disp_midright <= '1';	-- turn the seven-segment display off
disp_midleft <= '1';	-- turn the seven-segment display off 

end structural;
