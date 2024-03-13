----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:27 10/26/2023 
-- Design Name: 
-- Module Name:    SUBTRATOR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUBTRATOR is
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_subtrator: out STD_LOGIC_VECTOR (3 downto 0));			
end SUBTRATOR;

architecture Behavioral of SUBTRATOR is

signal POS_INV_SUB: STD_LOGIC_VECTOR (3 downto 0);
signal POS_INC_SUB: STD_LOGIC_VECTOR (3 downto 0);
signal POS_INC_OVER: STD_LOGIC;
signal Over_Descarte1: STD_LOGIC;

component INVERSOR
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_inversor: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component INCREMENTO
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_incremento: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Incremento: out STD_LOGIC);
end component;

component SOMADOR
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_somador: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Somador: out STD_LOGIC);	
end component;			

begin

S0: INVERSOR PORT MAP (B, POS_INV_SUB);
S1: INCREMENTO PORT MAP (POS_INV_SUB, POS_INC_SUB, POS_INC_OVER);
S2: SOMADOR PORT MAP (A, POS_INC_SUB, S_subtrator, Over_Descarte1);

end Behavioral;

