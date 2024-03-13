----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:27:39 10/22/2023 
-- Design Name: 
-- Module Name:    SOMADOR - Behavioral 
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

entity SOMADOR is
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_somador: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Somador: out STD_LOGIC);			
end SOMADOR;

architecture Behavioral of SOMADOR is

signal Carry: STD_LOGIC_VECTOR (3 downto 0);


component MODULO_SOMADOR
	Port (Ai, Bi, Cin: in STD_LOGIC;
			S_somador, Cout: out STD_LOGIC);
end component;			

begin

M0: MODULO_SOMADOR PORT MAP (A(0), B(0), '0', S_somador(0), Carry(0));
M1: MODULO_SOMADOR PORT MAP (A(1), B(1), Carry(0), S_somador(1), Carry(1));
M2: MODULO_SOMADOR PORT MAP (A(2), B(2), Carry(1), S_somador(2), Carry(2));
M3: MODULO_SOMADOR PORT MAP (A(3), B(3), Carry(2), S_somador(3), Carry(3));
Overflow_Somador <= Carry(2); 

end Behavioral;

