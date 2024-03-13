----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:26 10/24/2023 
-- Design Name: 
-- Module Name:    DIREITA - Behavioral 
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

entity DIREITA is
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_direita: out STD_LOGIC_VECTOR (3 downto 0));
end DIREITA;	
			
architecture Behavioral of DIREITA is

component MODULO_DIREITA
	Port (Ai: in STD_LOGIC;
			S_direita: out STD_LOGIC);
end component;
			
begin

D0: MODULO_DIREITA PORT MAP (A(1),S_direita(0));
D1: MODULO_DIREITA PORT MAP (A(2),S_direita(1));
D2: MODULO_DIREITA PORT MAP (A(3),S_direita(2));
D3: MODULO_DIREITA PORT MAP ('0',S_direita(3));

end Behavioral;