type mnozina = set of 0..31;
var S: single;
    M: mnozina;
    I: byte;
begin 
      readln(S);
      M:=mnozina(S);
      for I:=31 downto 0 do
        if I in M then write('1')
           else write('0');
      writeln
end.            