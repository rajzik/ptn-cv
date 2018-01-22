unit m_vyhl_tab;
interface

const
     Max = 2000;
type 
     Prvek = pointer;
     Umisteni = pointer;

     Indexy = 1..Max;
     
     TypUsporadani = function (A, B: Prvek): shortint;
     TypHash = function (P: Prvek): Indexy;

     UkZaznam = ^Zaznam;
     Zaznam = record
        Data: Prvek;
        Dalsi: UkZaznam
     end;

     ZaklPole = array [Indexy] of UkZaznam;
     HashTab = ^ZaklPole;

     VyhlTab = object
        HT: HashTab;
        Relace: TypUsporadani;
        Hash: TypHash;
        constructor Zacni(R: TypUsporadani; H: TypHash);
        procedure Vloz(P: Prvek);
        function Hledej(P: Prvek): Umisteni;
        procedure Analyza(var F: text);     
     end;

implementation

constructor VyhlTab.Zacni(R: TypUsporadani; H: TypHash);
 var I: Indexy;
 begin Relace:=R;
       Hash:=H;
       new(HT);
       for I:=1 to Max do HT^[I]:=nil;
 end;
 
procedure VyhlTab.Vloz(P: Prvek);
 var I: Indexy; Pom: UkZaznam;
 begin I:=Hash(P);
       new(Pom);
       Pom^.Data:=P;
       Pom^.Dalsi:=HT^[I];
       HT^[I]:=Pom;
 end;
 
function VyhlTab.Hledej(P: Prvek): Umisteni;
 var I: Indexy; Pom: UkZaznam;
 begin I:=Hash(P);
       Pom:=HT^[I];
       while (Pom<>nil) and (Relace(P, Pom^.Data)<>0) do
          Pom:=Pom^.Dalsi;
       if Pom=nil then Hledej:=nil
       else Hledej:=Pom^.Data    
 end;
 
procedure VyhlTab.Analyza(var F: text);     
 var I, MaxIndex: Indexy; Pom: UkZaznam; Pocet, MaxPocet, Soucet: longword;
 begin MaxPocet:=0; Soucet:=0;
       for I:=1 to Max do begin
          Pocet:=0;
          Pom:=HT^[I];
          while Pom<>nil do begin
            Inc(Pocet);
            Pom:=Pom^.Dalsi
          end;
          Soucet:=Soucet+Pocet;
          if Pocet>MaxPocet then begin
             MaxPocet:=Pocet;
             MaxIndex:=I
          end;
       end;
       writeln(F, 'Maximální počet synonym byl: ', MaxPocet,
             ' na indexu ', MaxIndex);
       writeln(F, 'Průměrný počet synonym: ', Soucet/Max:0:2, '; počet slov: ', Soucet);
 end;
 

end.