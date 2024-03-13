----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:45 10/24/2023 
-- Design Name: 
-- Module Name:    INCREMENTO - Behavioral 
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

entity INCREMENTO is
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_incremento: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Incremento: out STD_LOGIC);
end INCREMENTO;	
			
architecture Behavioral of INCREMENTO is

signal Carry: STD_LOGIC_VECTOR (3 downto 0);

component MODULO_INCREMENTO
	Port (Ai, Bi, Cin: in STD_LOGIC;
			S_incremento, Cout: out STD_LOGIC);
end component;
			
begin

I0: MODULO_INCREMENTO PORT MAP (A(0), '0', '1', S_incremento(0), Carry(0));
I1: MODULO_INCREMENTO PORT MAP (A(1), '0', Carry(0), S_incremento(1), Carry(1));
I2: MODULO_INCREMENTO PORT MAP (A(2), '0', Carry(1), S_incremento(2), Carry(2));
I3: MODULO_INCREMENTO PORT MAP (A(3), '0', Carry(2), S_incremento(3), Carry(3));
Overflow_Incremento <= Carry(2);

end Behavioral;

