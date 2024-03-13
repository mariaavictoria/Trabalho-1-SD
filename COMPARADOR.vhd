----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:34 10/24/2023 
-- Design Name: 
-- Module Name:    COMPARADOR - Behavioral 
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

entity COMPARADOR is
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_comparador: out STD_LOGIC_VECTOR (3 downto 0));			
end COMPARADOR;

architecture Behavioral of COMPARADOR is

component MODULO_COMPARADOR
	Port (Ai, Aj, Ak, Al, Bi, Bj, Bk, Bl: in STD_LOGIC;
			S_comparador: out STD_LOGIC);
end component;			

begin

C0: MODULO_COMPARADOR PORT MAP (A(0), A(1), A(2), A(3), B(0), B(1), B(2), B(3), S_comparador(0));
C1: MODULO_COMPARADOR PORT MAP ('0', '0', '0', '0', '0', '0', '0', '0', S_comparador(1));
C2: MODULO_COMPARADOR PORT MAP ('0', '0', '0', '0', '0', '0', '0', '0', S_comparador(2));
C3: MODULO_COMPARADOR PORT MAP ('0', '0', '0', '0', '0', '0', '0', '0', S_comparador(3));
end Behavioral;
