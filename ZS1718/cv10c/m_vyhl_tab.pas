unit m_vyhl_tab;
interface
const Max = 10000;
type 
     Umisteni = pointer;
     Prvek = pointer;
     Indexy = 1..Max;
     TypRelace = function (A, B: Prvek): shortint;
     TypHash = function (A: Prvek): Indexy;

     UkSeznam = ^Seznam;
     Seznam = record
        Data: Prvek;
        Dalsi: UkSeznam
     end;

     ZaklPole = array [Indexy] of UkSeznam;

     UkZaklPole = ^ZaklPole;

     VyhlTab = object
       HT: UkZaklPole;
       Relace: TypRelace;
       Hash: TypHash;
       constructor Start(R: TypRelace; H: TypHash);
       procedure Vloz(P: Prvek);
       function Hledej(P: Prvek): Umisteni;     
       procedure Analyza(var F: text);
     end;

implementation

constructor VyhlTab.Start(R: TypRelace; H: TypHash);
 var I: Indexy;
 begin new(HT);
       for I:=1 to Max do HT^[I]:=nil;
       Relace:=R;
       Hash:=H
 end;

procedure vyhlTab.Vloz(P: Prvek);
 var Pom: UkSeznam; I: Indexy;
 begin I:=Hash(P);
       new(Pom);
       Pom^.Data:=P;
       Pom^.Dalsi:=HT^[I];
       HT^[I]:=Pom
 end;
 
function VyhlTab.Hledej(P: Prvek): Umisteni;     
 var I: Indexy; Pom: UkSeznam;
 begin I:=Hash(P);
       Pom:=HT^[I];
       while (Pom<>nil) and (Relace(P, Pom^.Data)<>0) do
         Pom:=Pom^.Dalsi;
       if Pom=nil then Hledej:=nil
       else Hledej:=Pom^.Data  
 end;
 
procedure VyhlTab.Analyza(var F: text);
 var I: Indexy; Pom: UkSeznam; Pocet, MaxPocet, Soucet: longword;
 begin Soucet:=0; MaxPocet:=0;
       for I:=1 to Max do begin
         Pocet:=0;
         Pom:=HT^[I];
         while Pom<>nil do begin
           Inc(Pocet);
           Pom:=Pom^.Dalsi
         end;
         if Pocet>MaxPocet then MaxPocet:=Pocet;
         Soucet:=Soucet+Pocet;
       end;
       writeln(F, 'Maximální počet synonym: ', MaxPocet);
       writeln(F, 'Průměrný počet synonym: ', Soucet/Max :0:2)
 end;
 

end.