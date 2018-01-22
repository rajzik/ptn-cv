unit hashtable;
interface

const Max = 300;

type 

     Prvek = pointer;
     Umisteni = pointer;
     TypUsporadani = function (A, B: Prvek): shortint;

     UkZaznam = ^Zaznam;
     Zaznam = record
       Data: Prvek;
       Dalsi: UkZaznam;     
     end;

     Indexy = 1..Max;
     ZaklPole = array [Indexy] of UkZaznam;

     TypHash = function (X: Prvek): Indexy;
     
     HashTab = ^ZaklPole;

     VyhlTab = object
       HT: HashTab;
       HF: TypHash;
       Relace: TypUsporadani;
       constructor Zacni(R: TypUsporadani; H: TypHash);
       procedure Vloz(P: Prvek);
       function Hledej(P: Prvek): Umisteni;
       procedure Analyza(var F: text);
     end;



implementation

constructor VyhlTab.Zacni(R: TypUsporadani; H: TypHash);
 var I: Indexy;
 begin HF:=H;
       Relace:=R;
       new(HT);
       for I:=1 to Max do HT^[I]:=nil;
 end;

procedure VyhlTab.Vloz(P: Prvek);
 var I: Indexy; Pom: UkZaznam;
 begin I:=HF(P);
       new(Pom);
       Pom^.Data:=P;
       Pom^.Dalsi:=HT^[I];
       HT^[I]:=Pom
 end;

function VyhlTab.Hledej(P: Prvek): Umisteni;
 var I: Indexy; Pom: UkZaznam;
 begin I:=HF(P);
       Pom:=HT^[I];
       while (Pom<>nil) and (Relace(P, Pom^.Data)<>0) do
          Pom:=Pom^.Dalsi;
       if Pom=nil then Hledej:=nil
       else Hledej:=Pom^.Data
 end;

procedure VyhlTab.Analyza(var F: text);
 var I, MaxIndex: Indexy; MaxPocet, Pocet: longword;
     Pom: UkZaznam;
 begin MaxPocet:=0;
       for I:=1 to Max do begin
          Pocet:=0;
          Pom:=HT^[I];
          while Pom<>nil do begin
            Inc(Pocet);
            Pom:=Pom^.Dalsi
          end;
          if Pocet>MaxPocet then begin
             MaxPocet:=Pocet;
             MaxIndex:=I
          end;
       end;
       writeln(F, 'Maximální počet synonym byl ', MaxPocet,
               ' na indexu ', MaxIndex);
 end;


end.