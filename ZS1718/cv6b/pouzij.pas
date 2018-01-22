uses prfronta;

var Fronta: PFronta;
    R: string;
    P: Prvek;
    Cislo: longint;

function Zpusob1(A: Prvek): string;
 var Pom: string;
 begin inc(Cislo);
       Str(Cislo:5, Pom);
       Zpusob1:=Pom+': '+string(A^)
 end;

function PodleVelikosti(A, B: Prvek): boolean;
 begin PodleVelikosti:=string(A^)<string(B^)
 end;

begin Init(Fronta, @PodleVelikosti);
      Cislo:=0;
      while not eof do begin
         readln(R);
         GetMem(P, Length(R)+1);
         string(P^):=R;
         Vloz(Fronta, P)
      end;   
      Vypis(Fronta, @Zpusob1, output)
end.