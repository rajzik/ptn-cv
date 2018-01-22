uses strings;

var R: Pchar; I: byte;

function Zobraz(X: char):string;
 var Pom: string;
 begin if X in [#0..#31] then begin
          str(ord(X),Pom);
          zobraz:='#'+Pom
       end else zobraz:=X
 end;

begin writeln('Velikost R v paměti je ', SizeOf(R));
      R:='Toto jsou '#10'znaky příliš žluťoučké.'; writeln(R);
      writeln('Velikost R po přiřazení v paměti je ', SizeOf(R));
      for I:=0 to Length(R) do
         write(I,': ',zobraz((R+I)^),'; ');
      writeln   
end.      