

# Esercizi del libro [Free Range VHDL](http://freerangefactory.org/pdf/df344hdh4h8kjfh3500ft2/free_range_vhdl.pdf)

Le soluzioni proposte **non sono gli unici modi** per risolvere l'esercizio.

## Chapter 4: VHDL Programming Paradigm

### Esercizio 2

Intestazione comune a tutte le funzioni:
```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity exercise2 is
port(
  A, B, C, D : in std_logic;
  F : out std_logic
);
end exercise2
```

1. Tabella della verità per la funzione A:

   | A    | B    | C    | D    | OUT  |
   | ---- | ---- | ---- | ---- | ---- |
   | 0    | 0    | 0    | 0    | 0    |
   | 0    | 0    | 0    | 1    | 0    |
   | 0    | 0    | 1    | 0    | 1    |
   | 0    | 0    | 1    | 1    | 1    |
   | 0    | 1    | 0    | 0    | 0    |
   | 0    | 1    | 0    | 1    | 0    |
   | 0    | 1    | 1    | 0    | 1    |
   | 0    | 1    | 1    | 1    | 0    |
   | 1    | 0    | 0    | 0    | 0    |
   | 1    | 0    | 0    | 1    | 0    |
   | 1    | 0    | 1    | 0    | 1    |
   | 1    | 0    | 1    | 1    | 1    |
   | 1    | 1    | 0    | 0    | 0    |
   | 1    | 1    | 0    | 1    | 0    |
   | 1    | 1    | 1    | 0    | 1    |
   | 1    | 1    | 1    | 1    | 0    |

   ```vhdl
   architecture functionAShort of exercise2 is
   begin
     F <= ((not A) and C and (not D)) or ((not B) and C) or (B and C and (not D));
   end functionAShort
   ```

   ```vhdl
   architecture functionAConditional of exercise2 is
     signal inputPorts : std_logic_vector (3 downto 0);
   begin
     inputSignals <= (A & B & C & D)
     F <= '1' when inputSignals = '0010'|'0011'|'0110'|'1010'|'1011'|'1110' else
          '0';
   end functionAConditional
   ```

   ```vhdl
   architecture functionASelect of exercise2 is
     signal inputPorts : std_logic_vector (3 downto 0);
   begin
     inputSignals <= (A & B & C & D)
     with (inputSignals) select
       F <= '1' when '0010'|'0011'|'0110'|'1010'|'1011'|'1110',
            '0' when others;
   end functionASelect
   ```

## Chapter 5: Standard Models in VHDL Architectures

### Esercizio 2

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity exercise2 is
port(
  A_1, A_2 : in std_logic;
  B_1, B_2 : in std_logic;
  D_1 : in std_logic;
  E_out : out std_logic
);
end exercise2

architecture esercise2If of exercise2 is
begin
  process(A_1, A_2, B_1, B_2, D_1)
    if((A_1 and A_2) or (B_1 or B_2) or (B_2 and (not D_1))) then E_out <= 1
    else E_out <= 0;
    end if;
  end process;
end exercise2If


architecture esercise2Case of exercise2 is
  
end exercise2Case
```

