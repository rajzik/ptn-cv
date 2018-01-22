type mnozina=set of 0..31;
var S: single;
    I: byte;
begin 
      readln(S);
      for I:=31 downto 0 do
        write(ord(I in mnozina(S)));
      writeln
end.


//======================================================
var S: single;
    I: byte;
begin 
      readln(S);
      for I:=0 to 31 do begin
        write(ord(odd(longword(S))));
        longword(S):=longword(S) shr 1
      end;
      writeln
end.

        