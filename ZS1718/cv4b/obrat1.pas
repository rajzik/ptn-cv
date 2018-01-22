type 
     Pole = array [1..10000] of string;
     
var P: Pole;
    I, J: word;

begin I:=0;
      while not eof do begin
        Inc(I);
        readln(P[I])
      end;
      for J:=I downto 1 do writeln(P[J])
end.     