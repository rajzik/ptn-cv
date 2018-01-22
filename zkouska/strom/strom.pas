type fce = function (A, B: typdata): boolean;

function porovnej(S: UkUzel; rel: fce): boolean;

var Je: boolean;

begin Je:=true;
      if S<>nil then begin
         je:= porovnej(S^.vlevo, rel) and
            porovnej(S^.vpravo, rel) and 
            (s^.vlevo<>nil) and rel(S^.data, S^.vlevo^.data))
            and (S^.vpravo<>nil) and rel(S^.vpravo^.data, S^.data))
      end;
      porovnej:=je
end.        