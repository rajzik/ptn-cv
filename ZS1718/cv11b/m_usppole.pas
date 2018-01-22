unit m_usppole;
interface

const MaxPole = 50000;
type 

     Prvek = pointer;
     TypRelace = function (A, B: Prvek): shortint;
     TypZobraz = function (P: Prvek): string;

     Indexy = 1..MaxPole;
     Indexy0 = 0..MaxPole;
     UkData = ^DatovePole;
     DatovePole = record
        Pole: array [Indexy] of Prvek;
        Obsaz: Indexy0
     end;   

     UspPole = object
        Data: UkData;
        Porov: TypRelace;
        constructor Init(R: TypRelace);
        procedure Vloz(P: Prvek);
        procedure Serad;
        procedure Vypis(var F: text; Z: TypZobraz); 
     end;


implementation

constructor UspPole.Init(R: TypRelace);
 begin new(Data);
       Data^.Obsaz:=0;
       Porov:=R;
 end;
 
procedure UspPole.Vloz(P: Prvek);
 begin if Data^.Obsaz<MaxPole then begin
          Inc(Data^.Obsaz);
          Data^.Pole[Data^.Obsaz]:=P
       end else writeln(StdErr, ParamStr(0), ' chyba 587: Struktura je plná.');
 end;
 
procedure UspPole.Serad;
 var Pom: Prvek;
     I, J: Indexy;
     BylaZamena: boolean;
 begin with Data^ do 
         if Obsaz>1 then begin
         J:=Obsaz-1;
         BylaZamena:=true;
         while BylaZamena do begin
            BylaZamena:=false;
            //průchod
            for I:=1 to J do
              if Porov(Pole[I],Pole[I+1])<1 then begin
                 BylaZamena:=true;
                 Pom:=Pole[I];
                 Pole[I]:=Pole[I+1];
                 Pole[I+1]:=Pom
            end;
            Dec(J)
         end;
       end
 end;
 
procedure UspPole.Vypis(var F: text; Z: TypZobraz); 
 var I: Indexy;
 begin for I:=1 to Data^.Obsaz do writeln(F, Z(Data^.Pole[I]))
 end;
 

end.