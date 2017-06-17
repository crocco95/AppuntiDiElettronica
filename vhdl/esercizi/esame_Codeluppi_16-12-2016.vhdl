-- libraries
library IEEE;
use IEE.std_logic_1164.all;

-- entity
entity esercizio_2 is
	port(
		input_1, input_0: in std_logic;
		clock, reset: in std_logic;
		output_1, output_0: out std_logic
	);
end esercizio_2;

-- architecture
architecture esercizio_2_architecture of esercizio_2 is
  type stato is (A, B, C, D)
  signal stato_corrente <= A, stato_successivo <= A : stato;
begin
  latch_process : process(clock, reset)
    if (reset = '1') then
      stato_successivo := D;
      stato_corrente := D;
    elsif (rising_edge(clock)) then
      stato_corrente := stato_successivo;
      case (stato_corrente) is
        when A => output_1 <= '0', output_0 = '0';
        when B => output_1 <= '0', output_0 = '1';
        when C => output_1 <= '1', output_0 = '0';
        when D => output_1 <= '1', output_0 = '1';
      end case;
    end if;
  end process sync_proc;
  
  rete_combinatoria_process : process(input_1, input_0)
  begin
    
  end process rete_combinatoria_process
end esercizio_2_architecture