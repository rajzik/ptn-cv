
var S: single;
    I: byte;
    R: string;
begin
      readln(S);
      R:='';
      for I:=0 to 31 do begin
        R:= char(ord(odd(longword(S)))+ord('0')) + R;
        longword(S):= longword(S) shr 1
      end;
      writeln(R);
      writeln
end.