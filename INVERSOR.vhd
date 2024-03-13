----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:02 10/24/2023 
-- Design Name: 
-- Module Name:    INVERSOR - Behavioral 
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

entity INVERSOR is
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_inversor: out STD_LOGIC_VECTOR (3 downto 0));
end INVERSOR;	
			
architecture Behavioral of INVERSOR is

component MODULO_INVERSOR
	Port (Ai: in STD_LOGIC;
			S_inversor: out STD_LOGIC);
end component;
			
begin

INV0: MODULO_INVERSOR PORT MAP (A(0),S_inversor(0));
INV1: MODULO_INVERSOR PORT MAP (A(1),S_inversor(1));
INV2: MODULO_INVERSOR PORT MAP (A(2),S_inversor(2));
INV3: MODULO_INVERSOR PORT MAP (A(3),S_inversor(3));

end Behavioral;