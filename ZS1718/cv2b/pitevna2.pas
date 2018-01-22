type mnozina = set of 0..31;
var S: single;
    I: byte;
begin
      readln(S);
      for I:=31 downto 0 do 
        if I in mnozina(S) then
          write(1) 
        else 
          write(0);
      writeln
end.