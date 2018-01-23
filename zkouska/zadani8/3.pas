{
3. 
V textovém souboru je text knihy v kódování ISO Latin 2. 
Navrhněte tabulku s rozptýlenými hesly, 
která bude uchovávat všechna slova této publikace s počty jejich výskytů v textu. 
Napište podprogram, který následně vypíše obsah celé tabulky.
}

    
unit m_vyhl_tab;
interface
const Max = 10000;
type 
     Umisteni = pointer;
     Prvek = pointer;
     Indexy = 1..Max;
     TypHash = function (A: Prvek): Indexy;
     TypRelace = function (A, B: Prvek): shortint;
     TypVypis = function(A: Prvek) : string;


     UkSeznam = ^Seznam;
     Seznam = record
        Data: Prvek;
        Dalsi: UkSeznam
     end;

     ZaklPole = array [Indexy] of UkSeznam;

     UkZaklPole = ^ZaklPole;

     VyhlTab = object
       HT: UkZaklPole;
       Hash: TypHash;
       Relace: TypRelace;

       constructor Start(R: TypRelace; H: TypHash);
       procedure Vloz(P: Prvek);
       function Hledej(P: Prvek): Umisteni;     
       procedure Analyza(var F: text, jak: TypVypis);
     end;

implementation

constructor VyhlTab.Start(R: TypRelace; H: TypHash);
 var I: Indexy;
 begin new(HT);
       for I:=1 to Max do HT^[I]:=nil;
       Hash:=H;
       Relace:=R;
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
 

procedure VyhlTab.Analyza(var F: text, jak: TypVypis);
 var I: Indexy; Pom: UkSeznam; Pocet, MaxPocet, Soucet: longword;
 begin 
    Soucet:=0; MaxPocet:=0;
    for I:=1 to Max do begin
        Pocet:=0;
        Pom:=HT^[I];
        while Pom<>nil do begin
            Inc(Pocet);
            Pom:=Pom^.Dalsi
        end;
        writeln(F, I, ' - ', jak(Pom))
    end;
 end;
 

end.


{
    dalsi soubor
} 

program dasdas;


type TypData = record
       Slovo: ansistring;
       Vyskytu: longword;
     end;  
    pData = ^TypData;

function Porovnani(A, B: Prvek): shortint;
 var X, Y: string;
 begin X:=TypData(A^).Slovo;
       Y:=TypData(B^).Slovo;
       if X<Y then Porovnani:=-1
       else if X=Y then Porovnani:=0
            else Porovnani:=1 
 end;

 function Rozptyluj(A: Prvek): Indexy;
 var X: string; Soucet: longword; I: byte;
 begin X:=TypData(A^).Slovo;
       if X='' then Rozptyluj:=1
       else begin
         Soucet:=0;
         for I:=1 to Length(X) do Soucet:=Soucet+ord(X[I])*I;
         Rozptyluj:=Soucet mod Max + 1
       end;
 end; 

function vypis(A: Prvek): string;
begin
      vypis := TypData(A^).Slovo;
      vypis := vypis + ': ';
      vypis := vypis + TypData(A^).Vyskytu;
end;


 begin
     VT.start(@Porovnani, @Rozptyluj);
    while not eof do begin
         R:=DejSlovo(input);
         // Vytvoření ukazatele P na potřebná data
         new(P);
         P^.Slovo:=R;
         P^.Vyskytu:=1;
         Kde:=VT.Hledej(Prvek(P));
         if Kde=nil then VT.Vloz(Prvek(P))
         else begin // bylo nalezeno -> zvýšíme počet výskytů
            Inc(Typdata(Kde^).Vyskytu);
            dispose(P)
         end
      end;
      VT.Analyza(output, @vypis);
 end.