# Behavioural

![Circuito mux_8to1_ce](immagini/mux_8to1_ce.svg)

```vhdl
-- libraries
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mux_8to1_ce is
port (
  Data_in : in std_logic_vector (7 downto 0);
  SEL : in std_logic_vector (2 downto 0);
  CE : in std_logic;
  F_CTRL : out std_logic
);
end mux_8to1_ce;

-- architecture
architecture mux_8to1_ce_arc of mux_8to1_ce is
begin
  my_mux: process (Data_in,SEL,CE)
  begin
    if (CE = '0') then
      F_CTRL <= '0';
    else
      if (SEL = "111") then F_CTRL <= Data_in(7);
      elsif (SEL = "110") then F_CTRL <= Data_in(6);
      elsif (SEL = "101") then F_CTRL <= Data_in(5);
      elsif (SEL = "100") then F_CTRL <= Data_in(4);
      elsif (SEL = "011") then 
        F_CTRL <= Data_in(3);
      elsif (SEL = "010") then F_CTRL <= Data_in(2);
      elsif (SEL = "001") then F_CTRL <= Data_in(1);
      elsif (SEL = "000") then F_CTRL <= Data_in(0);
      else F_CTRL <= '0';
      end if;
    end if;
  end process my_mux;
end mux_8to1_ce_arch;
```

Nell'esempio presente è stato dichiarato un [CS](dataflow.md) di tipo **process**, che è il contenitore per una definizione di tipo behavioural. Process ha il seguente scheletro:

```vhdl
process_label: process(sensitivity_list) is
  -- variables declaration
begin
  -- SSs declaration
end process process_label;
```

Molto importante è la `sensitivity_list`: dall'esempio si vede che è una lista di segnali. Tali segnali sono **segnali di trigger** che scatenano l'esecuzione del process ogni qualvolta il valore del [segnale](vhdl.md#data-object-e-data-type) cambi.

In un process è possibile dichiarare:

- [**variables**](vhdl.md#variable): dichiarati subito dopo la dichiarazione del process;
- **SS** o *Sequential Statement*: sono vere e proprie istruzioni algoritmiche, che sono eseguite **sequenzialmente**. Appartengono alla categoria
  - **SSA** o *sequential [signal assignment](vhdl.md#signal)*: l'assegnazione avviene *one-shot*, quindi una volta eseguita l'istruzione il segnale da valorizzare manterrà quel valore anche se cambia il valore di un componente dell'espressione, *tranne se questo è contenuto nella sensitivity_list*, caso in cui il process sarà eseguito nuovamente;
  - **SVA** o *sequential [variable assignment](vhdl.md#variable)*.
- **conditional construcs**.

## Conditional Constructs

Sono la stessa cosa di costrutti condizionali algoritmici.

- **if**: visibile nell'esempio del mux a bus dati da 8;

- **case**

  ```vhdl
  architecture my_case_arc of mux_8to1_ce is
  begin
    my_mux: process (SEL,Data_in,CE)
    begin
      if (CE = '1') then
        case (SEL) is
          when "000" => F_CTRL <= Data_in(0);
          when "001" => F_CTRL <= Data_in(1);
          when "010" => F_CTRL <= Data_in(2);
          when "011" => F_CTRL <= Data_in(3);
          when "100" => F_CTRL <= Data_in(4);
          when "101" => F_CTRL <= Data_in(5);
          when "110" => F_CTRL <= Data_in(6);
          when "111" => F_CTRL <= Data_in(7);
          when others => F_CTRL <= '0';
        end case;
      else
        F_CTRL <= '0';
      end if;
    end process my_mux;
  end my_case_ex;
  ```