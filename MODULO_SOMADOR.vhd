----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:44:52 10/22/2023 
-- Design Name: 
-- Module Name:    MODULO_SOMADOR - Behavioral 
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

entity MODULO_SOMADOR is
	Port (Ai, Bi, Cin: in STD_LOGIC;
			S_somador, Cout: out STD_LOGIC);
end MODULO_SOMADOR;

architecture Behavioral of MODULO_SOMADOR is

begin

S_somador <= ((Ai XOR Bi) XOR Cin);
Cout <= ((Ai AND Bi) OR (Cin AND (Ai XOR Bi)));

end Behavioral;

