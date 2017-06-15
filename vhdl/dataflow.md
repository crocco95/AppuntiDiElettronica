# Dataflow

All'interno è possibile dichiarare vari construtti, che sono:

- [**intermediate signals**](vhdl.md#data-object-e-data-type): dichiarati subito dopo la dichiarazione dell'architecture;
- **CS** o *Concurrent Statement*: sono descrizioni di tipo funzionale (che descrivono una funzione) di parti parti distinte del circuito, ognuna dei quali sarà allocata dal syntesizer in parti di hardware separate dalle altre. Di conseguenza ogni CS è eseguito **fisicamente in parallelo** agli altri; per questo è consigliabile frammentare il più possibile i blocchi funzionali un circuito. I concurrent statements sono divisi in:
  - **CSA** o *Concurrent Signal Assignment*;


## CSA


Ci sono più tipi di assegnamento di segnali:

- [**tradizionale**](vhdl.md#signal): una relazione tra un signal **target** ed una [espressione](vhdl.md#espressioni). Tale relazione sarà **rivalutata** o *rieseguita* ogni qualvolta un componente dell'espressione cambi di valore; se si pensa ad un circuito di porte logiche la rivalutazione dell'espressione automatica è una cosa normale;
- **condizionale**: permette di specificare una relazione di un segnale con molteplici espressioni tradizionali. Essendo composta da espressioni tradizionali, ogni volta che cambia un valore di un componente di una delle espressioni, si rivaluta l'intero costrutto;

### Conditional CSA

La prima espressione la cui condizione associata è valida sarà quella associata al segnale.

Ci sono varie sintassi per esprimere un assegnamento condizionale. **Nessuna supporta altre condizioni annidate**.

- **"if tradizionale"**: ogni espressione ha una [condizione](vhdl.md#condizioni) associata.

  ![Circuito my_4t1_mux](immagini/vhdl_my_4t1_mux.svg)

  ```vhdl
  --
  -- 4-input MUX
  --

  -- libraries
  library IEEE;
  use IEEE.std_logic_1164.all;

  -- entity
  entity my_4t1_mux is
  port(D3,D2,D1,D0 : in std_logic;
    SEL: in std_logic_vector(1 downto 0);
    MX_OUT : out std_logic);
  end my_4t1_mux;

  -- architecture
  architecture mux4t1 of my_4t1_mux is
  begin
    MX_OUT <= D3 when (SEL = "11") else
              D2 when (SEL = "10") else
              D1 when (SEL = "01") else
              D0 when (SEL = "00") else
              '0';
  end mux4t1;
  ```

- **select**:

  ```vhdl
  -- architecture
  architecture my_circuit_arc2 of my_circuit is
    signal t_sig : std_logic_vector(2 downto 0); -- local bundle
  begin
    t_sig <= (L & M & N); -- concatenation operator
    with (t_sig) select
      F3 <= '1' when "001" | "110" | "111",
            '0' when others;
  end my_circuit_arc2;
  ```

- **case**
