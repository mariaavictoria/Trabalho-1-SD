----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:39 10/24/2023 
-- Design Name: 
-- Module Name:    MODULO_COMPARADOR - Behavioral 
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

entity MODULO_COMPARADOR is
	Port (Ai, Aj, Ak, Al, Bi, Bj, Bk, Bl: in STD_LOGIC;
			S_comparador: out STD_LOGIC);
end MODULO_COMPARADOR;

architecture Behavioral of MODULO_COMPARADOR is

begin
S_comparador <= ((Al AND (NOT Bl)) OR ((Al XNOR Bl) AND (Ak AND (NOT Bk))) OR ((Al XNOR Bl) AND (Ak XNOR Bk) AND (Aj AND (NOT Bj))) OR ((Al XNOR Bl) AND (Ak XNOR Bk) AND (Aj XNOR Bj) AND (Ai AND (NOT Bi))));

end Behavioral;

