type 
     Pole = array [1..10000] of string;
     UkPole = ^Pole;
     
var P: UkPole;
    I, J: word;

begin I:=0; new(P);
      while not eof do begin
        Inc(I);
        readln(P^[I])
      end;
      for J:=I downto 1 do writeln(P^[J])
end.     