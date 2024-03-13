----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:04:45 10/22/2023 
-- Design Name: 
-- Module Name:    SELETOR - Behavioral 
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

entity SELETOR is
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
end SELETOR;

architecture Behavioral of SELETOR is

begin

P1: PROCESS (Sel, S_somador, S_subtrator, S_incremento, S_inversor, S_direita, S_esquerda, S_comparador, S_complemento, Overflow_Somador, Overflow_Incremento)

begin

IF ((NOT Sel(2) AND NOT Sel(1) AND NOT Sel(0)) = '1') then
	Resultado <= S_somador;
	CarryOut_1 <= '0';
	Negativo_1 <= '0';
	TudoZero_1 <= ((NOT S_somador(0)) AND (NOT S_somador(1)) AND (NOT S_somador(2)) AND (NOT S_somador(3)));
	Overflow_1 <= Overflow_Somador;
	
ELSIF ((NOT Sel(2) AND NOT Sel(1) AND Sel(0)) = '1') then
	Resultado <= S_subtrator;
	CarryOut_1 <= '0';
	Negativo_1 <= S_subtrator(3);
	TudoZero_1 <= ((NOT S_subtrator(0)) AND (NOT S_subtrator(1)) AND (NOT S_subtrator(2)) AND (NOT S_subtrator(3)));
	Overflow_1 <= '0';
	
ELSIF ((NOT Sel(2) AND Sel(1) AND NOT Sel(0)) = '1') then	
	Resultado <= S_incremento;
	CarryOut_1 <= '0';
	Negativo_1 <= '0';
	TudoZero_1 <= '0';
	Overflow_1 <= Overflow_Incremento;
	
ELSIF ((NOT Sel(2) AND Sel(1) AND Sel(0)) = '1') then	
	Resultado <= S_inversor;
	CarryOut_1 <= '0';
	Negativo_1 <= '0';
	TudoZero_1 <= '0';
	Overflow_1 <= '0';
	
ELSIF ((Sel(2) AND NOT Sel(1) AND NOT Sel(0)) = '1') then
	Resultado <= S_direita;
	CarryOut_1 <= '0';
	Negativo_1 <= '0';
	TudoZero_1 <= ((NOT S_direita(0)) AND (NOT S_direita(1)) AND (NOT S_direita(2)) AND (NOT S_direita(3)));
	Overflow_1 <= '0';
	
ELSIF ((Sel(2) AND NOT Sel(1) AND Sel(0)) = '1') then	
	Resultado <= S_esquerda;
	CarryOut_1 <= '0';
	Negativo_1 <= '0';
	TudoZero_1 <= ((NOT S_esquerda(0)) AND (NOT S_esquerda(1)) AND (NOT S_esquerda(2)) AND (NOT S_esquerda(3)));
	Overflow_1 <= '0';

ELSIF ((Sel(2) AND Sel(1) AND NOT Sel(0)) = '1') then
	Resultado <= S_comparador;
	CarryOut_1 <= '0';
	Negativo_1 <= '0';
	TudoZero_1 <= (NOT S_comparador(0));
	Overflow_1 <= '0';
	
ELSIF ((Sel(2) AND Sel(1) AND Sel(0)) = '1') then
	Resultado <= S_complemento;
	CarryOut_1 <= '0';
	Negativo_1 <= '1';
	TudoZero_1 <= '0';
	Overflow_1 <= '0';

end IF;

end PROCESS;	
	
end Behavioral;

