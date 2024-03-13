----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:07 10/26/2023 
-- Design Name: 
-- Module Name:    COMPLEMENTO - Behavioral 
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

entity COMPLEMENTO is
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_complemento: out STD_LOGIC_VECTOR (3 downto 0));
end COMPLEMENTO;	
			
architecture Behavioral of COMPLEMENTO is

signal POS_INV: STD_LOGIC_VECTOR (3 downto 0);
signal Over_Descarte2: STD_LOGIC;

component INVERSOR
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_inversor: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component INCREMENTO
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_incremento: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Incremento: out STD_LOGIC);
end component;

			
begin

CPL1: INVERSOR PORT MAP (A, POS_INV);
CPL2: INCREMENTO PORT MAP (POS_INV,S_complemento, Over_Descarte2);


end Behavioral;