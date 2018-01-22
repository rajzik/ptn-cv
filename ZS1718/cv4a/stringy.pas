uses strings;

const Ret : Pchar = 'Toto je příliš žluťoučká posloupnost.';

var I: byte;

function Zobraz(X: char): string;
 var Prevod: string;
 begin if X in [#0..#31, #127] then begin
          Str(ord(X), Prevod);
          Zobraz:='#'+Prevod
       end else Zobraz:=X   
 end;

begin
      for I:=0 to Length(Ret) do
         write(I,': ',zobraz((Ret+I)^),'; ');
      writeln   

end.