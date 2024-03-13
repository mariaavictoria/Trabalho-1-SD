----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:46 10/24/2023 
-- Design Name: 
-- Module Name:    ESQUERDA - Behavioral 
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

entity ESQUERDA is
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_esquerda: out STD_LOGIC_VECTOR (3 downto 0));
end ESQUERDA;	
			
architecture Behavioral of ESQUERDA is

component MODULO_ESQUERDA
	Port (Ai: in STD_LOGIC;
			S_esquerda: out STD_LOGIC);
end component;
			
begin

E0: MODULO_ESQUERDA PORT MAP ('0',S_esquerda(0));
E1: MODULO_ESQUERDA PORT MAP (A(0),S_esquerda(1));
E2: MODULO_ESQUERDA PORT MAP (A(1),S_esquerda(2));
E3: MODULO_ESQUERDA PORT MAP (A(2),S_esquerda(3));

end Behavioral;
