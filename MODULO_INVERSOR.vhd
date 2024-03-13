----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:57:30 10/24/2023 
-- Design Name: 
-- Module Name:    MODULO_INVERSOR - Behavioral 
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

entity MODULO_INVERSOR is
	Port (Ai: in STD_LOGIC;
			S_inversor: out STD_LOGIC);
end MODULO_INVERSOR;

architecture Behavioral of MODULO_INVERSOR is

begin

S_inversor <= (NOT Ai);

end Behavioral;

