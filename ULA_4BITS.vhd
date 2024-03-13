----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:03:03 10/22/2023 
-- Design Name: 
-- Module Name:    ULA_4BITS - Behavioral 
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

entity ULA_4BITS is
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			B: in STD_LOGIC_VECTOR (3 downto 0);
			Sel: in STD_LOGIC_VECTOR (2 downto 0);
			Saida: out STD_LOGIC_VECTOR (3 downto 0);
			CarryOut: out STD_LOGIC;
			Negativo: out STD_LOGIC;
			TudoZero: out STD_LOGIC;
			Overflow: out STD_LOGIC);			
end ULA_4BITS;

architecture Behavioral of ULA_4BITS is

component SELETOR
	Port (Sel: in STD_LOGIC_VECTOR (2 downto 0);
			S_somador: in STD_LOGIC_VECTOR (3 downto 0);
			S_subtrator: in STD_LOGIC_VECTOR (3 downto 0);
			S_incremento: in STD_LOGIC_VECTOR (3 downto 0);
			S_inversor: in STD_LOGIC_VECTOR (3 downto 0);
			S_direita: in STD_LOGIC_VECTOR (3 downto 0);
			S_esquerda: in STD_LOGIC_VECTOR (3 downto 0);
			S_comparador: in STD_LOGIC_VECTOR (3 downto 0);
			S_complemento: in STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Somador: in STD_LOGIC;
			Overflow_Incremento: in STD_LOGIC;
			Resultado: out STD_LOGIC_VECTOR (3 downto 0);
			CarryOut_1: out STD_LOGIC;
			Negativo_1: out STD_LOGIC;
			TudoZero_1: out STD_LOGIC;
			Overflow_1: out STD_LOGIC);
end component;

component SOMADOR
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_somador: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Somador: out STD_LOGIC);
end component;

component SUBTRATOR
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_subtrator: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component INCREMENTO
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_incremento: out STD_LOGIC_VECTOR (3 downto 0);
			Overflow_Incremento: out STD_LOGIC);
end component;

component INVERSOR
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_inversor: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component DIREITA
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_direita: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ESQUERDA
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_esquerda: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component COMPARADOR
	Port (A, B: in STD_LOGIC_VECTOR (3 downto 0);
			S_comparador: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component COMPLEMENTO
	Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			S_complemento: out STD_LOGIC_VECTOR (3 downto 0));
end component;			

signal S_somador: STD_LOGIC_VECTOR (3 downto 0);			
signal S_subtrator: STD_LOGIC_VECTOR (3 downto 0);			
signal S_incremento: STD_LOGIC_VECTOR (3 downto 0);			
signal S_inversor: STD_LOGIC_VECTOR (3 downto 0);			
signal S_direita: STD_LOGIC_VECTOR (3 downto 0);			
signal S_esquerda: STD_LOGIC_VECTOR (3 downto 0);			
signal S_comparador: STD_LOGIC_VECTOR (3 downto 0);			
signal S_complemento: STD_LOGIC_VECTOR (3 downto 0);			
signal Resultado: STD_LOGIC_VECTOR (3 downto 0);
signal Overflow_Somador: STD_LOGIC;
signal Overflow_Incremento: STD_LOGIC;
signal CarryOut_1: STD_LOGIC;
signal Negativo_1: STD_LOGIC;
signal TudoZero_1: STD_LOGIC;
signal Overflow_1: STD_LOGIC;
			


begin

MUX: SELETOR PORT MAP (Sel, S_somador, S_subtrator, S_incremento, S_inversor, S_direita, S_esquerda, S_comparador, S_complemento, Overflow_Somador, Overflow_Incremento, Resultado, CarryOut_1, Negativo_1, TudoZero_1, Overflow_1);
SOM: SOMADOR PORT MAP (A, B, S_somador, Overflow_Somador);
SUB: SUBTRATOR PORT MAP (A, B, S_subtrator);
INC: INCREMENTO PORT MAP (A, S_incremento, Overflow_Incremento);
INVS: INVERSOR PORT MAP (A, S_inversor);
DIR: DIREITA PORT MAP (A, S_direita);
ESQ: ESQUERDA PORT MAP (A, S_esquerda);
COMP: COMPARADOR PORT MAP (A, B, S_comparador);
CPL: COMPLEMENTO PORT MAP (A, S_complemento);

Saida <= Resultado;
CarryOut <= CarryOut_1;
Negativo <= Negativo_1;
TudoZero <= TudoZero_1;
Overflow <= Overflow_1;

end Behavioral;

