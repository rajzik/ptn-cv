type UkRet = ^string;
     Pole = array [1..10000] of UkRet;
     UkPole = ^Pole;

var P: UkPole;
    I, J: word;
    R: string;
    
begin I:=0; new(P);
      while not eof do begin
        Inc(I);
        readln(R);
        getmem(P^[I], Length(R)+1);
        P^[I]^:=R;      
      end;
      for J:=I downto 1 do writeln(P^[J]^)
end.    