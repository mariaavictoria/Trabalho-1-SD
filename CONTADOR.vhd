----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:25 10/30/2023 
-- Design Name: 
-- Module Name:    CONTADOR - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTADOR is
    Port ( SELETOR : in  STD_LOGIC_VECTOR (2 downto 0);
           CLOCK : in  STD_LOGIC;
           STEP : out  STD_LOGIC_VECTOR (1 downto 0);
           LEDS : out  STD_LOGIC_VECTOR (3 downto 0));
end CONTADOR;

architecture Behavioral of CONTADOR is

component ULA_4BITS is
    Port (A: in STD_LOGIC_VECTOR (3 downto 0);
			B: in STD_LOGIC_VECTOR (3 downto 0);
			Sel: in STD_LOGIC_VECTOR (2 downto 0);
			Saida: out STD_LOGIC_VECTOR (3 downto 0);
			CarryOut: out STD_LOGIC;
			Negativo: out STD_LOGIC;
			TudoZero: out STD_LOGIC;
			Overflow: out STD_LOGIC);
end component;

-- Steps:
-- #00: MOSTRAR ENTRADA A
-- #01: MOSTRAR ENTRADA B
-- #02: MOSTRAR RESULTADO
-- #03: MOSTRAR FLAGS

-- VETOR CONTADOR
SIGNAL Vetor_Contador : UNSIGNED (5 downto 0) := "000000";

-- FLAGS:
SIGNAL LED_CarryOut : STD_LOGIC := '0';
SIGNAL LED_TudoZero : STD_LOGIC := '0';
SIGNAL LED_Negativo : STD_LOGIC := '0';
SIGNAL LED_Overflow : STD_LOGIC := '0';

-- VETORES DE ENTRADA:
SIGNAL Entrada_A : STD_LOGIC_VECTOR (3 downto 0) := "0000";
SIGNAL Entrada_B : STD_LOGIC_VECTOR (3 downto 0) := "0000";

-- VETOR RESULTADO:
SIGNAL Vetor_Resultado : STD_LOGIC_VECTOR (3 downto 0) := "0000";

SIGNAL Contagem: INTEGER := 1;
SIGNAL Valor: STD_LOGIC := '0';



begin

-- PASSAR DADOS PARA AS ENTRADAS:
Entrada_A(0) <= Vetor_Contador(0);
Entrada_A(1) <= Vetor_Contador(1);
Entrada_A(2) <= Vetor_Contador(2);
Entrada_A(3) <= '0';
Entrada_B(0) <= Vetor_Contador(3);
Entrada_B(1) <= Vetor_Contador(4);
Entrada_B(2) <= Vetor_Contador(5);
Entrada_B(3) <= '0';

-- PASSAR DADOS PARA A ULA:
ULA: ULA_4BITS port map (Entrada_A, Entrada_B, SELETOR, Vetor_Resultado, LED_CarryOut, LED_Negativo, LED_TudoZero, LED_Overflow);

process(CLOCK)

	VARIABLE MOSTRAR_STEP : integer range 3 downto 0 := 0;

-- CLOCK
begin
if (CLOCK'event and CLOCK = '1') then
	Contagem <= Contagem + 1;
if (Contagem = 50000000) then
			
	if ( MOSTRAR_STEP = 0 ) then -- ENTRADA A
		LEDS <= Entrada_A;
		STEP <= "00";
	elsif ( MOSTRAR_STEP = 1) then -- ENTRADA B
		LEDS <= Entrada_B;
		STEP <= "01";
	elsif ( MOSTRAR_STEP = 2 ) then -- RESULTADO
		LEDS <= Vetor_Resultado;
		STEP <= "10";
	elsif ( MOSTRAR_STEP = 3 ) then -- FLAGS
		LEDS(0) <= LED_CarryOut;
		LEDS(1) <= LED_TudoZero;
		LEDS(2) <= LED_Negativo;
		LEDS(3) <= LED_Overflow;
		STEP <= "11";
		Vetor_Contador <= Vetor_Contador + 1;
 	end if;
	Contagem <= 1;
	if ( MOSTRAR_STEP = 3 ) then
		MOSTRAR_STEP := 0;
	else
		MOSTRAR_STEP := MOSTRAR_STEP +1;
	end if;
end if;
end if;

end process;	

end Behavioral;