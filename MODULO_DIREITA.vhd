----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:18 10/24/2023 
-- Design Name: 
-- Module Name:    MODULO_DIREITA - Behavioral 
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

entity MODULO_DIREITA is
	Port (Ai: in STD_LOGIC;
			S_direita: out STD_LOGIC);
end MODULO_DIREITA;

architecture Behavioral of MODULO_DIREITA is

begin

S_direita <= Ai;

end Behavioral;

