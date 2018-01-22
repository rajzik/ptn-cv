{Ze vstupního textu vyextrahujte všechna slova a vložte je
do uspořádaného binárního stromu. Vypište slova na standardní
výstup v abecedním (kódovém) pořadí.
}

uses m_strom_obj, slova;

var S: Strom;
    cislo: longword;

type UnikStrom = object(Strom)
       constructor Start(R: TypRelace);
       procedure Vloz(P: Prvek); virtual;
     end;
     
constructor UnikStrom.Start(R: TypRelace);
 begin inherited Start(R)
 end;
     
procedure UnikStrom.Vloz(P: Prvek);
 begin if not Vyhledej(P) then 
          inherited Vloz(P)
 end;

var U: UnikStrom;

function MojeSrovnani(X, Y: Prvek): shortint;
 begin if string(X^)>string(Y^) then MojeSrovnani:=1
          else if string(X^)=string(Y^) then MojeSrovnani:=0
               else MojeSrovnani:=-1
 end;

function JakZobrazit(P: Prvek): string;
 var Pom: string;
 begin Inc(Cislo);
       Str(Cislo:3, Pom); 
       JakZobrazit:=Pom+': '+string(P^)
 end;

procedure Delej(X: Strom);
 var R: string; P: Prvek;
 begin
       while not eof do begin
          R:=DejSlovo(input);
          // vložení slova do stromu
          GetMem(P, Length(R)+1);
          string(P^):=R;
          X.Vloz(P)
       end;
       // výpis stromu do souboru output
       Cislo:=0;
       X.Inorder(output, @JakZobrazit);
 end;
 
begin
      // inicializace stromu
      S.Start(@MojeSrovnani);
      U.Start(@MojeSrovnani);
      Delej(U)
end.