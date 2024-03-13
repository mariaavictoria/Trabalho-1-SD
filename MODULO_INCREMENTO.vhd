----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:04 10/24/2023 
-- Design Name: 
-- Module Name:    MODULO_INCREMENTO - Behavioral 
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

entity MODULO_INCREMENTO is
	Port (Ai, Bi, Cin: in STD_LOGIC;
			S_incremento, Cout: out STD_LOGIC);
end MODULO_INCREMENTO;

architecture Behavioral of MODULO_INCREMENTO is

begin

S_incremento <= ((Ai XOR Bi) XOR Cin);
Cout <= ((Ai AND Bi) OR (Cin AND (Ai XOR Bi)));

end Behavioral;

